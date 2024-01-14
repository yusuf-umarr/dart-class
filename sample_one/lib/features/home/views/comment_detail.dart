import 'package:flutter/material.dart';
import 'package:sample_one/features/home/models/comment_model.dart';

class CommentDetail extends StatelessWidget {
  final CommentModel comment;

  const CommentDetail({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comment.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(comment.email!),
            const SizedBox(
              height: 10,
            ),
            Text(comment.body!)
          ],
        ),
      ),
    );
  }
}
