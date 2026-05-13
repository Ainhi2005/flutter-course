import 'package:demo_vd_buoi2/models/post.dart';
import 'package:flutter/material.dart';

class DetailpostScreen extends StatelessWidget {
  final Post post;
  const DetailpostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text(
              "Chi tiết bài viết",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Image.network(
                  post.img_url,
                ),
                const SizedBox(height: 10),
                Text(
                  post.body,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

              ],
            ),
          ), 
          )
        ],
      ),
    );
  }
}
