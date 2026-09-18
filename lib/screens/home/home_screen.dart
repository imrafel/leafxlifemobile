import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/care_task_card.dart';
import '../../widgets/stat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool monsteraCompleted = false;
  bool basilCompleted = false;
  bool pothosCompleted = false;

  int get completedTasks {
    int total = 0;

    if (monsteraCompleted) total++;
    if (basilCompleted) total++;
    if (pothosCompleted) total++;

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          110,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const SizedBox(height: 30),

            Text(
              'Buenos días 🌱',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 5),

            Text(
              'Tus plantas tienen algunas tareas para hoy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 25),

            _buildTodaySummary(),

            const SizedBox(height: 30),

            _buildSectionTitle(
              'Cuidados de hoy',
              '${3 - completedTasks} pendientes',
            ),

            const SizedBox(height: 14),

            CareTaskCard(
              icon: Icons.water_drop_outlined,
              plantName: 'Monstera',
              task: 'Regar',
              time: 'Hoy',
              completed: monsteraCompleted,
              onTap: () {
                setState(() {
                  monsteraCompleted = !monsteraCompleted;
                });
              },
            ),

            CareTaskCard(
              icon: Icons.eco_outlined,
              plantName: 'Albahaca',
              task: 'Fertilizar',
              time: 'Hoy',
              completed: basilCompleted,
              onTap: () {
                setState(() {
                  basilCompleted = !basilCompleted;
                });
              },
            ),

            CareTaskCard(
              icon: Icons.visibility_outlined,
              plantName: 'Pothos',
              task: 'Revisar hojas',
              time: 'Hoy',
              completed: pothosCompleted,
              onTap: () {
                setState(() {
                  pothosCompleted = !pothosCompleted;
                });
              },
            ),

            const SizedBox(height: 28),

            _buildSectionTitle(
              'Tus plantas',
              'Ver todas',
            ),

            const SizedBox(height: 14),

            const Row(
              children: [
                StatCard(
                  value: '12',
                  label: 'Plantas',
                  icon: Icons.local_florist_outlined,
                ),

                SizedBox(width: 10),

                StatCard(
                  value: '3',
                  label: 'Cuidados hoy',
                  icon: Icons.water_drop_outlined,
                ),

                SizedBox(width: 10),

                StatCard(
                  value: '9',
                  label: 'Al día',
                  icon: Icons.check_circle_outline,
                ),
              ],
            ),

            const SizedBox(height: 30),

            _buildNextCare(),

            const SizedBox(height: 25),

            _buildTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Leaf X Life',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                'PLANTAS PARA UNA VIDA MEJOR',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9,
                      letterSpacing: 1.6,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
        ),

        _headerButton(
          Icons.notifications_none_rounded,
        ),

        const SizedBox(width: 10),

        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: AppColors.softGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_outline_rounded,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _headerButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildTodaySummary() {
    final progress = completedTasks / 3;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.eco_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Cuidados de hoy',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            '$completedTasks de 3 completados',
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    String action,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        Text(
          action,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildNextCare() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.softGreen,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: AppColors.primary,
            size: 30,
          ),

          SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Próximo cuidado',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Regar Lavanda · Mañana',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildTip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            color: AppColors.primary,
          ),

          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consejo Leaf X Life',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Antes de regar, revisa la humedad de la tierra. No todas las plantas necesitan agua con la misma frecuencia.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}