import 'package:supabase_flutter/supabase_flutter.dart'; // Ensure correct import for Supabase Flutter

class UserProfile {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  UserProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? '', // Provide default values if necessary
      lastName: json['last_name'] ?? '',
    );
  }
}

class User {
  final SupabaseClient _client;

  User(this._client);

  Future<UserProfile?> fetchUserProfile() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return null;

    final response = await _client
        .from('users')
        .select()
        .eq('id', userId)
        .single()
        ._execute();

    if (response.error != null || response.data == null) {
      print('Error fetching user data: ${response.error?.message}');
      return null;
    }

    // Assuming your data is directly in the response.data
    return UserProfile.fromJson(response.data);
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
