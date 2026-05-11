import 'package:buoi1/models/student.dart';
import 'package:flutter/material.dart';

class Addstudent extends StatefulWidget {
  const Addstudent({super.key});

  @override
  State<Addstudent> createState() => _AddstudentState();
}

class _AddstudentState extends State<Addstudent> {
  final _formkey = GlobalKey<FormState>();
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _gpaC = TextEditingController();
  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _gpaC.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thêm sinh viên")),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
              child: Container(
                //sau thêm để thay đổi avt
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.amberAccent),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  _oNhap(_nameC, "Tên sinh viên"),
                  const SizedBox(height: 16),
                  _oNhap(_emailC, "Email sinh viên"),
                  const SizedBox(height: 16),
                  _oNhap(_gpaC, "Điểm sinh viên"),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text(
                        'Thêm Sinh Viên',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _oNhap(
    TextEditingController ctr,
    String label, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return TextFormField(
      controller: ctr,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return " Không được để trống";
        }
        return null;
      },
    );
  }

  void _submit() {
    if (!_formkey.currentState!.validate()) return;
    final student = Student(
      name: _nameC.text.trim(),
      email: _emailC.text.trim(),
      gpa: double.parse(_gpaC.text.trim()),
    );
    Navigator.pop(context, student);
  }
}