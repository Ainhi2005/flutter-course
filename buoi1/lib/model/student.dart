class Student {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final double gpa;
  final String major;

  const Student({
    required this.id,
    required this.name,
    required this.email,
    required this.gpa,
    required this.major,
    this.avatarUrl,
  });
  String get xepLoai {
    if (gpa >= 3.6) return ' Xuat sac  ';
    if (gpa >= 3.2) return 'Gioi';
    if (gpa >= 2.5) return 'Kha';
    return 'Trung binh ';
  }
}
