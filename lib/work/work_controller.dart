import 'package:flutter/material.dart';
import 'package:riverpodworks/model/user_model.dart';
import 'package:riverpodworks/services/services.dart';

class WorkController extends ChangeNotifier {
  bool isLoading = false;
  List<UserModelData?> users = [];

  void getData() {
    AppService.fetch().then((value) {
      if (value != null && value.data != []) {
        users = value.data!;
        isLoading = true;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
