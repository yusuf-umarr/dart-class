import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/features/auth/view_model/auth_view_model.dart';
import 'package:sample_one/features/home/views/comment_detail.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    context.read<AuthViewModel>().getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Comments"),
      ),
      body: ListView.builder(
          itemCount: provider.allComment.length,
          itemBuilder: (context, int index) {
            final comment = provider.allComment[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommentDetail(
                      comment: comment,
                    ),
                  ),
                );
              },
              leading: Text("${index + 1}"),
              title: Text(comment.name!),
              // subtitle: Text(comment.email!),
              // comment['data']
              //comment.data
            );
          }),
    );
  }
}
