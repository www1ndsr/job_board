import 'package:flutter/material.dart';

class ApplyFormScreen extends StatefulWidget {
  const ApplyFormScreen({super.key});

  @override
  State<ApplyFormScreen> createState() => _ApplyFormScreenState();
}

class _ApplyFormScreenState extends State<ApplyFormScreen> {
  bool _isStudentUtm = true;
  bool _readyForTask = true;
  String? _selectedFileName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text('Отклик на вакансию'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Карточка выбранной вакансии
            Card(
              color: scheme.primary.withAlpha(10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: scheme.primary,
                      child: const Icon(Icons.work_rounded, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Junior .NET / C# Developer',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Endava • Part-time',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Личные данные',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Поле: Имя и Фамилия
            const TextField(
              decoration: InputDecoration(
                labelText: 'Имя и Фамилия',
                hintText: 'Кристина Перепелюк',
                prefixIcon: Icon(Icons.person_outline_rounded, size: 20),
              ),
            ),

            const SizedBox(height: 14),

            // Поле: Email
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'student@fcim.utm.md',
                prefixIcon: Icon(Icons.email_outlined, size: 20),
              ),
            ),

            const SizedBox(height: 14),

            // Поле: Телефон
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Телефон',
                hintText: '+373 60 000 000',
                prefixIcon: Icon(Icons.phone_outlined, size: 20),
              ),
            ),

            const SizedBox(height: 14),

            // Поле: Ссылка на GitHub / Портфолио
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ссылка на GitHub / LinkedIn',
                hintText: 'https://github.com/username',
                prefixIcon: Icon(Icons.link_rounded, size: 20),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Резюме и сопроводительное письмо',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Блок загрузки файла CV
            InkWell(
              onTap: () {
                setState(() {
                  _selectedFileName = 'CV_Kristina_Perepeliuc.pdf';
                });
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _selectedFileName != null ? scheme.primary : const Color(0xFFE2E8F0),
                    width: _selectedFileName != null ? 1.5 : 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      _selectedFileName != null ? Icons.check_circle_rounded : Icons.cloud_upload_outlined,
                      size: 36,
                      color: _selectedFileName != null ? scheme.primary : const Color(0xFF94A3B8),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _selectedFileName ?? 'Загрузить файл резюме (PDF)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _selectedFileName != null ? scheme.primary : const Color(0xFF4A5568),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _selectedFileName != null ? 'Нажмите, чтобы заменить' : 'Максимальный размер: 10 МБ',
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Поле: Сопроводительное письмо
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Напишите кратко, почему вы заинтересованы в этой позиции...',
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 20),

            // Чекбоксы / Свитчи
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: _isStudentUtm,
              title: const Text('Я являюсь студентом FCIM / UTM'),
              activeThumbColor: scheme.primary,
              onChanged: (val) {
                setState(() => _isStudentUtm = val);
              },
            ),

            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: _readyForTask,
              title: const Text('Готов(а) к выполнению тестового задания'),
              activeThumbColor: scheme.primary,
              onChanged: (val) {
                setState(() => _readyForTask = val);
              },
            ),

            const SizedBox(height: 28),

            // Кнопка отправки
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Отклик успешно отправлен!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text('Отправить отклик'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}