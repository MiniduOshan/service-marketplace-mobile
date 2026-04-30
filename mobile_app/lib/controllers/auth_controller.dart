import 'dart:async';
import 'package:flutter/foundation.dart';


import '../models/app_user.dart';

class AuthController {
  static final AuthController _instance = AuthController._internal();
  factory AuthController() => _instance;
  AuthController._internal();

  final _authStateNotifier = ValueNotifier<AppUser?>(null);
  ValueNotifier<AppUser?> get authStateNotifier => _authStateNotifier;
  
  late final Stream<AppUser?> _authStream = _authStateNotifier.asStream();
  Stream<AppUser?> get onAuthStateChanged => _authStream;

  UserRole? _currentUserRole;
  UserRole? get currentUserRole => _currentUserRole;

  AppUser? get currentUser => _authStateNotifier.value;


  // Temporarily sets the role to simulate a successful login
  void setMockRole(UserRole role) {
    _currentUserRole = role;
    _authStateNotifier.value = AppUser(id: 'mock_id', role: role);
  }


  Future<bool> loginWithEmail(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    setMockRole(UserRole.customer); // Default to customer for email login in this simulation
    return true;
  }

  void logOut() {
    _currentUserRole = null;
    _authStateNotifier.value = null;
  }
}

// Extension to allow ValueNotifier to behave like a stream for the existing StreamBuilder
extension ValueNotifierExtension<T> on ValueNotifier<T> {
  Stream<T> asStream() {
    final controller = StreamController<T>();
    controller.add(value);
    void listener() => controller.add(value);
    addListener(listener);
    controller.onCancel = () => removeListener(listener);
    return controller.stream;
  }
}

final AuthController authController = AuthController();

