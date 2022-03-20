import 'dart:convert';

import 'package:mvvm_sample/data/remote/api_interface.dart';
import 'package:mvvm_sample/data/remote/endpoints.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiInterface {
  @override
  Future? getUsers() async {
    var client = http.Client();
    dynamic responseJson;
    final response =
        await client.get(Uri.parse(ApiInterface.baseUrl + Endpoints.users));
    responseJson = returnResponse(response);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      //throw BadRequestException(response.toString());
      case 401:
      case 403:
      //throw UnauthorisedException(response.body.toString());
      case 404:
      //throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      //throw FetchDataException(
      //  'Error occured while communication with server' +
      //    ' with status code : ${response.statusCode}');
    }
  }
}
