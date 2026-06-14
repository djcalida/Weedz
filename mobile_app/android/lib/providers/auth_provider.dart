import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _fullName = '';
  String _email = '';

  bool get isLoggedIn => _isLoggedIn;
  String get fullName => _fullName;
  String get email => _email;

  String get initials {
    if (_fullName.isEmpty) return '';
    final parts = _fullName.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Future<void> loadSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      _fullName = prefs.getString('fullName') ?? '';
      _email = prefs.getString('email') ?? '';
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading session: $e');
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
    String? fullName,
  }) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return false;
    }

    _isLoggedIn = true;
    _email = email.trim();
    _fullName = fullName?.trim().isNotEmpty == true
        ? fullName!.trim()
        : _deriveNameFromEmail(_email);

    await _saveSession();
    notifyListeners();
    return true;
  }

  Future<void> updateProfile({required String fullName, required String email}) async {
    _fullName = fullName.trim();
    _email = email.trim();
    await _saveSession();
    notifyListeners();
  }

  Future<void> signOut() async {
    _isLoggedIn = false;
    _fullName = '';
    _email = '';

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLoggedIn');
      await prefs.remove('fullName');
      await prefs.remove('email');
    } catch (e) {
      debugPrint('Error clearing session: $e');
    }

    notifyListeners();
  }

  Future<void> _saveSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', _isLoggedIn);
      await prefs.setString('fullName', _fullName);
      await prefs.setString('email', _email);
    } catch (e) {
      debugPrint('Error saving session: $e');
    }
  }

  String _deriveNameFromEmail(String email) {
    final localPart = email.split('@').first;
    return localPart
        .split(RegExp(r'[._-]+'))
        .where((part) => part.isNotEmpty)
        .map((part) => part[0].toUpperCase() + part.substring(1))
        .join(' ');
  }
}
