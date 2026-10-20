import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    
    // Берём первую вакансию из мок-данных для демонстрации
    final job = mockJobPosts.first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text('Детали вакансии'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Шапка компании и должности
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: scheme.primary.withAlpha(25),
                      child: Text(
                        job.company[0].toUpperCase(),
                        style: TextStyle(
                          color: scheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      job.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${job.company} • ${job.schedule}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: scheme.primary.withAlpha(15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        job.salaryRange,
                        style: TextStyle(
                          color: scheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Стек технологий
            Text(
              'Стек технологий',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: job.techStack.map((tech) {
                return Chip(
                  label: Text(tech),
                  backgroundColor: scheme.surfaceContainerHighest,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Описание вакансии
            Text(
              'Описание и требования',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              job.description,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '• Опыт работы с версионированием кода (Git)\n'
              '• Понимание базовых принципов OOP и Clean Code\n'
              '• Готовность уделять от 20 часов в неделю\n'
              '• Желание развиваться в команде под руководством ментора',
              style: TextStyle(height: 1.6, color: Color(0xFF4A5568)),
            ),

            const SizedBox(height: 32),

            // Главная кнопка Откликнуться
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text('Откликнуться на вакансию'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}