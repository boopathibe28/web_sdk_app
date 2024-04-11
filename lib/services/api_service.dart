import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:web_sdk_app/constants.dart';
import 'package:web_sdk_app/model/user_model.dart';
import 'package:web_sdk_app/model/loan_list.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        print(response.body);
        return _model;
      }
      else{
        print(response.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

/*
  Future<List<LoanListModel>?> getLoanList(String custMobile,String custPan,String customerType,String deviceId) async {
    String url = ApiConstants.APP_BASE_URL + ApiConstants.VERSION + ApiConstants.GET_LOAN_DETAILS_BY_CUSTOMER;

    Map<String, dynamic> postData = {
      'custMobile': custMobile,
      'custPan': custPan,
      'customerType': customerType,
      'deviceId': deviceId,
      'location': '',
      'platform': 'Android',
      'sdkVersion': '1/1.0',
      'source': 'SDK'
    };
    String requestBody = jsonEncode(postData);

    try {

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'ABFL-AG-OAuth': 'Bearer 1e020238-4609-34be-814c-ef52ddbf9038',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBody,
      );
      if (response.statusCode == 200) {
        print(response.body);
        List<LoanListModel> _model = loanListModelFromJson(response.body);
        return _model;
      }
      else{
        print(response.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
*/



  Future<Map<String, dynamic>?> makePostRequest(String custMobile,String custPan,String customerType,String deviceId) async {
    // Define the URL for the API endpoint
    String apiUrl = ApiConstants.APP_BASE_URL + ApiConstants.VERSION + ApiConstants.GET_LOAN_DETAILS_BY_CUSTOMER;

    // Define the request body as a Map
    Map<String, dynamic> requestBody = {
      'custMobile': custMobile,
      'custPan': custPan,
      'customerType': customerType,
      'deviceId': deviceId,
      'location': '',
      'platform': 'Android',
      'sdkVersion': '1/1.0',
      'source': 'SDK'
    };

    // Convert the request body to JSON
    String requestBodyJson = jsonEncode(requestBody);

    try {
      // Make the POST request
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'ABFL-AG-OAuth': 'Bearer 88dc3f42-48c8-349a-aed0-b22b27a1b1ab',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBodyJson,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Response data: $responseData');

        return responseData;
      }
      else {
        print('Error: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Network error: $error');
    }
  }
}
