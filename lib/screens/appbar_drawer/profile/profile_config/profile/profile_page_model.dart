import 'dart:io';

import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {
  File? image;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  setImage(File imageFile) {
    this.image = imageFile;
    notifyListeners();
    return image;
  }
}
