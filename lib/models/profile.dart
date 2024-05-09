class Profile {
  final String? avatarPath;
  final String name;
  final String email;
  final String workExperience;
  final String skills;

  Profile({
    required this.avatarPath,
    required this.name,
    required this.email,
    required this.workExperience,
    required this.skills,
  });

  // Factory method for default or initial values.
  factory Profile.initial() {
    return Profile(
      avatarPath: null,
      name: 'Your Name',
      email: 'your_email@example.com',
      workExperience: 'Software Engineer',
      skills: 'Flutter, Dart, etc.',
    );
  }

  // Method to copy and update specific fields.
  Profile copyWith({
    String? avatarPath,
    String? name,
    String? email,
    String? workExperience,
    String? skills,
  }) {
    return Profile(
      avatarPath: avatarPath ?? this.avatarPath,
      name: name ?? this.name,
      email: email ?? this.email,
      workExperience: workExperience ?? this.workExperience,
      skills: skills ?? this.skills,
    );
  }

  // Method to convert the profile object to a map for JSON serialization.
  Map<String, dynamic> toJson() {
    return {
      'avatarPath': avatarPath,
      'name': name,
      'email': email,
      'workExperience': workExperience,
      'skills': skills,
    };
  }

  // Factory method to create a Profile object from a map (JSON deserialization).
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      avatarPath: json['avatarPath'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      workExperience: json['workExperience'] as String,
      skills: json['skills'] as String,
    );
  }
}
