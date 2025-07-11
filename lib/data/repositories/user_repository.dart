import '../models/user_profile_model.dart';

class UserRepository {
  // Mock user profile data
  final Map<String, dynamic> _mockUserProfile = {
    'id': 1,
    'username': 'johndoe',
    'firstName': 'John',
    'lastName': 'Doe',
    'fullName': 'John Doe',
    'email': 'john.doe@example.com',
    'role': 'technician',
    'token': 'mock_jwt_token_12345',
  };

  // Mock get user profile
  Future<UserProfile> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserProfile.fromJson(_mockUserProfile);
  }

  // Mock update user profile
  Future<UserProfile> updateUserProfile(Map<String, dynamic> updates) async {
    await Future.delayed(const Duration(seconds: 1));

    // Merge updates with existing data
    final updatedData = Map<String, dynamic>.from(_mockUserProfile);
    updatedData.addAll(updates);

    return UserProfile.fromJson(updatedData);
  }

  // Mock change password
  Future<bool> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation
    if (currentPassword == 'password') {
      return true;
    } else {
      throw Exception('Current password is incorrect');
    }
  }
}
