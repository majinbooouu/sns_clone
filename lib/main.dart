import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/firebase_options.dart';
import 'package:sns_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: SnsClone()));
}

class SnsClone extends ConsumerWidget {
  const SnsClone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'SNS Clone',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.black, // 주요 작업 요소의 변형 색상
          secondary: Colors.green, // 보조 작업 요소의 변형 색상
          background: Colors.white, // 배경색
          surface: Colors.grey, // 표면 색상
          error: Colors.red, // 오류 색상
          onPrimary: Colors.white, // 주요 작업 요소 위의 텍스트 색상
          onSecondary: Colors.black, // 보조 작업 요소 위의 텍스트 색상
          onBackground: Colors.black, // 배경 위의 텍스트 색상
          onSurface: Colors.grey, // 표면 위의 텍스트 색상
          onError: Colors.white, // 오류 메시지 위의 텍스트 색상
          brightness: Brightness.dark, // 밝은 테마 사용
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.white, // 앱 바 배경색
          elevation: 0, // 앱 바 그림자 크기
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.black, // 주요 작업 요소의 변형 색상
          secondary: Colors.green, // 보조 작업 요소의 변형 색상
          background: Colors.white, // 배경색
          surface: Colors.grey, // 표면 색상
          error: Colors.red, // 오류 색상
          onPrimary: Colors.white, // 주요 작업 요소 위의 텍스트 색상
          onSecondary: Colors.black, // 보조 작업 요소 위의 텍스트 색상
          onBackground: Colors.black, // 배경 위의 텍스트 색상
          onSurface: Colors.grey.shade100, // 표면 위의 텍스트 색상
          onError: Colors.white, // 오류 메시지 위의 텍스트 색상
          brightness: Brightness.dark, // 밝은 테마 사용
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.grey.shade900,
          elevation: 0,
        ),
      ),
    );
  }
}
