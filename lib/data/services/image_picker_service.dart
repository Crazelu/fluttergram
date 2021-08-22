abstract class ImagePickerService {
  Future<void> pickImage(bool camera);
}

class ImagePickerServiceImpl implements ImagePickerService {
  @override
  Future<void> pickImage(bool camera) async {
    // TODO: implement pickImage
    throw UnimplementedError();
  }
}
