class UserProfile {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? email;
  final String? role;
  final String? token;

  UserProfile({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.email,
    this.role,
    this.token,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      username: json['username'] ?? json['name'] ?? '',
      firstName: json['firstName'] ?? json['name']?.split(' ').first ?? '',
      lastName: json['lastName'] ?? json['name']?.split(' ').last ?? '',
      fullName: json['fullName'] ?? json['name'] ?? '',
      email: json['email'],
      role: json['role'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}
