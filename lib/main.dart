import 'package:flutter/material.dart';

// Импорт экранов
import 'screens/auth_screen.dart';
import 'screens/job_list_screen.dart';
import 'screens/job_detail_screen.dart';
import 'screens/apply_form_screen.dart';
import 'screens/my_applications_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const JobBoardApp());
}

class JobBoardApp extends StatelessWidget {
  const JobBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF1E88E5);
    const bgLight = Color(0xFFF7F9FC);

    return MaterialApp(
      title: 'JobBoard FCIM',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        // Общий светлый фон приложения
        scaffoldBackgroundColor: bgLight,

        // Основная цветовая схема
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          primary: primaryBlue,
          surface: Colors.white,
          surfaceContainerHighest: const Color(0xFFEEF2F6),
          brightness: Brightness.light,
        ),

        // Основной шрифт
        fontFamily: 'Roboto',

        // Общий стиль текста
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A202C),
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A202C),
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF4A5568),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF718096),
          ),
        ),

        // Общий стиль полей ввода
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: primaryBlue,
              width: 1.5,
            ),
          ),
        ),

        // Общий стиль карточек
        // CardThemeData используется в твоей версии Flutter
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color(0xFFEDF2F7),
              width: 1,
            ),
          ),
        ),

        // Общий стиль основных кнопок
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Приложение начинается с экрана авторизации
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AuthScreen(),
    const JobListScreen(),
    const JobDetailScreen(),
    const ApplyFormScreen(),
    const MyApplicationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      // Нижняя навигация
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,

        // Визуальное оформление NavigationBar
        backgroundColor: Colors.white,
        elevation: 3,
        indicatorColor: const Color(0xFFE3F2FD),

        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.login_rounded),
            label: 'Вход',
          ),

          NavigationDestination(
            icon: Icon(Icons.work_outline_rounded),
            selectedIcon: Icon(Icons.work_rounded),
            label: 'Вакансии',
          ),

          NavigationDestination(
            // Используем description, так как description_outline
            // отсутствует в твоей версии Flutter
            icon: Icon(Icons.description),
            selectedIcon: Icon(Icons.description),
            label: 'Детали',
          ),

          NavigationDestination(
            icon: Icon(Icons.send_outlined),
            selectedIcon: Icon(Icons.send_rounded),
            label: 'Отклик',
          ),

          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment_rounded),
            label: 'Отклики',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}