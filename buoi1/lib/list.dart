import 'package:buoi1/models/student.dart';
import 'package:buoi1/widget/card.dart';
import 'package:flutter/material.dart';
import 'add.dart';

class Student_list extends StatefulWidget {
  const Student_list({super.key});

  @override
  State<Student_list> createState() => _Student_listState();
}

class _Student_listState extends State<Student_list> {
  final List<Student> _students = [
    const Student(
      name: "Ngô Thị Ái Nhi",
      email: "ngothiainhitl@gmail.com ",
      gpa: 3.5,
    ),
    const Student(
      name: "Ngô Thị Ái Nhi",
      email: "ngothiainhitl@gmail.com ",
      gpa: 3.5,
    ),
    const Student(
      name: "Ngô Thị Ái Nhi",
      email: "ngothiainhitl@gmail.com ",
      gpa: 3.5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh Sách sinh viên"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addstudent()),
                  );
                  if (result != null && result is Student) {
                    setState(() {
                      _students.add(result);
                    });
                  }
                },
                child: Text("+   Thêm sinh viên "),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 196, 188, 188),
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          _students.isEmpty
              ? const Center(child: Text("chưa có sinh viên nào"))
              : Expanded(
                  child: ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) =>
                        CardStudent(student: _students[index]),
                  ),
                ),
        ],
      ),
    );
  }
}
