import 'package:demo_vd_buoi2/models/post.dart';
import 'package:demo_vd_buoi2/screens/detailPost_screen.dart';
import 'package:demo_vd_buoi2/services/post_service.dart';
import 'package:demo_vd_buoi2/widgets/loading.dart';
import 'package:demo_vd_buoi2/widgets/error.dart';
import 'package:demo_vd_buoi2/widgets/post_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> _postFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh Sách Bài Viết",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Error(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Lỗi ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _loadPosts,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Thử lại ngay'),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final posts = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => _loadPosts(),
              // ListView.separated có khoảng chia , render 1 item
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    post: posts[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailpostScreen(post:posts[index])),
                      );
                    },
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _loadPosts() {
    setState(() {
      _postFuture = PostService.getPosts(limit: 20);
    });
  }
}
