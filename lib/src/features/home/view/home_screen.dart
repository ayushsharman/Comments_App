import 'package:comments/src/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/comment_widget.dart';
import '../viewmodel/comments_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commentsViewModel = Provider.of<CommentsViewModel>(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Comments',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => commentsViewModel.fetchComments(),
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            color: Colors.white,
          ),
        ],
      ),
      body: commentsViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : commentsViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(commentsViewModel.errorMessage))
              : ListView.builder(
                  itemCount: commentsViewModel.comments.length,
                  itemBuilder: (context, index) {
                    final comment = commentsViewModel.comments[index];
                    return CommentWidget(
                      name: comment.name,
                      email: comment.maskedEmail,
                      content: comment.body,
                    );
                  },
                ),
    );
  }
}
