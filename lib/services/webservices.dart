import 'dart:convert' as convert;
import 'dart:convert';

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salaryredesign/modals/userData.dart';


import '../constants/globalkeys.dart';
import '../providers/clock.dart';
import '../widgets/showSnackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Webservices {






  static Future<http.Response> getData(String url, BuildContext context,) async {
    UserModal? user = await Provider.of<GlobalModal>(context, listen: false).userData;

    http.Response response =
    http.Response('{"message":"failure","status":0}', 404);
    log('called $url------------');
    try {
      response = await http.get(
        Uri.parse(url),
        headers:user==null?{}:
        {'Authorization':'Bearer ${user.token}'},
      );
      log('Bearer ${user!.token}');
      print('The response status for url $url is ${response.statusCode}');
      // if(response.statusCode!=200){
      //   print('The response status for url $url is ${response.statusCode}');
      // }
      log(response.body);
    } catch (e) {
      // showSnackbar(context, text)
      log('Error in $url : ------ $e');
    }

    // try {
    //   response = await http.get(
    //     Uri.parse(url),
    //     headers:user==null?{}:
    //     {'Authorization':'Bearer ${user.token}'},
    //   );
    //   log('Bearer ${user!.token}');
    //   if(response.statusCode==422){
    //     return response ;
    //   }else if(response.statusCode!=200){
    //     print('The response status for url $url is ${response.statusCode}');
    //   }
    //   log(response.body);
    // }
    return response;
  }


  static Future<Map<String, dynamic>> postData(
      {required String apiUrl,
        required Map<String, dynamic> body,
        bool showSuccessMessage = false,
        required BuildContext context}) async {
    http.Response response =
    http.Response('{"message":"failure","status":0}', 404);
    try {
      Map<String, String>? headers={};

      UserModal? user = await Provider.of<GlobalModal>(context, listen: false).userData;
      if(user==null){
        headers={};
      }else{
        headers= {'Authorization':'Bearer ${user.token}'};
      }
      print('object----------585 ${headers}');
      response = await http.post(Uri.parse(apiUrl),
        body: body,
        headers:headers,
      );


      if (response.statusCode == 200) {
        // print('object--token--------999 Bearer ${user!.token}');

        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        if (jsonResponse['status'] == 1) {
          if(showSuccessMessage)
            // showSnackbar(context, jsonResponse['message']);
            return jsonResponse;
        } else {
          // showSnackbar(context, jsonResponse['message'].toString());
        }
        return jsonResponse;
      }
    } catch (e) {
      log('Error in $apiUrl : ------ $e');
    }
    print('Error in api failed of url $apiUrl with response code ${response.statusCode} and body ${response.body}');
    log(response.body);
    return {"status": 0, "message": "Something went wrong . Please try again later."};
  }

  // static Future<http.Response> postMultipartData({required String url, required Map<String, dynamic> request})async{
  //   http.Response response = http.Response('{"message":"failure","status":0}', 404);
  //   try{
  //     log('the request for $url is $request');
  //     response = await http.post(
  //         Uri.parse(url),
  //         body: request
  //     );
  //   }
  //   catch(e){
  //     log('Error in $url : ------ $e');
  //   }
  //   return response;
  // }


  static Future<Map<String, dynamic>> getMap(String url, {Map<String, dynamic>? request, bool isGetMethod = false, showFullResponse = false}) async {

    Map<String, dynamic> tempRequest = {};
    if(request!=null){
      request.forEach((key, value) {
        if(value!=null){
          tempRequest['$key'] = value;
        }
      });
    }
    try{
      log('the request for url $url is $tempRequest');
      late http.Response response;
      if(request==null){
        response = await http.get(Uri.parse(url));
      }else{
        if(isGetMethod){
          String tempGetRequest = '?';
          tempRequest.forEach((key, value) {
            tempGetRequest +=key+'=' + value + '&';

          });
          tempGetRequest = tempGetRequest.substring(0,tempGetRequest.length-1);
          print('the url issss $url$tempGetRequest');
          response = await http.get(Uri.parse(url + tempGetRequest));
        }else{
          response = await http.post(Uri.parse(url), body: tempRequest);
        }

      }
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['status'] == 1) {
          log('the respognse for url: $url is ${jsonResponse}');
          if(showFullResponse)
            return jsonResponse;
          return jsonResponse['data'] ?? jsonResponse['content']??{};
        } else {
          log('Error in response for url $url -----${response.body}');

        }
      }else{
        print('error in status code ${response.statusCode}');
        log(response.body);
      }
    }catch(e){
      print('inside catch block. Error in getting response for search doctors 546745 $e');
    }

    return {};
  }

  static Future<List> getList(String url,{required BuildContext context}) async {
    var response = await getData(url,context);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse['status'] == 1) {
        log('the response for url: $url is ${jsonResponse}');
        return jsonResponse['data']??[];
      } else {
        log('Error in response for url $url -----${response.body}');
      }
    }
    return [];
  }
  static Future<List> getListFromRequestParameters(String url, Map<String, dynamic> request) async {

    Map<String, dynamic> tempRequest = {};
    request.forEach((key, value) {
      if(value!=null){
        tempRequest['$key'] = value;
      }
    });
    try{
      log('the request for url $url is $tempRequest');
      var response = await http.post(Uri.parse(url), body: tempRequest);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['status'] == 1) {
          log('the respognse for url: $url is ${jsonResponse}');
          return jsonResponse['data'] ?? [];
        } else {
          log('Error in response for url $url -----${response.body}');
        }
      }else{
        print('error in status code ${response.statusCode}');
        log(response.body);
      }
    }catch(e){
      print('inside catch block. Error in getting response for search doctors 564 $e');
    }

    return [];
  }


  static Future<Map<String, dynamic>> postDataWithImageFunction({
    required Map<String, dynamic> body,
    required Map<String, dynamic> files,
    required BuildContext context,

    /// endpoint of the api
    required String apiUrl,
    bool successAlert = false,
    bool errorAlert = true,
  }) async {
    print('the request is $body');
    var url = Uri.parse(apiUrl);
    //
    log(apiUrl);
    log('filesfiles $files');
    try {
      UserModal? user = Provider.of<GlobalModal>(context, listen: false).userData;
      var request = new http.MultipartRequest("POST", url,);
      request.headers.addAll(user==null?{}:
      {'Authorization':'Bearer ${user.token}'});
      body.forEach((key, value) {
        request.fields[key] = value;
        // log(value2);
      });

      if (files != null) {
        (files as Map<dynamic, dynamic>).forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path));
        });
      }


      // print("files----------------------${request.files}");
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      log(response.body);
      var jsonResponse = convert.jsonDecode(response.body);
      print('8686 error in api url $url with status code ${response.statusCode}');
      if (jsonResponse['success'] == 1) {
        if (successAlert) {
          showSnackbar(context, jsonResponse['message']);
        }
      } else {
        if (errorAlert) {
          showSnackbar(context, jsonResponse['message']);
        }
      }
      return jsonResponse;
      // return response;
    } catch (e) {
      print(e);
      try{
        Map<dynamic,dynamic> headers={};
        UserModal? user = await Provider.of<GlobalModal>(context, listen: false).userData;
        var response = await http.post(
            url,
            body: body,
          headers:user==null?{}:
          {'Authorization':'Bearer ${user.token}'},
        );
        if(response.statusCode==200){
          var jsonResponse = convert.jsonDecode(response.body);
          return jsonResponse;
        }
      }catch(error){
        print('inside double catch block $error');
      }
      return {'status': 0, 'message': "fail"};
      // return null;
    }
  }



// static Future<void> updateDeviceToken({
//   required String userId,
//   required String token,
// }) async {
//   var request = {
//     "user_id": userId,
//     "device_id": token,
//   };
//   print('the device token request for url ${ApiUrls.updateDeviceToken} is $request');
//   try {
//     var response = await http.post(
//       Uri.parse(ApiUrls.updateDeviceToken),
//       body: request,
//     );
//     if (response.statusCode == 200) {
//       print('the device token is updated');
//     } else {
//
//       print('error in device token with status code ${response.statusCode}');
//       log(response.body);
//     }
//   } catch (e) {
//     print('error in device token:  $e');
//   }
// }


}



/// make booking api console
/// Error in api failed of url https://www.bluediamondresearch.com/WEB01/Teleheath/Api/User_api/makeBooking with response code 500 and
// <div style="border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;">
//
// <h4>An uncaught Exception was encountered</h4>
//
// <p>Type: Error</p>
// <p>Message: Call to undefined function getBookingById()</p>
// <p>Filename: /home4/bluednmd/public_html/WEB01/Teleheath/application/controllers/Api/User_api.php</p>
// <p>Line Number: 2658</p>
//
//
// <p>Backtrace:</p>
//
//
//
//
// <p style="margin-left:10px">
//     File: /home4/bluednmd/public_html/WEB01/Teleheath/index.php<br />
// Line: 318<br />
// Function: require_once			</p>
//
//
//
// </div>
