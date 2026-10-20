class JobPost {
  final String id;
  final String title;
  final String company;
  final String salaryRange;
  final List<String> techStack;
  final String schedule; // e.g., "Part-time", "Internship", "Remote"
  final String description;

  const JobPost({
    required this.id,
    required this.title,
    required this.company,
    required this.salaryRange,
    required this.techStack,
    required this.schedule,
    required this.description,
  });
}

class Application {
  final String id;
  final String jobPostId;
  final String jobTitle;
  final String company;
  final String cvUrl;
  final String message;
  final String status; // отправлен / просмотрен / интервью / отказ

  const Application({
    required this.id,
    required this.jobPostId,
    required this.jobTitle,
    required this.company,
    required this.cvUrl,
    required this.message,
    required this.status,
  });
}

class UserProfile {
  final String name;
  final String email;
  final String university;
  final String faculty;
  final List<String> skills;

  const UserProfile({
    required this.name,
    required this.email,
    required this.university,
    required this.faculty,
    required this.skills,
  });
}

// Зашитые данные (Mock Data) согласно спецификации (не менее 6 элементов)
const List<JobPost> mockJobPosts = [
  JobPost(
    id: '1',
    title: 'Junior C# / .NET Developer',
    company: 'Endava',
    salaryRange: '800 - 1200 EUR',
    techStack: ['C#', '.NET Core', 'PostgreSQL', 'Docker'],
    schedule: 'Part-time (20h/week)',
    description: 'Ищем студента старших курсов для разработки backend микросервисов. Гибкий график, совмещение с учёбой.',
  ),
  JobPost(
    id: '2',
    title: 'Flutter Mobile Intern',
    company: 'Cegeka',
    salaryRange: '600 - 900 EUR',
    techStack: ['Flutter', 'Dart', 'REST API', 'Git'],
    schedule: 'Internship (Remote)',
    description: 'Стажировка по кроссплатформенной разработке мобильных приложений. Обучение под руководством ментора.',
  ),
  JobPost(
    id: '3',
    title: 'Node.js / NestJS Backend Developer',
    company: 'Amdaris',
    salaryRange: '1000 - 1400 EUR',
    techStack: ['TypeScript', 'NestJS', 'Redis', 'PostgreSQL'],
    schedule: 'Part-time',
    description: 'Разработка высоконагруженных API и интеграция с внешними сервисами.',
  ),
  JobPost(
    id: '4',
    title: 'Frontend Developer (React / TS)',
    company: 'Pentalog',
    salaryRange: '900 - 1300 EUR',
    techStack: ['React', 'TypeScript', 'Tailwind CSS'],
    schedule: 'Remote',
    description: 'Поддержка и развитие пользовательских интерфейсов веб-приложений.',
  ),
  JobPost(
    id: '5',
    title: 'QA Automation Engineer',
    company: 'MIXBOOK',
    salaryRange: '700 - 1100 EUR',
    techStack: ['Python', 'Selenium', 'Postman'],
    schedule: 'Part-time',
    description: 'Написание автоматизированных тестов для REST API и пользовательского интерфейса.',
  ),
  JobPost(
    id: '6',
    title: 'Junior DevOps Engineer',
    company: 'Ellation',
    salaryRange: '900 - 1300 EUR',
    techStack: ['Docker', 'GitHub Actions', 'Linux', 'Bash'],
    schedule: 'Part-time (20h/week)',
    description: 'Настройка CI/CD пайплайнов и мониторинг контейнеризированных приложений.',
  ),
];

const List<Application> mockApplications = [
  Application(
    id: 'app_1',
    jobPostId: '1',
    jobTitle: 'Junior C# / .NET Developer',
    company: 'Endava',
    cvUrl: 'cv_kristina_2026.pdf',
    message: 'Здравствуйте! Я студентка 4 курса FCIM, имею опыт работы с C# и ASP.NET Core.',
    status: 'интервью',
  ),
  Application(
    id: 'app_2',
    jobPostId: '2',
    jobTitle: 'Flutter Mobile Intern',
    company: 'Cegeka',
    cvUrl: 'cv_kristina_2026.pdf',
    message: 'Заинтересована в стажировке по Flutter. Изучаю мобильную разработку.',
    status: 'просмотрен',
  ),
  Application(
    id: 'app_3',
    jobPostId: '3',
    jobTitle: 'Node.js / NestJS Backend Developer',
    company: 'Amdaris',
    cvUrl: 'cv_kristina_2026.pdf',
    message: 'Есть коммерческий опыт с NestJS и PostgreSQL.',
    status: 'отправлен',
  ),
  Application(
    id: 'app_4',
    jobPostId: '4',
    jobTitle: 'Frontend Developer (React / TS)',
    company: 'Pentalog',
    cvUrl: 'cv_kristina_2026.pdf',
    message: 'Откликаюсь на вакансию Frontend разработчика.',
    status: 'отказ',
  ),
];

const UserProfile mockUserProfile = UserProfile(
  name: 'Кристина',
  email: 'kristina@student.utm.md',
  university: 'Технический Университет Молдовы (UTM)',
  faculty: 'FCIM — Software Engineering',
  skills: ['C#', '.NET Core', 'Flutter', 'TypeScript', 'Docker', 'PostgreSQL', 'Git'],
);