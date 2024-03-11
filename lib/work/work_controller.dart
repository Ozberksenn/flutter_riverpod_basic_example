import 'package:flutter/material.dart';
import 'package:riverpodworks/model/user_model.dart';
import 'package:riverpodworks/services/services.dart';

class WorkController extends ChangeNotifier {
  TabController? tabController;
  bool isLoading = false;
  int tabIndex = 0;
  List<UserModelData?> users = [];
  List<UserModelData?> savedList = [];

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

  void savedPersons(UserModelData user) {
    isLoading = false;
    savedList.add(user);
    users.remove(user);
    isLoading = true;
    notifyListeners();
  }

  void tabIndexChange(int value) {
    tabIndex = value;
    notifyListeners();
  }
}
