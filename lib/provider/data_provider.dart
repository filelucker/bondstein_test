import 'package:flutter/material.dart';

import '../api_provider/data_api_provider.dart';
import '../models/store_response.dart';
import '../models/submit_data_request.dart';
import '../utils/widgets.dart';

class DataProvider extends ChangeNotifier {
  bool loadedData = false;
  int pageCount = 1;
  DataApiProvider apiProvider = DataApiProvider();

  List<Data>? storeList = [];

  void fetchData(BuildContext context) async {
    loadedData = false;
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.getStoreList(pageCount);
      loadedData = true;

      if (!result.error) {
        if (pageCount == 1) {
          storeList = [];
        }
        storeList?.addAll(result.data!.data!);
      }
    } else {
      ShowToast.show('No internet', true);
    }
    notifyListeners();
  }

  void submitData(BuildContext context, SubmitDataRequest model) async {
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.submitData(model);
      if (!result.error) {
        ShowToast.show(result.data!.userMessage!, false);
      }
    } else {
      ShowToast.show('No internet', true);
    }
  }
}
