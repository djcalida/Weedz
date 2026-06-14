import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/main_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const WedzzApp());
}

class WedzzApp extends StatefulWidget {
  const WedzzApp({super.key});

  @override
  State<WedzzApp> createState() => _WedzzAppState();
}

class _WedzzAppState extends State<WedzzApp> {
  late CartProvider cartProvider;
  late FavoritesProvider favoritesProvider;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = CartProvider();
    favoritesProvider = FavoritesProvider();
    authProvider = AuthProvider();
    
    // Load saved data
    cartProvider.loadCart();
    favoritesProvider.loadFavorites();
    authProvider.loadSession();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: cartProvider),
        ChangeNotifierProvider.value(value: favoritesProvider),
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: MaterialApp(
        title: 'Wedzz Motorparts',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainScreen(),
        routes: {
          '/chat': (context) => const ChatScreen(),
          '/wishlist': (context) => const WishlistScreen(),
          '/login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
