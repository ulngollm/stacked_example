import 'dart:math';

import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  String text;
  int number;
  List<String> users;
  ViewModel(String text) {
    this.number = 0;
    this.text = text;
    this.users = [];
    this.setBusy(true);
    this.setBusyForObject(users, true);
    this.setBusyForObject(number, true);
    

  }

  Future<void> loadScreen() async {
    await Future.delayed(Duration(milliseconds: 5000), () {
      setBusy(false);
    });
    // notifyListeners();
  }

  getUsers() {
    users = ['Ivan', 'Allah', 'Blablah'];
    print(users);
    setBusyForObject(users, false);
  }

  Future<int> getRandomValue() async {
    setBusyForObject(number, false);
    while (true) {
      await Future.delayed(Duration(milliseconds: 2000), () {
        number = Random().nextInt(50);
        notifyListeners();
      });
    }
  }
}
