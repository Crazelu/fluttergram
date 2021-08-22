import 'package:flutter/material.dart';
import 'package:fluttergram/data/services/image_picker_service.dart';
import 'package:fluttergram/data/services/storage_service.dart';
import '../../handlers/handlers.dart';
import '../../utils/locator.dart';

///Base view model with shared dependencies injected.
///All view models must extends this class.
class BaseViewModel extends ChangeNotifier {
  late NavigationHandler navigationHandler;
  late DialogHandler dialogHandler;
  late StorageService storageService;
  late ImagePickerService imagePickerService;

  BaseViewModel({
    NavigationHandler? navigationHandler,
    DialogHandler? dialogHandler,
    StorageService? storageService,
    ImagePickerService? imagePickerService,
  }) {
    this.navigationHandler = navigationHandler ?? locator();
    this.dialogHandler = dialogHandler ?? locator();
    this.storageService = storageService ?? locator();
    this.imagePickerService = imagePickerService ?? locator();
  }
  bool _loading = false;
  bool get loading => _loading;

  void toggleLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
}
