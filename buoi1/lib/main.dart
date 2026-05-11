import 'package:flutter/material.dart';
import 'model/student.dart';
import 'screens/student_list_screen.dart';
import 'screens/add_student_screen.dart';
import 'screens/widgets/student_card.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý sinh viên',
            theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const StudentListScreen(),
    );
  }
}
