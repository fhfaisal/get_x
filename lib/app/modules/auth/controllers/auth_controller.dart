import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/domain/entities/user.dart';

import '../../../../core/storage/storage_service.dart';
import '../../../domain/usecases/auth/auth_usecase.dart';

/// [AuthController] is responsible for managing authentication state.
/// It interacts with the [AuthUseCase] to perform sign in, sign up, and sign out operations.
class AuthController extends GetxController {
  final AuthUseCase authUseCase=Get.put(AuthUseCase());

  // Observable state variables
  final Rx<AuthStatus> _status = AuthStatus.initial.obs;
  final Rx<String?> _errorMessage = Rx<String?>(null);
  final Rx<User> _user = User().obs;

  ///Variables
  final GlobalKey<FormState> validator = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final RxBool showPassword = true.obs;
  final RxBool remember = false.obs;
  final StorageService storage = StorageService();

  // Getters for the state
  AuthStatus get status => _status.value;

  String? get errorMessage => _errorMessage.value;

  User get user => _user.value;

  bool get isLoading => _status.value == AuthStatus.loading;

  bool get isAuthenticated => _status.value == AuthStatus.authenticated;

  bool get hasError => _status.value == AuthStatus.error;

  /// Attempts to sign in the user with the provided [email] and [password].
  /// Updates status to loading before starting the process and then either
  /// authenticated on success or error on failure.
  Future<void> signIn(String email, String password) async {
    _status.value = AuthStatus.loading;
    update();

    final result = await authUseCase.signIn(email, password);
    result.fold(
      (failure) {
        _status.value = AuthStatus.error;
        _errorMessage.value = failure.message;
      },
      (user) {
        _user.value = user;
        storage.setLoggedIn(true);
        storage.saveUserData(user);
        _status.value = AuthStatus.authenticated;
      },
    );
    update();
  }

  /// Attempts to sign up a new user with the provided [email] and [password].
  /// Updates status to loading during the process and then either
  /// authenticated on success or error on failure.
  Future<void> signUp(String email, String password) async {
    _status.value = AuthStatus.loading;
    update();

    final result = await authUseCase.signUp(email, password);
    result.fold(
      (failure) {
        _status.value = AuthStatus.error;
        _errorMessage.value = failure.message;
      },
      (user) {
        _status.value = AuthStatus.authenticated;
        _user.value = user;
      },
    );
    update();
  }

  /// Signs out the current user.
  /// Updates status to loading while processing and then returns to the initial state
  /// on success or updates to error on failure.
  Future<void> signOut() async {
    _status.value = AuthStatus.loading;
    update();

    final result = await authUseCase.signOut();
    result.fold(
      (failure) {
        _status.value = AuthStatus.error;
        _errorMessage.value = failure.message;
      },
      (_) {
        _status.value = AuthStatus.initial;
        storage.clearAllData();
        _user.value = User();
      },
    );
    update();
  }
}

/// Enum representing different authentication states
enum AuthStatus {
  initial,
  loading,
  authenticated,
  error,
}
