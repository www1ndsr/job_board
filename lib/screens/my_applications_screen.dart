import 'package:flutter/material.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    // Мок-данные для списка откликов
    final applications = [
      {
        'title': 'Junior .NET / C# Developer',
        'company': 'Endava',
        'date': '04 Октября 2026',
        'status': 'На рассмотрении',
        'statusColor': const Color(0xFFD97706),
        'statusBg': const Color(0xFFFEF3C7),
      },
      {
        'title': 'Flutter Mobile Developer Intern',
        'company': 'Pentalog',
        'date': '28 Сентября 2026',
        'status': 'Приглашение на интервью',
        'statusColor': const Color(0xFF16A34A),
        'statusBg': const Color(0xFFDCFCE7),
      },
      {
        'title': 'Full-Stack Node.js / React Intern',
        'company': 'Cegeka',
        'date': '15 Сентября 2026',
        'status': 'Архив / Отказ',
        'statusColor': const Color(0xFF64748B),
        'statusBg': const Color(0xFFF1F5F9),
      },
      {
        'title': 'QA Automation Engineer',
        'company': 'Amdaris',
        'date': '01 Сентября 2026',
        'status': 'На рассмотрении',
        'statusColor': const Color(0xFFD97706),
        'statusBg': const Color(0xFFFEF3C7),
      },
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text('Мои отклики'),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: scheme.primary,
            labelColor: scheme.primary,
            unselectedLabelColor: const Color(0xFF64748B),
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            tabs: const [
              Tab(text: 'Все (4)'),
              Tab(text: 'На рассмотрении (2)'),
              Tab(text: 'Интервью (1)'),
              Tab(text: 'Архив (1)'),
            ],
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: applications.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final app = applications[index];
            final statusColor = app['statusColor'] as Color;
            final statusBg = app['statusBg'] as Color;

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: scheme.primary.withAlpha(20),
                          child: Text(
                            (app['company'] as String)[0],
                            style: TextStyle(
                              color: scheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                app['title'] as String,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                app['company'] as String,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert_rounded, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFEDF2F7)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Дата отправки
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_rounded, size: 14, color: Color(0xFF94A3B8)),
                            const SizedBox(width: 6),
                            Text(
                              app['date'] as String,
                              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),

                        // Чип статуса
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            app['status'] as String,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}