

import '../../../models/user_model.dart';

/// Defines the contract for remote authentication operations.
abstract class AuthRemoteDataSource {
  /// Sends a sign in request and returns a [UserModel] on success.
  Future<UserModel> signIn({required String email, required String password});

  /// Sends a sign up request and returns a [UserModel] on success.
  Future<UserModel> signUp({required String email, required String password});

  /// Sends a sign out request.
  Future<void> signOut();
}