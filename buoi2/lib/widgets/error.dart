import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        color: Colors.grey,
        child: const Icon(Icons.error,color: Colors.red),
      ),
    );
  }
}