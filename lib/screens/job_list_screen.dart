import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/job_card.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    // Список популярных фильтров для IT-студентов
    final filters = [
      'Все',
      'Part-time',
      'Internship',
      'Remote',
      'C# / .NET',
      'Flutter',
      'TypeScript',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Поиск вакансий',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Для студентов FCIM • UTM',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 18,
              backgroundColor: scheme.primary.withAlpha(20),
              child: Icon(
                Icons.notifications_none_rounded,
                color: scheme.primary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),

          // 1. Поле поиска
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск по должности, навыкам или компании...',
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 22,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.tune_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 2. Горизонтальный список фильтров
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = index == 0;

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? scheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? scheme.primary
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      filters[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF4A5568),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // 3. Список вакансий
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemCount: mockJobPosts.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final job = mockJobPosts[index];

                return JobCard(
                  job: job,
                  onTap: () {
                    // На этапе L2 переход пока не реализован.
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}