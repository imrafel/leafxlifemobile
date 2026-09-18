import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CareTaskCard extends StatelessWidget {
  final IconData icon;
  final String plantName;
  final String task;
  final String time;
  final bool completed;
  final VoidCallback? onTap;

  const CareTaskCard({
    super.key,
    required this.icon,
    required this.plantName,
    required this.task,
    required this.time,
    this.completed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.softGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 3),
                Text(
                  '$task · $time',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: completed
                    ? AppColors.primary
                    : AppColors.softGreen,
                shape: BoxShape.circle,
              ),
              child: Icon(
                completed
                    ? Icons.check_rounded
                    : Icons.check_rounded,
                size: 20,
                color: completed
                    ? Colors.white
                    : AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}