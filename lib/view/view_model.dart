import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  String text;
  ViewModel(String text) {
    this.text = text;
    this.setBusy(true);
  }

  Future<void> loadScreen() async {
    await Future.delayed(Duration(milliseconds: 5000), () {
      setBusy(false);
    });
    // notifyListeners();
  }
}
