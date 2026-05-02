import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import 'webview_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void _open(BuildContext ctx, String title, String url) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => WebViewScreen(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA9A9A9), Colors.white],
            stops: [0.75, 1.0], // Stays solid grey for 3/4ths, then fades to white
          ),
        ),
        child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              
              // Logo/Header Area
              Container(
                height: 140, // Increased size for better clarity
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high, // Ensures crisp text scaling
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to icon if image is missing
                    return Container(
                      width: 100,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(flex: 3),
              
              // Buttons
              _MenuButton(
                icon: Icons.language_rounded,
                title: 'About - Mahindra University',
                subtitle: 'Official University Website',
                color: AppColors.primary,
                onTap: () => _open(
                  ctx, 
                  'Mahindra University', 
                  'https://www.mahindrauniversity.edu.in/'
                ),
              ),
              const SizedBox(height: 16),
              
              _MenuButton(
                icon: Icons.person_rounded,
                title: 'Login as Student',
                subtitle: 'Student ERP Portal',
                color: const Color(0xFF1D4ED8), // Blue
                onTap: () => _open(
                  ctx, 
                  'Student Portal', 
                  'https://muerp.mahindrauniversity.edu.in/'
                ),
              ),
              const SizedBox(height: 16),
              
              _MenuButton(
                icon: Icons.family_restroom_rounded,
                title: 'Login as Parent',
                subtitle: 'Parent ERP Portal',
                color: const Color(0xFF059669), // Green
                onTap: () => _open(
                  ctx, 
                  'Parent Portal', 
                  'https://muerp.mahindrauniversity.edu.in/'
                ),
              ),
              
              const Spacer(flex: 1),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.15), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, 
                 color: AppColors.textSecondary.withValues(alpha: 0.5)),
          ],
        ),
      ),
    );
  }
}
