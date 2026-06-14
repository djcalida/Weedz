import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../providers/favorites_provider.dart';
import '../providers/cart_provider.dart';

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
                    onPressed: () {
                      _showComingSoonDialog(context, 'Edit Profile');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stats Cards
            Consumer2<CartProvider, FavoritesProvider>(
              builder: (context, cart, favorites, child) {
                return Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '0',
                        'Orders',
                        Icons.shopping_bag_outlined,
                        AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '${favorites.favoriteCount}',
                        'Wishlist',
                        Icons.favorite_border,
                        AppColors.danger,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '₱0',
                        'Spent',
                        Icons.account_balance_wallet_outlined,
                        AppColors.success,
                      ),
                    ),
                  ],
                );
              },
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
                  () => _showComingSoonDialog(context, 'Personal Information'),
                ),
                _buildMenuItem(
                  Icons.location_on_outlined,
                  'Addresses',
                  'Manage shipping addresses',
                  () => _showComingSoonDialog(context, 'Addresses'),
                ),
                _buildMenuItem(
                  Icons.credit_card_outlined,
                  'Payment Methods',
                  'Manage payment options',
                  () => _showComingSoonDialog(context, 'Payment Methods'),
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
                  () => _showComingSoonDialog(context, 'Order History'),
                ),
                _buildMenuItem(
                  Icons.favorite_border,
                  'Wishlist',
                  'View saved items',
                  () => _showWishlistDialog(context),
                ),
                _buildMenuItem(
                  Icons.star_border,
                  'Reviews',
                  'Your product reviews',
                  () => _showComingSoonDialog(context, 'Reviews'),
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
                  () => _showComingSoonDialog(context, 'Notifications'),
                ),
                _buildMenuItem(
                  Icons.security_outlined,
                  'Security',
                  'Password & security',
                  () => _showComingSoonDialog(context, 'Security'),
                ),
                _buildMenuItem(
                  Icons.language_outlined,
                  'Language',
                  'English (US)',
                  () => _showComingSoonDialog(context, 'Language Settings'),
                ),
                _buildMenuItem(
                  Icons.dark_mode_outlined,
                  'Theme',
                  'Light mode',
                  () => _showComingSoonDialog(context, 'Theme Settings'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildSection(
              context,
              'Support',
              [
                _buildMenuItem(
                  Icons.chat_bubble_outline,
                  'Customer Chat',
                  'Chat with our support team',
                  () {
                    Navigator.pushNamed(context, '/chat');
                  },
                ),
                _buildMenuItem(
                  Icons.help_outline,
                  'Help Center',
                  'FAQs and support',
                  () => _showComingSoonDialog(context, 'Help Center'),
                ),
                _buildMenuItem(
                  Icons.feedback_outlined,
                  'Feedback',
                  'Send us your feedback',
                  () => _showComingSoonDialog(context, 'Feedback'),
                ),
                _buildMenuItem(
                  Icons.info_outline,
                  'About',
                  'Version 1.0.0+2',
                  () => _showAboutDialog(context),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showLogoutDialog(context),
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

  static void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.construction, color: AppColors.accent),
            const SizedBox(width: 12),
            Text(feature),
          ],
        ),
        content: const Text(
          'This feature is coming soon! We\'re working hard to bring you the best experience.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  static void _showWishlistDialog(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context, listen: false);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.favorite, color: AppColors.danger),
            SizedBox(width: 12),
            Text('Your Wishlist'),
          ],
        ),
        content: Text(
          favorites.favoriteCount > 0
              ? 'You have ${favorites.favoriteCount} item${favorites.favoriteCount == 1 ? '' : 's'} in your wishlist.\n\nBrowse the shop to see your saved items!'
              : 'Your wishlist is empty.\n\nTap the heart icon on products to save them here!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (favorites.favoriteCount > 0)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to shop tab
              },
              child: const Text('Browse Shop'),
            ),
        ],
      ),
    );
  }

  static void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.info, color: AppColors.accent),
            SizedBox(width: 12),
            Text('About Wedzz'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wedzz Motorparts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Version 1.0.0+2'),
            SizedBox(height: 16),
            Text(
              'Premium automotive parts and accessories for your vehicle. Quality you can trust.',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 16),
            Text(
              '© 2026 Wedzz Motorparts. All rights reserved.',
              style: TextStyle(fontSize: 11, color: AppColors.textMuted),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout, color: AppColors.danger),
            SizedBox(width: 12),
            Text('Logout'),
          ],
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
