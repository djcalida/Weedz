import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.darkGradient,
                borderRadius: BorderRadius.circular(16),
                boxShadow: AppTheme.shadowMd,
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.dark,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guest User',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'guest@wedzz.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    '12',
                    'Orders',
                    Icons.shopping_bag_outlined,
                    AppColors.accent,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    '8',
                    'Wishlist',
                    Icons.favorite_border,
                    AppColors.danger,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    '\$2.4k',
                    'Spent',
                    Icons.account_balance_wallet_outlined,
                    AppColors.success,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Menu Items
            _buildSection(
              context,
              'Account',
              [
                _buildMenuItem(
                  Icons.person_outline,
                  'Personal Information',
                  'Update your details',
                  () {},
                ),
                _buildMenuItem(
                  Icons.location_on_outlined,
                  'Addresses',
                  'Manage shipping addresses',
                  () {},
                ),
                _buildMenuItem(
                  Icons.credit_card_outlined,
                  'Payment Methods',
                  'Manage payment options',
                  () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildSection(
              context,
              'Orders & Activity',
              [
                _buildMenuItem(
                  Icons.receipt_long_outlined,
                  'Order History',
                  'View all your orders',
                  () {},
                ),
                _buildMenuItem(
                  Icons.favorite_border,
                  'Wishlist',
                  'View saved items',
                  () {},
                ),
                _buildMenuItem(
                  Icons.star_border,
                  'Reviews',
                  'Your product reviews',
                  () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildSection(
              context,
              'Settings',
              [
                _buildMenuItem(
                  Icons.notifications_outlined,
                  'Notifications',
                  'Manage notifications',
                  () {},
                ),
                _buildMenuItem(
                  Icons.security_outlined,
                  'Security',
                  'Password & security',
                  () {},
                ),
                _buildMenuItem(
                  Icons.language_outlined,
                  'Language',
                  'English (US)',
                  () {},
                ),
                _buildMenuItem(
                  Icons.dark_mode_outlined,
                  'Theme',
                  'Light mode',
                  () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildSection(
              context,
              'Support',
              [
                _buildMenuItem(
                  Icons.help_outline,
                  'Help Center',
                  'FAQs and support',
                  () {},
                ),
                _buildMenuItem(
                  Icons.feedback_outlined,
                  'Feedback',
                  'Send us your feedback',
                  () {},
                ),
                _buildMenuItem(
                  Icons.info_outline,
                  'About',
                  'Version 1.0.0',
                  () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.danger, width: 2),
                  foregroundColor: AppColors.danger,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.shadowSm,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.shadowSm,
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: AppColors.textPrimary),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textMuted,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: AppColors.textMuted,
      ),
      onTap: onTap,
    );
  }
}
