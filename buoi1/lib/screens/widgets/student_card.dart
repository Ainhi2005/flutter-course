import 'package:flutter/material.dart';
import '../../model/student.dart';
// lib/screens/widgets/student_card.dart
// Dùng: StatefulWidget (có like), Row, Column, Image,
//        Container, null safety, string interpolation
 
class StudentCard extends StatefulWidget {
  final Student student;
  const StudentCard({super.key, required this.student});
  @override
  State<StudentCard> createState() => _StudentCardState();
}
 
class _StudentCardState extends State<StudentCard> {
  bool _isLiked = false;
 
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Avatar ───────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: widget.student.avatarUrl != null
                ? Image.network(widget.student.avatarUrl!,
                    width: 60, height: 60, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildAvatar())
                : _buildAvatar(),
            ),
            const SizedBox(width: 16),
 
            // ── Thông tin ─────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(child: Text(widget.student.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                    GestureDetector(
                      onTap: () => setState(() => _isLiked = !_isLiked),
                      child: Icon(_isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.grey),
                    ),
                  ]),
                  const SizedBox(height: 4),
                  Text(widget.student.email,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, children: [
                    _chip('GPA: ${widget.student.gpa}', Colors.blue),
                    _chip(widget.student.xepLoai, Colors.green),
                    _chip(widget.student.major, Colors.purple),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildAvatar() => Container(
    width: 60, height: 60,
    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(child: Text(
      widget.student.name[0].toUpperCase(),
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
        color: Colors.blue),
    )),
  );
 
  Widget _chip(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color:        color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      border:       Border.all(color: color.withOpacity(0.4)),
    ),
    child: Text(label, style: TextStyle(color: color, fontSize: 12)),
  );
}
