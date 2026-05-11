// lib/screens/student_list_screen.dart
import 'package:flutter/material.dart';
import '../model/student.dart';
import './widgets/student_card.dart';
import 'add_student_screen.dart';
class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});
  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}
 
class _StudentListScreenState extends State<StudentListScreen> {
  final List<Student> _students = [
    const Student(id: '1', name: 'Nguyễn Văn An',
      email: 'an@sv.edu.vn', gpa: 3.8, major: 'CNTT'),
    const Student(id: '2', name: 'Trần Thị Bình',
      email: 'binh@sv.edu.vn', gpa: 3.4, major: 'QTKD'),
  ];
 
  void _addStudent(Student student) =>
    setState(() => _students.add(student));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sinh Viên (${_students.length})'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _students.isEmpty
        ? const Center(child: Text('Chưa có sinh viên nào'))
        : ListView.builder(
            itemCount:   _students.length,
            itemBuilder: (context, index) =>
              StudentCard(student: _students[index]),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = await Navigator.push<Student>(
            context,
            MaterialPageRoute(builder: (_) => const AddStudentScreen()),
          );
          if (newStudent != null) _addStudent(newStudent);
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
