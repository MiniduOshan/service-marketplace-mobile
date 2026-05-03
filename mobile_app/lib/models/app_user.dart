enum UserRole { worker, customer }

class AppUser {
  final String id;
  final UserRole role;
  final bool isRegistrationComplete;

  AppUser({
    required this.id, 
    required this.role, 
    this.isRegistrationComplete = false,
  });
}
