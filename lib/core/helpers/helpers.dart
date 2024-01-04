import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

String defaultLogo() {
  return 'assets/images/default/logo.png';
}

String defaultUserPhoto() {
  return 'assets/images/default/default-user.jpg';
}

String iconsPath(String iconName) {
  return 'assets/icons/$iconName';
}

String photosPath(String iconName) {
  return 'assets/images/default/$iconName';
}

ImageProvider getPhoto(String? link) {
  return link != null
      ? NetworkImage(link)
      : AssetImage(defaultUserPhoto()) as ImageProvider;
}

Future<List<CroppedFile>> pickFilesFromGallery(
  BuildContext context,
) async {
  List<CroppedFile> files = [];

  try {
    final imagePicker = ImagePicker();
    List<XFile> pickedFiles;
    pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        CroppedFile? croppedFile = await cropImage(pickedFile.path);

        if (croppedFile != null) {
          files.add(croppedFile);
        }
      }
    }
  } catch (e) {
    Future.microtask(() =>
        ErrorHandler.showError(context, ErrorResponse(message: e.toString())));
  }

  return files;
}

Future<XFile?> pickFileFromGallery(
  BuildContext context,
) async {
  XFile? pickedFile;
  try {
    final imagePicker = ImagePicker();
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  } catch (e) {
    Future.microtask(() =>
        ErrorHandler.showError(context, ErrorResponse(message: e.toString())));
  }

  return pickedFile;
}

Future<CroppedFile?> cropImage(String filePath) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: primaryBlueButtonColor,
          toolbarTitle: "Crop Image",
          statusBarColor: primaryBlueButtonColor,
          backgroundColor: Colors.white,
        ),
      ]);
  return croppedFile;
}

pickImageForStory(BuildContext context) async {
  XFile? file = await pickFileFromGallery(context);
  if (file != null) {
    Future.microtask(() => context.navigateTo(AddStoryRoute(file: file)));
  }
}

String socketUrl() {
  return "wss://instagram.bakudevs.com/ws";
}

UserModel auth() {
  return locator<LocalDatabase>().get('user') as UserModel;
}

String myToken() {
  return locator<LocalDatabase>().get('token');
}
