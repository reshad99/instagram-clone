import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/home/bloc/comment/comment_bloc.dart';
import 'package:instagram_clone/data/home/model/comment.dart';
import 'package:instagram_clone/data/home/request/add_comment_request.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/comment_widget.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postId});
  final int postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (FocusScope.of(context).isFirstFocus) {
          return true;
        } else {
          FocusScope.of(context).unfocus();
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              shape: const Border(bottom: BorderSide(width: 0.1)),
              foregroundColor: Colors.black,
              title: const Text('Comments'),
            ),
            body: BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                var firstStackWidget = state is CommentsLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryBlackColor,
                        ),
                      )
                    : comments(size);
                return stackForComments(firstStackWidget, context, size);
              },
            )),
      ),
    );
  }

  Stack stackForComments(firstStackWidget, BuildContext context, Size size) {
    return Stack(
      children: [
        firstStackWidget,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomTextField(
            textInputAction: TextInputAction.send,
            fieldSubmitted: () {
              if (commentController.text.isNotEmpty) {
                context.read<CommentBloc>().add(AddComment(
                    addCommentRequest: AddCommentRequest(
                        id: widget.postId, text: commentController.text)));
                commentController.clear();
              }
            },
            autoFocus: true,
            size: size,
            controller: commentController,
            hint: 'Write a comment',
            borderRadius: 0,
          ),
        )
      ],
    );
  }

  BlocBuilder<CommentBloc, CommentState> comments(Size size) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentsLoaded) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                Comment comment = state.comments[index];

                return CommentWidget(
                  comment: comment,
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
