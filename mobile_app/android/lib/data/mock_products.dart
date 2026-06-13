import '../models/product.dart';

class MockProducts {
  static final List<Product> all = [
    Product(
      id: '1',
      name: 'Premium Ceramic Brake Pads - Front Set',
      slug: 'ceramic-brake-pads-front',
      price: 89.99,
      originalPrice: 119.99,
      category: 'Brake System',
      image: 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=800',
      stock: 45,
      rating: 4.8,
      reviews: 234,
      badge: 'Bestseller',
      tags: ['brake', 'safety', 'premium'],
      description: 'High-performance ceramic brake pads designed for superior stopping power and reduced brake dust.',
    ),
    Product(
      id: '2',
      name: 'Full Synthetic Motor Oil 5W-30',
      slug: 'synthetic-oil-5w30',
      price: 34.99,
      category: 'Engine Oil',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      stock: 120,
      rating: 4.9,
      reviews: 567,
      badge: 'Top Rated',
      tags: ['oil', 'engine', 'synthetic'],
      description: 'Advanced full synthetic formula providing maximum engine protection in all conditions.',
    ),
    Product(
      id: '3',
      name: 'LED Headlight Conversion Kit',
      slug: 'led-headlight-kit',
      price: 129.99,
      originalPrice: 179.99,
      category: 'Lighting',
      image: 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=800',
      stock: 8,
      rating: 4.7,
      reviews: 189,
      badge: 'New',
      tags: ['lights', 'led', 'visibility'],
      description: 'Ultra-bright LED headlight kit with easy plug-and-play installation.',
    ),
    Product(
      id: '4',
      name: 'Heavy Duty Car Battery 850 CCA',
      slug: 'car-battery-850cca',
      price: 159.99,
      category: 'Battery',
      image: 'https://images.unsplash.com/photo-1593941707882-a5bba14938c7?w=800',
      stock: 32,
      rating: 4.6,
      reviews: 412,
      tags: ['battery', 'power', 'starting'],
      description: 'Reliable heavy-duty battery with 850 cold cranking amps for all weather performance.',
    ),
    Product(
      id: '5',
      name: 'Performance Air Filter',
      slug: 'performance-air-filter',
      price: 49.99,
      originalPrice: 64.99,
      category: 'Air Intake',
      image: 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800',
      stock: 76,
      rating: 4.5,
      reviews: 298,
      tags: ['filter', 'performance', 'engine'],
      description: 'High-flow reusable air filter for improved engine performance and fuel efficiency.',
    ),
    Product(
      id: '6',
      name: 'Sport Lowering Springs',
      slug: 'sport-lowering-springs',
      price: 279.99,
      category: 'Suspension',
      image: 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=800',
      stock: 15,
      rating: 4.8,
      reviews: 156,
      badge: 'Premium',
      tags: ['suspension', 'handling', 'sport'],
      description: 'Progressive rate lowering springs for improved handling and aggressive stance.',
    ),
    Product(
      id: '7',
      name: 'Universal Floor Mats Set',
      slug: 'universal-floor-mats',
      price: 39.99,
      category: 'Interior',
      image: 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=800',
      stock: 234,
      rating: 4.4,
      reviews: 891,
      tags: ['interior', 'protection', 'mats'],
      description: 'All-weather heavy-duty floor mats with anti-slip backing.',
    ),
    Product(
      id: '8',
      name: 'High Performance Spark Plugs - 4 Pack',
      slug: 'performance-spark-plugs',
      price: 29.99,
      category: 'Ignition',
      image: 'https://images.unsplash.com/photo-1625047509168-a7026f36de04?w=800',
      stock: 98,
      rating: 4.7,
      reviews: 445,
      tags: ['ignition', 'spark', 'performance'],
      description: 'Iridium-tipped spark plugs for optimal combustion and fuel efficiency.',
    ),
    Product(
      id: '9',
      name: 'Turbo Sound Exhaust Muffler',
      slug: 'turbo-sound-exhaust',
      price: 189.99,
      originalPrice: 249.99,
      category: 'Exhaust',
      image: 'https://images.unsplash.com/photo-1609521263047-f8f205293f24?w=800',
      stock: 5,
      rating: 4.6,
      reviews: 203,
      badge: 'Hot Deal',
      tags: ['exhaust', 'sound', 'performance'],
      description: 'Deep aggressive tone exhaust muffler with stainless steel construction.',
    ),
    Product(
      id: '10',
      name: 'Digital Tire Pressure Gauge',
      slug: 'digital-tire-gauge',
      price: 19.99,
      category: 'Tools',
      image: 'https://images.unsplash.com/photo-1530125882470-e78d6f44e10a?w=800',
      stock: 156,
      rating: 4.5,
      reviews: 678,
      tags: ['tools', 'tires', 'gauge'],
      description: 'Accurate digital tire pressure gauge with backlit LCD display.',
    ),
    Product(
      id: '11',
      name: 'Racing Steering Wheel Cover',
      slug: 'racing-steering-cover',
      price: 24.99,
      category: 'Interior',
      image: 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?w=800',
      stock: 89,
      rating: 4.3,
      reviews: 321,
      tags: ['interior', 'steering', 'comfort'],
      description: 'Leather-wrapped steering wheel cover with ergonomic grip design.',
    ),
    Product(
      id: '12',
      name: 'Transmission Fluid - 1 Gallon',
      slug: 'transmission-fluid',
      price: 44.99,
      category: 'Fluids',
      image: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?w=800',
      stock: 67,
      rating: 4.8,
      reviews: 234,
      tags: ['fluid', 'transmission', 'maintenance'],
      description: 'Premium ATF transmission fluid for smooth shifting and protection.',
    ),
  ];

  static List<String> get categories => [
    'All',
    'Brake System',
    'Engine Oil',
    'Lighting',
    'Battery',
    'Air Intake',
    'Suspension',
    'Interior',
    'Ignition',
    'Exhaust',
    'Tools',
    'Fluids',
  ];

  static List<Product> getByCategory(String category) {
    if (category == 'All') return all;
    return all.where((p) => p.category == category).toList();
  }

  static List<Product> getFeatured() {
    return all.where((p) => p.badge != null).take(6).toList();
  }

  static List<Product> getBestsellers() {
    return all.where((p) => p.reviews > 300).toList();
  }

  static Product? getById(String id) {
    try {
      return all.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
