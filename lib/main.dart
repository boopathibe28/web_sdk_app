library web_sdk_app;

import 'package:flutter/material.dart';
import 'package:web_sdk_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String panNumber = "";
  late String mobileNumber = "";
  late String customerType = "";

  final _panNumber = TextEditingController();
  bool _validatePanNumber = false;

  final _mobileNumber = TextEditingController();
  bool _validateMobileNumber = false;

  final _customerType = TextEditingController();
  bool _validateCustomerType = false;

  void validation() {
    setState(() {
      _panNumber.text.isEmpty
          ? _validatePanNumber = true
          : _validatePanNumber = false;
      _mobileNumber.text.isEmpty
          ? _validateMobileNumber = true
          : _validateMobileNumber = false;
      _customerType.text.isEmpty
          ? _validateCustomerType = true
          : _validateCustomerType = false;
      print('Entered PAN Number : $panNumber');
      print('Entered Mobile Number : $mobileNumber');
      print('Entered Customer Type : $customerType');

      if (panNumber.isNotEmpty &&
          mobileNumber.isNotEmpty &&
          customerType.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate margin based on screen width
    double horizontalMargin = screenWidth * 0.2; // 10% of screen width

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'toolbar_image.png',
                width: 200,
                height: 200,
              ),
              Padding(
                // padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 200.0),
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: _panNumber,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PAN Number',
                    hintText: 'ABCDFG123',
                    errorText:
                        _validatePanNumber ? 'Enter valid PAN number' : null,
                  ),
                  onChanged: (value) => panNumber = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _mobileNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    hintText: '0123456789',
                    errorText: _validateMobileNumber
                        ? 'Enter valid Mobile number'
                        : null,
                  ),
                  onChanged: (value) => mobileNumber = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _customerType,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer Type',
                    hintText: 'FINNONE',
                    errorText: _validateCustomerType
                        ? 'Enter valid Customer Type'
                        : null,
                  ),
                  onChanged: (value) => customerType = value,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  validation();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Home()),
                  // );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  // Background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(16)),
                  // Padding
                  elevation: MaterialStateProperty.all<double>(4),
                  // Elevation
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // BorderRadius.circular(8) for rounded corners
                      // You can also specify other properties such as side: BorderSide(color: Colors.red)
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16, color: Colors.white), // Text style
                  ),
                ),
                child: Text('SUBMIT',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
