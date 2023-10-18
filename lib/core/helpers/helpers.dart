import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/response/error_response.dart';

String defaultLogo() {
  return 'assets/images/default/logo.png';
}

String defaultUserPhoto() {
  return 'assets/images/default/user.png';
}

String iconsPath(String iconName) {
  return 'assets/icons/$iconName';
}

String photosPath(String iconName) {
  return 'assets/images/default/$iconName';
}

Future<List<CroppedFile>> pickFilesFromGallery(BuildContext context) async {
  List<CroppedFile> files = [];

  try {
    final imagePicker = ImagePicker();
    final pickedFiles = await imagePicker.pickMultipleMedia();

    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
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
