class Student {
  final String name;
  final String email;
  final double gpa;
  final String? imgUrl;

  const Student({
    required this.name,
    required this.email,
    required this.gpa,
    this.imgUrl,
  });
  String get xeploai {
    if (gpa >= 3.6) return 'Xuất Sắc';
    if (gpa >= 3.2) return 'Giỏi';
    if (gpa >= 2.5) return 'Khá';
    return 'Trung bình';
  }
}