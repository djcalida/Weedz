import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../core/constants/app_colors.dart';
import '../providers/cart_provider.dart';
import 'home_screen.dart';
import 'shop_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.dark.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.textMuted,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              activeIcon: Icon(Icons.grid_view),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return cart.itemCount > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            '${cart.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: AppColors.accent,
                          ),
                          child: const Icon(Icons.shopping_cart_outlined),
                        )
                      : const Icon(Icons.shopping_cart_outlined);
                },
              ),
              activeIcon: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return cart.itemCount > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            '${cart.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: AppColors.accent,
                          ),
                          child: const Icon(Icons.shopping_cart),
                        )
                      : const Icon(Icons.shopping_cart);
                },
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
