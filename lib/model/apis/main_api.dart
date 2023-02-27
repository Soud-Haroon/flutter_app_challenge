import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_challenge/model/apis/base_api.dart';

class MainAppFetch extends BaseApi {
  final Dio _dio = Dio();

  @override
  Future fetchData() async {
    dynamic jsonResponse;
    try {
      Response response = await _dio.get(baseUrl);
      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on TimeoutException {
      return "Time out";
    } on SocketException {
      throw "No Internet Connection";
    }
  }

  // @visibleForTesting
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data; //responseJson;
      case 400:
        throw "Invalid Request";
      case 401:
      case 403:
        throw "Unauthorised Request";
      case 500:
      default:
        throw 'Error occured while communication with server'
            ' with status code : ${response.statusCode}';
    }
  }
}

// var a = jsonEncode(response.data);
//   var responseJson = jsonDecode(a);