import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../models/submit_data_request.dart';
import '../provider/data_provider.dart';
import '../utils/widgets.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static Map<String, TextEditingController> controllers = {
    'name': TextEditingController(),
    'user_id': TextEditingController(),
  };

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkGps();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Attendence')),
        body: SingleChildScrollView(
            child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controllers['name'],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_sharp),
                      labelText: "Name",
                      // errorText: "Email required",
                      labelStyle: TextStyle(
                          color: Color(0xFF454545),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                          color: Color(0xFF454545),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Color(0xFF454545),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: controllers['user_id'],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User Id is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        labelText: "User Id",
                        labelStyle: const TextStyle(
                            color: Color(0xFF454545),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        hintText: "Enter your User Id",
                        hintStyle: const TextStyle(
                            color: Color(0xFF454545),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        border: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                          color: Color(0xFF454545),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formkey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          ShowToast.show('Sending data', false);
                          var random = Random();
                          SubmitDataRequest model = new SubmitDataRequest(
                              name: controllers['name']?.text as String,
                              uid: int.parse(
                                  controllers['user_id']?.text as String),
                              latitude: lat,
                              longitude: long,
                              requestId: random.nextInt(16));

                          Provider.of<DataProvider>(context, listen: false)
                              .submitData(context, model);
                        }
                      },
                      child: const Text('Submit')),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
            ],
          ),
        )),
      ),
    );
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
      ShowToast.show("GPS Service is not enabled, turn on GPS location", true);
      await Geolocator.openLocationSettings().then((value) => getLocation());
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    lat = position.latitude.toString();
    long = position.longitude.toString();
    print(lat + ' ' + long);

    setState(() {
      //refresh UI
    });
  }
}
