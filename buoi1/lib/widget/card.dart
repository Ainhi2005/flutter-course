import 'package:flutter/material.dart';
import '../../models/student.dart';

class CardStudent extends StatefulWidget {
    final Student student;
  const CardStudent({super.key,required this.student});


  @override
  State<CardStudent> createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        //row chia ảnh + chữ
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/avatar.jpg",),),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(widget.student.name,
                    style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold,
                
                  ),),
                  SizedBox(height: 5), 
                    Text("email : ${widget.student.email}",
                    style: TextStyle(
                      fontSize: 12,
                    ),                  
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [ 
                    Text("GPA : ${widget.student.gpa}",
                      style: TextStyle(fontSize: 12),
                      ),
                    SizedBox(width: 30),
                    Text("XL : ${widget.student.xeploai}",
                      style: TextStyle(fontSize: 12),
                      ),                
                  ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}