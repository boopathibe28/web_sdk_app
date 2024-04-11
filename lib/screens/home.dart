import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_sdk_app/model/loan_list.dart';
import 'package:web_sdk_app/model/user_model.dart';
import 'package:web_sdk_app/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  late Map<String, dynamic> jsonMap;
  @override
  void initState() {
    super.initState();
     _getData();
   // _getLoanListData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getLoanListData() async {
    var responseData = await ApiService().makePostRequest("9486805899", "ASDFG1234A", "FINNRTL", "e0264b37301c0753");
    print('Response data-->: $responseData');
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
    }));
    jsonMap = responseData as Map<String, dynamic>;

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalMargin = screenWidth * 0.2; // 10% of screen width
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan List'),
      ),
        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
//margin: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(
                      horizontal: horizontalMargin, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, top: 15.0, bottom: 5.0),
                        child: Text(
                          "Loan Number : "+_userModel![index].id.toString(),
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, bottom: 5.0),
                        child: Text(
                          "Name : " +_userModel![index].username,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, bottom: 5.0),
                        child: Text(
                          "Contact : "+_userModel![index].phone,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, bottom: 5.0),
                        child: Text(
                          "Address :  "+_userModel![index].company.name,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}






// body: _userModel == null || _userModel!.isEmpty
// ? const Center(
// child: CircularProgressIndicator(),
// )
//     : ListView.builder(
// itemCount: _userModel!.length,
// itemBuilder: (context, index) {
// return Card(
// elevation: 4,
// //margin: EdgeInsets.all(16),
// margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: 16.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: <Widget>[
// Padding(
// padding: EdgeInsets.only(left: 16.0,top: 15.0,bottom: 5.0),
// child: Text(
// "Loan ID : "+_userModel![index].id.toString(),
// style: TextStyle(fontSize: 16.0),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 16.0,bottom: 5.0),
// child: Text("Customer Name : "+_userModel![index].username,
// style: TextStyle(fontSize: 16.0),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 16.0,bottom: 5.0),
// child: Text("Customer Email : "+_userModel![index].email,
// style: TextStyle(fontSize: 16.0),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 16.0,bottom: 5.0),
// child: Text("Address : "+_userModel![index].website,
// style: TextStyle(fontSize: 16.0),
// ),
// ),
// const SizedBox(
// width: 200,
// height: 20.0,
// ),
// ],
// ),
// );
// },
// ),