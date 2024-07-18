class Comment {
  final int id;
  final String name;
  final String email;
  final String body;
  String maskedEmail;

  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    this.maskedEmail = '',
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  void updateMaskedEmail(String masked) {
    maskedEmail = masked;
  }
}
