import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  String text;
  List<String> users;
  ViewModel(String text) {
    this.text = text;
    this.users = [];
    this.setBusy(true);
    this.setBusyForObject(users, true);
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
}
