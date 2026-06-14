import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class PageLoader extends StatelessWidget {
  final String? message;

  const PageLoader({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColors.accent,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Simulates a network fetch until the real API is connected.
Future<void> simulatePageFetch([Duration delay = const Duration(milliseconds: 800)]) {
  return Future.delayed(delay);
}
