// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, annotate_overrides, unused_local_variable

import 'package:app/pages/reuseble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

class Screen2 extends StatefulWidget {
  final String name;
  final String addresss;
  final String number;
  final String fname;
  final String faddresss;
  final String status;

  const Screen2(
      {Key? key,
      required this.name,
      required this.addresss,
      required this.number,
      required this.fname,
      required this.faddresss,
      required this.status})
      : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController name = TextEditingController();
  TextEditingController Addresss = TextEditingController();
  TextEditingController Number = TextEditingController();

  late FlutterLocalNotificationsPlugin localNotification;

  // void _showNotification(){}

  void initState() {
    name.text = widget.name;
    Addresss.text = widget.addresss;
    Number.text = widget.number;
    Shake();
    var androidInitialize = AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    super.initState();
  }

  Future _showNotification() async {
    Vibration.vibrate(amplitude: 928);
    var androidDetails = AndroidNotificationDetails(
      "Channel ID",
      "notification",
      importance: Importance.max,
    );
    var iosDetails = IOSNotificationDetails();
    var generlNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(
        0, "title", "notification Body", generlNotificationDetails);
  }

  Shake() {
    ShakeDetector detector =
        ShakeDetector.autoStart(onPhoneShake: _showNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          //automaticallyImplyLeading: false,
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizebox(30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffFFB61D), width: 3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txt("Current Task", 30, Colors.black, FontWeight.bold),
                    textfild("Name", name),
                    sizebox(20),
                    textfild("Address", Addresss),
                    sizebox(20),
                    textfild("Mobile No", Number),
                    sizebox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: txt(
                                "From:" +
                                    widget.fname +
                                    "\n" +
                                    widget.faddresss,
                                20,
                                Colors.black,
                                FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: txt(widget.status, 18, Colors.white,
                                FontWeight.normal),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffFFB61D),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              sizebox(30),
              txt("Upcoming Task", 43, Colors.black, FontWeight.bold),
              sizebox(30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color:  Color(0xffFFB61D),width: 3)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        txt("FatehSagar lake, udaipur", 15, Colors.black,
                            FontWeight.bold),
                        Icon(Icons.arrow_downward),
                        txt("kankaria lake, maninagar", 15, Colors.black,
                            FontWeight.bold),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _showNotification,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child:
                            txt('Start', 18, Colors.white, FontWeight.normal),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFFB61D),
                      ),
                    ),
                  ],
                ),
              ),
              sizebox(20),
              Center(
                child: txt("Shake your phone and see magic", 15, Colors.black,
                    FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
