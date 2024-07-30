import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerUtils {
  ImagePicker imagePicker = ImagePicker();

  Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      PermissionStatus result = await Permission.camera.request();
      if (!result.isGranted) {
        // Handle the permission denial
        print('Camera permission denied');
      }
    }
  }

  Future<XFile?> cameraCapture() async {
    await requestCameraPermission();
    PermissionStatus status = await Permission.camera.status;
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickFromGallery() async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
