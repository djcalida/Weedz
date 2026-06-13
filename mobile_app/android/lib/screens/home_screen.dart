import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../data/mock_products.dart';
import '../widgets/product_card.dart';
import '../widgets/category_chip.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredProducts = MockProducts.getFeatured();
    final bestsellers = MockProducts.getBestsellers();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              backgroundColor: AppColors.surface,
              elevation: 0,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'WEDZZ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Motorparts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: AppColors.textPrimary),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined,
                      color: AppColors.textPrimary),
                  onPressed: () {},
                ),
              ],
            ),

            // Announcement Banner
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppColors.darkGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FREE SHIPPING',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            'On orders over \$99',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),

            // Hero Carousel
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: PageView(
                  padEnds: false,
                  controller: PageController(viewportFraction: 0.9),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _buildHeroCard(
                        'Summer Sale',
                        'Up to 40% OFF',
                        'Premium Brake Systems',
                        AppColors.accent,
                        Icons.discount,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _buildHeroCard(
                        'New Arrivals',
                        'Latest Products',
                        'LED Lighting Collection',
                        AppColors.dark,
                        Icons.fiber_new,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: _buildHeroCard(
                        'Best Sellers',
                        'Top Rated',
                        'Customer Favorites',
                        const Color(0xFF16A34A),
                        Icons.star,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop by Category',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: MockProducts.categories.length,
                        itemBuilder: (context, index) {
                          final category = MockProducts.categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CategoryChip(
                              label: category,
                              isSelected: category == 'All',
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Featured Products
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Products',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = featuredProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                  childCount: featuredProducts.length,
                ),
              ),
            ),

            // Bestsellers Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Bestsellers',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = bestsellers[index];
                    return _buildBestsellerCard(context, product);
                  },
                  childCount: bestsellers.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(
    String title,
    String subtitle,
    String description,
    Color color,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.shadowMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            icon,
            size: 60,
            color: Colors.white.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildBestsellerCard(BuildContext context, product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.shadowSm,
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.warning, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${product.rating}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.reviews})',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
