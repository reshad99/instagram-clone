// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/home/bloc/file/file_bloc.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/request/post_request.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late TextEditingController descriptionController;
  late FileBloc fileBloc;
  late PostBloc postBloc;
  late List<CroppedFile>? files;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    fileBloc = context.read<FileBloc>();
    postBloc = context.read<PostBloc>();
    files = [];
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FileBloc, FileState>(
      builder: (context, state) {
        if (state is FilesLoaded) {
          files = state.files;
        }

        if (state is FilesAddedToPost) {
          files = [];
          context.navigateTo(const HomeRoute());
        }

        if (state is FileError) {
          ErrorHandler.showError(context, state.errorResponse);
        }

        return BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ErrorHandler.showError(context, state.errorResponse);
            }
          },
          child: Scaffold(
            appBar: appBar(size, files),
            // ...
            body: ListView(
              children: [
                addPhotoButton(size, context),
                const SizedBox(height: 5),
                descriptionField(size),
                const SizedBox(height: 5),
                photosOverview(files!)
              ],
            ),
            // ...
          ),
        );
      },
    );
  }

  PreferredSize appBar(Size size, List<CroppedFile>? files) {
    return PreferredSize(
      preferredSize: Size(size.width, 70.h),
      child: AppBar(
        foregroundColor: primaryBlackColor,
        title: const Text('Add post'),
        actions: [
          IconButton(
              onPressed: () {
                if (files != null && files.isNotEmpty) {
                  postBloc.add(AddPost(
                      postRequest: PostRequest(
                    description: descriptionController.text,
                    files: files,
                  )));
                }
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }

  CustomTextField descriptionField(Size size) {
    return CustomTextField(
      size: size,
      controller: descriptionController,
      hint: 'Add a description',
      borderRadius: 0,
    );
  }

  Container addPhotoButton(Size size, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
      height: 40,
      child: CustomBlueButton(
        child: const Text('Add photos'),
        onPressed: () async {
          files = await pickFilesFromGallery(context);
          fileBloc.add(AddFiles(files: files));
        },
      ),
    );
  }

  GridView photosOverview(List<CroppedFile> files) {
    return GridView.builder(
      shrinkWrap: true, // <-- Make sure it takes only as much space as needed
      physics:
          const NeverScrollableScrollPhysics(), // <-- Since it's inside another scrolling widget
      itemCount: files.length,
      addRepaintBoundaries: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        File? file = File(files[index].path);
        if (file != null) {
          return SizedBox(
            width: 50.w,
            height: 50.h,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
