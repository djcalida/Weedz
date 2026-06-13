# Wedzz Motorparts - Mobile Application

Premium mobile e-commerce application built with Flutter for Android and iOS platforms.

## Project Status

### ✅ Android - COMPLETED
Full-featured Flutter application matching the web platform's premium 6-digit budget quality.

**Location:** `mobile_app/android/`

**Features:**
- 🎨 Premium UI Design matching web platform exactly
- 🛍️ Product catalog with filtering and sorting
- 🛒 Shopping cart with quantity management
- 📱 Responsive design for all device sizes
- ⚡ Smooth animations and transitions
- 🎯 Bottom navigation (Home, Shop, Cart, Profile)
- 📦 12 mock products with images from Unsplash
- 🎨 Exact color scheme from web (#FF6B00 accent, #0A1628 dark)
- 📖 Inter & DM Sans fonts via Google Fonts
- 🔄 State management with Provider

**Tech Stack:**
- Flutter 3.35.5+
- Dart 3.9.2+
- Material Design 3
- Provider for state management
- Google Fonts (Inter, DM Sans)
- Cached Network Image
- Carousel Slider
- Flutter Rating Bar
- Badges
- Shimmer effects

**Screens:**
1. **Home** - Hero banners, featured products, categories, bestsellers
2. **Shop** - Full product grid with category filters and sorting
3. **Product Detail** - Images, specs, reviews, quantity selector, add to cart
4. **Cart** - Shopping cart with item management and checkout summary
5. **Profile** - User stats, account settings, order history, preferences

**Code Quality:**
- ✅ All dependencies installed
- ✅ Flutter analyze passes (0 errors, 13 info warnings)
- ✅ Proper project structure
- ✅ Type-safe models and providers
- ✅ Widget tests included

### 📱 iOS - PENDING
To be developed using the same Flutter codebase.

**Location:** `mobile_app/ios/` (placeholder)

**Benefits of Flutter:**
- Same codebase for both platforms
- Consistent UI across Android and iOS
- Faster development time
- Native performance

## Directory Structure

```
mobile_app/
├── android/                    # ✅ COMPLETED Flutter app
│   ├── lib/
│   │   ├── core/
│   │   │   ├── constants/
│   │   │   │   └── app_colors.dart       # Color constants
│   │   │   └── theme/
│   │   │       └── app_theme.dart         # Theme config
│   │   ├── data/
│   │   │   └── mock_products.dart         # Product data
│   │   ├── models/
│   │   │   ├── product.dart               # Product model
│   │   │   └── cart_item.dart             # Cart item model
│   │   ├── providers/
│   │   │   └── cart_provider.dart         # Cart state
│   │   ├── screens/
│   │   │   ├── main_screen.dart           # Bottom nav
│   │   │   ├── home_screen.dart           # Home page
│   │   │   ├── shop_screen.dart           # Product list
│   │   │   ├── product_detail_screen.dart # Product details
│   │   │   ├── cart_screen.dart           # Shopping cart
│   │   │   └── profile_screen.dart        # User profile
│   │   ├── widgets/
│   │   │   ├── product_card.dart          # Product card
│   │   │   └── category_chip.dart         # Category filter
│   │   └── main.dart                      # App entry
│   ├── assets/
│   │   ├── images/                        # App images
│   │   └── icons/                         # App icons
│   ├── pubspec.yaml                       # Dependencies
│   ├── README.md                          # Android docs
│   └── test/                              # Widget tests
└── ios/                        # 📱 TO BE DEVELOPED
    └── (Flutter will generate here)
```

## Design System (Matches Web Platform)

### Colors
- **Primary/Accent:** `#FF6B00` (Orange)
- **Dark:** `#0A1628`
- **Dark Soft:** `#152238`
- **Background:** `#F4F6F9`
- **Surface:** `#FFFFFF`
- **Success:** `#16A34A`
- **Danger:** `#DC2626`
- **Warning:** `#F59E0B`
- **Text Primary:** `#1A2332`
- **Text Muted:** `#64748B`
- **Border:** `#E2E8F0`

### Typography
- **Body Font:** Inter (via Google Fonts)
- **Display Font:** DM Sans (via Google Fonts)
- **Font Weights:** 400 (regular), 600 (semibold), 700 (bold)

### Spacing & Borders
- **Border Radius:** 8px, 12px, 16px, 20px, 24px
- **Shadows:** Small (3px), Medium (30px), Large (60px)
- **Padding:** 8px, 12px, 16px, 20px, 24px

## Getting Started

### Prerequisites
- Flutter SDK 3.0.0+
- Android Studio or VS Code with Flutter extension
- Android device or emulator (for Android testing)
- Xcode (for iOS testing, macOS only)

### Installation

1. **Navigate to Android app:**
   ```bash
   cd mobile_app/android
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Build release APK:**
   ```bash
   flutter build apk --release
   ```

### For iOS Development (Future)

When ready to develop iOS:
```bash
cd mobile_app/android  # Same Flutter project
flutter run -d ios      # Run on iOS simulator
flutter build ios       # Build for iOS
```

## Product Data

Currently uses mock data (12 products):
- Ceramic Brake Pads
- Synthetic Motor Oil
- LED Headlight Kit
- Car Battery
- Performance Air Filter
- Sport Lowering Springs
- Universal Floor Mats
- High Performance Spark Plugs
- Turbo Sound Exhaust
- Digital Tire Pressure Gauge
- Racing Steering Wheel Cover
- Transmission Fluid

**Categories:** Brake System, Engine Oil, Lighting, Battery, Air Intake, Suspension, Interior, Ignition, Exhaust, Tools, Fluids

## Features Implemented

### ✅ Android
- [x] Bottom navigation with 4 tabs
- [x] Home screen with hero carousel
- [x] Featured products grid
- [x] Bestsellers list
- [x] Category filtering
- [x] Product sorting (price, rating, newest)
- [x] Product detail with specs
- [x] Quantity selector
- [x] Add to cart functionality
- [x] Cart with item management
- [x] Checkout summary (subtotal, shipping, tax)
- [x] Profile screen with user stats
- [x] Settings menu
- [x] Rating display with stars
- [x] Discount badges
- [x] Stock status indicators
- [x] Responsive design
- [x] Smooth animations
- [x] Loading states
- [x] Empty states

### 📱 iOS (To Be Developed)
- [ ] Same features as Android (Flutter code reuse)
- [ ] iOS-specific UI adjustments
- [ ] Cupertino-style widgets where appropriate
- [ ] iOS app icon and splash screen
- [ ] App Store optimization

## Backend Integration (Future)

When connecting to a backend API:
1. Replace `mock_products.dart` with API calls
2. Add authentication service
3. Implement real payment processing
4. Add order tracking
5. Enable push notifications
6. Add user registration/login

## UI Quality Standards

✅ **Matches "6-Digit Budget" Requirements:**
- Premium Material Design 3
- Smooth 60fps animations
- Professional color palette
- High-quality imagery
- Polished micro-interactions
- Consistent spacing and alignment
- Professional typography
- Accessible UI elements
- Loading and error states
- Empty state designs

## Build Commands

### Development
```bash
flutter run                     # Run on connected device
flutter run -d android          # Run on Android
flutter run -d ios              # Run on iOS (macOS only)
flutter run --release           # Release mode
```

### Testing
```bash
flutter test                    # Run unit tests
flutter analyze                 # Analyze code
flutter doctor                  # Check Flutter setup
```

### Production Builds
```bash
flutter build apk --release               # Android APK
flutter build apk --split-per-abi         # Split APKs (smaller)
flutter build appbundle --release         # Android App Bundle (Play Store)
flutter build ios --release               # iOS (requires macOS)
```

## Notes

- **Platform:** Currently Android is complete, iOS uses same codebase
- **Data:** Using mock data, ready for backend integration
- **Images:** Loaded from Unsplash placeholder URLs
- **Payments:** UI-only checkout flow (no real payment processing)
- **Auth:** Guest user mode (no login required yet)

## Next Steps

1. **iOS Development:**
   - Set up iOS project configuration
   - Add iOS-specific assets
   - Test on iOS simulators and devices
   - Optimize for iOS guidelines

2. **Backend Integration:**
   - Connect to REST API or GraphQL
   - Implement user authentication
   - Add real product database
   - Enable order processing

3. **Advanced Features:**
   - Push notifications
   - Wishlist persistence
   - Order tracking
   - Reviews and ratings
   - Search functionality
   - Payment gateway integration

---

**Version:** 1.0.0  
**Last Updated:** June 2026  
**Platform:** Android ✅ | iOS 📱 (Pending)  
**Framework:** Flutter 3.35.5




