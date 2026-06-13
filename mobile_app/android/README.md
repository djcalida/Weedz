# Wedzz Motorparts - Mobile App (Android)

Premium Flutter e-commerce mobile application for Wedzz Motorparts.

## Features

- **Premium UI Design** - Matching the web platform's 6-digit budget quality
- **Product Catalog** - Browse, filter, and search products
- **Shopping Cart** - Add items, manage quantities, checkout flow
- **Product Details** - Detailed product information with ratings and reviews
- **User Profile** - Account management and order history
- **Responsive Design** - Optimized for all Android device sizes
- **Smooth Animations** - Premium transitions and interactions

## Tech Stack

- **Flutter 3.35.5+** - Cross-platform framework
- **Provider** - State management
- **Google Fonts** - Inter & DM Sans typography
- **Cached Network Image** - Optimized image loading
- **Carousel Slider** - Hero banners
- **Flutter Rating Bar** - Product ratings

## Design System

Matches web platform exactly:
- Primary: `#FF6B00` (Orange)
- Dark: `#0A1628`
- Background: `#F4F6F9`
- Success: `#16A34A`
- Danger: `#DC2626`
- Warning: `#F59E0B`

## Getting Started

### Prerequisites

- Flutter SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extension
- Android device or emulator

### Installation

1. Navigate to the app directory:
   ```bash
   cd mobile_app/android
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Build APK

For production release:
```bash
flutter build apk --release
```

For split APKs (smaller size):
```bash
flutter build apk --split-per-abi
```

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart      # Color constants
│   └── theme/
│       └── app_theme.dart        # Theme configuration
├── data/
│   └── mock_products.dart        # Mock product data
├── models/
│   ├── product.dart              # Product model
│   └── cart_item.dart            # Cart item model
├── providers/
│   └── cart_provider.dart        # Cart state management
├── screens/
│   ├── main_screen.dart          # Bottom navigation
│   ├── home_screen.dart          # Home page
│   ├── shop_screen.dart          # Product listing
│   ├── product_detail_screen.dart # Product details
│   ├── cart_screen.dart          # Shopping cart
│   └── profile_screen.dart       # User profile
├── widgets/
│   ├── product_card.dart         # Product card component
│   └── category_chip.dart        # Category filter chip
└── main.dart                     # App entry point
```

## Screens

1. **Home** - Hero banners, featured products, categories
2. **Shop** - Full catalog with filters and sorting
3. **Product Detail** - Images, specs, reviews, add to cart
4. **Cart** - Shopping cart with quantity management
5. **Profile** - User account and settings

## Future Enhancements

- Backend API integration
- User authentication
- Payment gateway integration
- Order tracking
- Push notifications
- Wishlist functionality
- Product reviews and ratings

## Notes

- Currently uses mock data from `lib/data/mock_products.dart`
- Images loaded from Unsplash placeholders
- Checkout flow is UI-only (no payment processing)

---

**Version:** 1.0.0  
**Last Updated:** June 2026
