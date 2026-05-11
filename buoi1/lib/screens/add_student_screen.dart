// lib/screens/add_student_screen.dart
import 'package:flutter/material.dart';
import '../model/student.dart';
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});
  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}
 
class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey   = GlobalKey<FormState>();
  final _nameCtrl  = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _gpaCtrl   = TextEditingController();
  final _majorCtrl = TextEditingController();
 
  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _gpaCtrl.dispose();
    _majorCtrl.dispose();
    super.dispose();
  }
 
  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final student = Student(
      id:    DateTime.now().millisecondsSinceEpoch.toString(),
      name:  _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      gpa:   double.parse(_gpaCtrl.text.trim()),
      major: _majorCtrl.text.trim(),
    );
    Navigator.pop(context, student); // Trả Student về màn hình trước
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm Sinh Viên')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            _field(_nameCtrl,  'Họ và tên', Icons.person,
              validator: (v) => v!.isEmpty ? 'Nhập tên' : null),
            const SizedBox(height: 16),
            _field(_emailCtrl, 'Email', Icons.email,
              keyboard: TextInputType.emailAddress,
              validator: (v) {
                if (v!.isEmpty) return 'Nhập email';
                if (!v.contains('@')) return 'Email không hợp lệ';
                return null;
              }),
            const SizedBox(height: 16),
            _field(_gpaCtrl, 'GPA (0.0 - 4.0)', Icons.grade,
              keyboard: TextInputType.number,
              validator: (v) {
                if (v!.isEmpty) return 'Nhập GPA';
                final gpa = double.tryParse(v);
                if (gpa == null || gpa < 0 || gpa > 4.0)
                  return 'GPA phải từ 0.0 đến 4.0';
                return null;
              }),
            const SizedBox(height: 16),
            _field(_majorCtrl, 'Ngành học', Icons.school,
              action: TextInputAction.done,
              validator: (v) => v!.isEmpty ? 'Nhập ngành' : null),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Thêm Sinh Viên',
                  style: TextStyle(fontSize: 16)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
 
  // Helper tạo TextFormField — tránh lặp code
  Widget _field(
    TextEditingController ctrl, String label, IconData icon, {
    TextInputType  keyboard = TextInputType.text,
    TextInputAction action  = TextInputAction.next,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller:      ctrl,
      keyboardType:    keyboard,
      textInputAction: action,
      validator:       validator,
      decoration: InputDecoration(
        labelText:  label,
        prefixIcon: Icon(icon),
        border:     const OutlineInputBorder(),
      ),
    );
  }
}

