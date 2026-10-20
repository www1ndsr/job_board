import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // Мягкая современная иконка/декор вверху экрана в стиле референса
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: scheme.primary.withAlpha(20),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.work_history_rounded,
                  size: 50,
                  color: scheme.primary,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'JobBoard FCIM',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: scheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Поиск IT-вакансий и стажировок для студентов',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36),

              // Текстовое поле Email
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, size: 20),
                  hintText: 'Email (например: student@fcim.utm.md)',
                ),
              ),

              const SizedBox(height: 14),

              // Текстовое поле Пароль
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, size: 20),
                  suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
                  hintText: 'Пароль',
                ),
              ),

              const SizedBox(height: 10),

              // Ссылка Забыли пароль?
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: scheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Главная кнопка Входа (Pill-shaped)
              FilledButton(
                onPressed: () {},
                child: const Text('Войти'),
              ),

              const SizedBox(height: 24),

              // Разделитель "или"
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'или',
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                    ),
                  ),
                  const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                ],
              ),

              const SizedBox(height: 20),

              // Альтернативный вход
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                icon: const Icon(Icons.school_outlined, size: 20),
                label: const Text(
                  'Войти через UTM Account',
                  style: TextStyle(color: Color(0xFF2D3748), fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 32),

              // Ссылка на Регистрацию
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Нет аккаунта? ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        color: scheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}