# API Service Integration Guide

## Overview
This service connects the Flutter mobile app to your Flask backend API.

## Configuration

### Update Base URL

Edit `lib/services/api_service.dart` and change the `baseUrl`:

```dart
// For Android Emulator (local testing)
static const String baseUrl = 'http://10.0.2.2:5000';

// For Real Device (same network)
static const String baseUrl = 'http://YOUR_PC_IP:5000';

// For Production
static const String baseUrl = 'https://your-domain.com';
```

### Find Your PC IP Address

**Windows:**
```bash
ipconfig
# Look for "IPv4 Address" under your network adapter
```

**Mac/Linux:**
```bash
ifconfig
# or
ip addr show
```

## Usage Examples

### Fetch Products

```dart
import '../services/api_service.dart';

// Get all products
final products = await ApiService.getProducts();

// Get products by category
final electronics = await ApiService.getProductsByCategory('electronics');

// Search products
final results = await ApiService.searchProducts('engine');

// Get single product
final product = await ApiService.getProduct('123');
```

### Place Order

```dart
final order = await ApiService.placeOrder(
  items: [
    {'product_id': '123', 'quantity': 2, 'price': 1500.00},
  ],
  total: 3000.00,
  shippingAddress: {
    'name': 'John Doe',
    'address': '123 Main St',
    'city': 'Manila',
    'postal_code': '1000',
    'phone': '09123456789',
  },
);
```

### Send Chat Message

```dart
final response = await ApiService.sendChatMessage(
  message: 'I need help with my order',
  userId: 'user123',
);
```

## Error Handling

All API methods throw exceptions on error. Wrap them in try-catch:

```dart
try {
  final products = await ApiService.getProducts();
  // Use products
} catch (e) {
  print('Error: $e');
  // Show error to user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Failed to load products')),
  );
}
```

## Backend API Endpoints Required

Your Flask backend should implement these endpoints:

- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get single product
- `GET /api/products/category/:category` - Get products by category
- `GET /api/products/search?q=query` - Search products
- `POST /api/orders` - Place new order
- `GET /api/orders/user/:userId` - Get user orders
- `POST /api/chat` - Send chat message

## Switching from Mock Data to Real API

### Example: Update Home Screen

**Before (using mock data):**
```dart
import '../data/mock_products.dart';

final products = mockProducts;
```

**After (using API):**
```dart
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final data = await ApiService.getProducts();
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // Show error
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    // Use products...
  }
}
```

## Testing

1. Start your Flask backend: `python app.py`
2. Note your PC's IP address
3. Update `baseUrl` in `api_service.dart`
4. Run the app on your device/emulator
5. Test each feature

## Production Checklist

- [ ] Update `baseUrl` to production URL
- [ ] Add authentication tokens
- [ ] Implement proper error handling
- [ ] Add loading states
- [ ] Add retry logic
- [ ] Cache responses
- [ ] Handle offline mode
