import 'package:flutter/foundation.dart';

class ViewModel extends ChangeNotifier {
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  get isLoading => _isLoading;

  ///error message for showing in snackBar
  VoidCallback? onError;

  void callApi(AsyncCallback api) {
    isLoading = true;
    notifyListeners();
    api().then((_) {
      isLoading = false;
      notifyListeners();
    }).catchError((th) {
      debugPrint("Caught Error while calling api: $th");
      debugPrint("Type of Exception: ${th.runtimeType}");
      onError?.call();
      isLoading = false;
      notifyListeners();
    });
  }
}
