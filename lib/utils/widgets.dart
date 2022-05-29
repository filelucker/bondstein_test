import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static void show(String text, bool alert) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIos: 1,
        backgroundColor: alert == true ? Colors.red : Colors.grey,
        textColor: alert == true ? Colors.white : Colors.white,
        fontSize: 16.0);
  }
}

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionFlag = true;
  if (connectivityResult == ConnectivityResult.none) {
    connectionFlag = false;
  }
  return connectionFlag;
}

Future<bool> checkConnectionWithToast(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionFlag = true;

  if (connectivityResult == ConnectivityResult.none) {
    connectionFlag = false;

    ShowToast.show('Please check your internet connection.', true);
  }
  return connectionFlag;
}

loader(context) {
  AlertDialog alert = const AlertDialog(
    content: CupertinoActivityIndicator(
      radius: 30,
    ),
  );
  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        child: alert,
        onWillPop: () async {
          return false;
        },
      );
    },
  );
}
