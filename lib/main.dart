import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'screens/landing_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MUApp());
}

class MUApp extends StatelessWidget {
  const MUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahindra University',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto', // Or whatever font you prefer
      ),
      home: const LandingScreen(),
    );
  }
}