class Product {
  final String id;
  final String name;
  final String slug;
  final double price;
  final double? originalPrice;
  final String category;
  final String image;
  final int stock;
  final double rating;
  final int reviews;
  final String? badge;
  final List<String> tags;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    this.originalPrice,
    required this.category,
    required this.image,
    required this.stock,
    this.rating = 0.0,
    this.reviews = 0,
    this.badge,
    this.tags = const [],
    this.description = '',
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;
  
  double get discountPercent {
    if (!hasDiscount) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
  }

  bool get inStock => stock > 0;
  
  bool get lowStock => stock > 0 && stock <= 10;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      originalPrice: (json['original_price'] as num?)?.toDouble(),
      category: json['category']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      stock: json['stock'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: json['reviews'] as int? ?? 0,
      badge: json['badge']?.toString(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      description: json['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'original_price': originalPrice,
      'category': category,
      'image': image,
      'stock': stock,
      'rating': rating,
      'reviews': reviews,
      'badge': badge,
      'tags': tags,
      'description': description,
    };
  }
}
