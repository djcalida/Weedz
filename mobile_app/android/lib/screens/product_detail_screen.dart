import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:badges/badges.dart' as badges;
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // App Bar with Image
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                backgroundColor: AppColors.surface,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: AppTheme.shadowSm,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.dark),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                actions: [
                  // Favorite Button
                  Consumer<FavoritesProvider>(
                    builder: (context, favorites, child) {
                      final isFavorite = favorites.isFavorite(widget.product.id);
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: AppTheme.shadowSm,
                        ),
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? AppColors.danger : AppColors.dark,
                          ),
                          onPressed: () {
                            favorites.toggleFavorite(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFavorite
                                      ? 'Removed from favorites'
                                      : 'Added to favorites',
                                ),
                                backgroundColor: isFavorite 
                                    ? AppColors.textMuted 
                                    : AppColors.success,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Cart Button
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: AppTheme.shadowSm,
                        ),
                        child: IconButton(
                          icon: cart.itemCount > 0
                              ? badges.Badge(
                                  badgeContent: Text(
                                    cart.itemCount > 99 ? '99+' : '${cart.itemCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  badgeStyle: const badges.BadgeStyle(
                                    badgeColor: AppColors.accent,
                                  ),
                                  child: const Icon(Icons.shopping_cart, color: AppColors.dark),
                                )
                              : const Icon(Icons.shopping_cart_outlined, color: AppColors.dark),
                          onPressed: () {
                            Navigator.pop(context);
                            // This will return to main screen, and main screen should navigate to cart
                          },
                        ),
                      );
                    },
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: AppColors.background,
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.background,
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 80,
                              color: AppColors.textMuted,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.background,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              color: AppColors.accent,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Product Info
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category & Stock
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.accentLight,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.product.category,
                                style: const TextStyle(
                                  color: AppColors.accent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 16,
                              color: widget.product.inStock
                                  ? AppColors.success
                                  : AppColors.danger,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.product.inStock
                                  ? '${widget.product.stock} in stock'
                                  : 'Out of stock',
                              style: TextStyle(
                                fontSize: 12,
                                color: widget.product.inStock
                                    ? AppColors.success
                                    : AppColors.danger,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Product Name
                        Text(
                          widget.product.name,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),

                        const SizedBox(height: 12),

                        // Rating
                        if (widget.product.reviews > 0) ...[
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: widget.product.rating,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColors.warning,
                                ),
                                itemCount: 5,
                                itemSize: 18,
                                unratedColor: AppColors.border,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${widget.product.rating}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(${widget.product.reviews} reviews)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Price
                        Row(
                          children: [
                            if (widget.product.hasDiscount) ...[
                              Text(
                                '₱${widget.product.originalPrice!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textMuted,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.danger,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '-${widget.product.discountPercent.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        Text(
                          '₱${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Description
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.product.description.isNotEmpty
                              ? widget.product.description
                              : 'High-quality automotive part designed for optimal performance and durability. Easy installation with detailed instructions included.',
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.6,
                            color: AppColors.textMuted,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Specifications
                        _buildSpecSection(),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dark.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                children: [
                  // Quantity Selector
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (_quantity > 1) {
                              setState(() => _quantity--);
                            }
                          },
                        ),
                        Text(
                          '$_quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (_quantity < widget.product.stock) {
                              setState(() => _quantity++);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // Add to Cart Button
                  Expanded(
                    child: Consumer<CartProvider>(
                      builder: (context, cart, child) {
                        return ElevatedButton(
                          onPressed: widget.product.inStock
                              ? () {
                                  cart.addItem(widget.product, quantity: _quantity);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added $_quantity ${_quantity == 1 ? 'item' : 'items'} to cart',
                                      ),
                                      backgroundColor: AppColors.success,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_cart),
                              const SizedBox(width: 8),
                              Text(
                                widget.product.inStock
                                    ? 'Add to Cart'
                                    : 'Out of Stock',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        _buildSpecRow('SKU', widget.product.id.padLeft(8, '0')),
        _buildSpecRow('Category', widget.product.category),
        _buildSpecRow('Stock', '${widget.product.stock} units'),
        if (widget.product.tags.isNotEmpty)
          _buildSpecRow('Tags', widget.product.tags.join(', ')),
      ],
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
