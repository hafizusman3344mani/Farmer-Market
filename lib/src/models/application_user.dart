class ApplicationUser {
  final String userId;
  final String email;

  ApplicationUser({this.userId, this.email});

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'email': email};
  }

  ApplicationUser.userFromFireStore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'];
}
