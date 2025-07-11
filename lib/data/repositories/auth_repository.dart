import '../models/user_profile_model.dart';

class AuthRepository {
  // Mock user data
  final Map<String, dynamic> _mockUser = {
    'id': '1',
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'role': 'technician',
    'token': 'mock_jwt_token_12345',
  };

  // Mock login
  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation
    if (email == 'admin@example.com' && password == 'password') {
      return {
        'success': true,
        'user': _mockUser,
        'message': 'Login successful',
      };
    } else {
      throw Exception('Invalid credentials');
    }
  }

  // Mock logout
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock logout - clear token, etc.
  }

  // Mock get current user
  Future<UserProfile> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return UserProfile.fromJson(_mockUser);
  }

  // Mock check if user is logged in
  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true; // Mock always logged in
  }
}
