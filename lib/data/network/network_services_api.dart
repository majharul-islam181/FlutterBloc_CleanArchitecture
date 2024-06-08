import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutterbloc_cleanarchitecture/data/exceptions/app_exceptions.dart';
import 'package:flutterbloc_cleanarchitecture/data/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse('')).timeout(const Duration(seconds: 50));
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
  }

  @override
  Future<dynamic> postApi(String url, data) async {}

  @override
  Future<dynamic> delete(String url) async {}

  dynamic returnResponse(http.Response response) {
    switch (response) {

      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 500:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      
    }
  }
}
