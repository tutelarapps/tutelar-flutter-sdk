import 'package:flutter/material.dart';
import 'package:tutelarfluttersdk/tutelarfluttersdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DemoApp(),
    );
  }
}


class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  late Tutelar tutelar;
  String detail = "";

  @override
  void initState() {
    super.initState();
    tutelar = Tutelar("YOUR API KEY");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(left: 50, top: 25, right: 50, bottom: 0),
            child: ElevatedButton(
              onPressed: () async {
                var response = await tutelar.getDeviceDetails();
                setState(() {
                  if(response['success'] == true){
                    detail = response['data'];
                  }else{
                    detail = response['message'];
                  }
                });
              },
              child: const Text(
                "GET DETAIL",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              detail,
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}