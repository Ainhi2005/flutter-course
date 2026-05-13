import 'package:demo_vd_buoi2/models/post.dart';
import 'package:demo_vd_buoi2/widgets/loading.dart';
import 'package:demo_vd_buoi2/widgets/error.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;
  const PostCard({super.key,required this.post,required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      elevation: 3,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
      child: InkWell(
        onTap: onTap,
        child:Row(
          children: [
          Image.network(
            post.img_url,
            height: 100,
            width: 130,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) => 
            loadingProgress == null? child :const SizedBox(width: 130,height: 100,child: Loading(),),
            errorBuilder: (context, error, stackTrace) => const SizedBox(width: 130,height: 100,child: Error(),),

          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    post.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),                    
                    ),
                    const SizedBox(height: 10),
                    
                    Row(
                      children: [
                        Text(
                        post.sources,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),                    
                        ),
                        const SizedBox(width: 10),
                        Text(
                        post.date,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),                    
                        ),
                      ],
                    ),
                ],
              ),
            )
          )
          ],
        ),
      ),
    );
  }
}