// ignore_for_file: constant_pattern_never_matches_value_type

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutterbloc_cleanarchitecture/data/exceptions/app_exceptions.dart';
import 'package:flutterbloc_cleanarchitecture/data/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse('')).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(''),
            body: data,
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> delete(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(
            Uri.parse(''),
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(
            'Error communicating with server${response.statusCode}');
    }
  }
}
