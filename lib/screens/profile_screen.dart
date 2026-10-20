import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text('Профиль'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            // Header профиля
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 44,
                          backgroundColor: scheme.primary.withAlpha(30),
                          child: Text(
                            'К',
                            style: TextStyle(
                              color: scheme.primary,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: scheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Кристина Перепелюк',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'UTM • FCIM • Software Engineering',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: scheme.primary.withAlpha(15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Студент 4 курса • Поиск стажировки / Part-time',
                        style: TextStyle(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Карточка CV и Портфолио
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Мое резюме',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Обновить'),
                        ),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: scheme.primary.withAlpha(15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.picture_as_pdf_rounded, color: scheme.primary),
                      ),
                      title: const Text('CV_Kristina_Perepeliuc.pdf', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      subtitle: const Text('Обновлено 2 дня назад • 1.2 MB'),
                      trailing: IconButton(
                        icon: const Icon(Icons.download_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Список пунктов меню настроек
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.bookmark_outline_rounded),
                    title: const Text('Сохраненные вакансии'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEDF2F7)),
                  ListTile(
                    leading: const Icon(Icons.notifications_none_rounded),
                    title: const Text('Уведомления о вакансиях'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEDF2F7)),
                  ListTile(
                    leading: const Icon(Icons.school_outlined),
                    title: const Text('Данные университета FCIM'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEDF2F7)),
                  ListTile(
                    leading: const Icon(Icons.help_outline_rounded),
                    title: const Text('Помощь и поддержка'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Кнопка Выхода
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(color: Color(0xFFEF4444)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              icon: const Icon(Icons.logout_rounded, color: Color(0xFFEF4444), size: 18),
              label: const Text(
                'Выйти из аккаунта',
                style: TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}