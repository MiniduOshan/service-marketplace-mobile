enum UserRole { worker, customer }

class AppUser {
  final String id;
  final UserRole role;

  AppUser({required this.id, required this.role});
}
