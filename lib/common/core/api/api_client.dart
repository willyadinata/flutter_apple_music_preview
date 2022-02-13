/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : api_client.dart
 * Description   : make a short http method
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../error/exceptions.dart';
import 'api_const.dart';

/// Creating HTTP client classes with short functionality.
class ApiClient {
  final Client _client;

  ApiClient(this._client);

  /// Sends an HTTP GET request with the given headers to the given URL.
  dynamic get(String path, {Map<String, dynamic>? queryParameters}) async {
    final Response response = await _client.get(
      Uri.https(ApiConst.host, path, queryParameters),
      headers: {
        'Content-Type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Status Code: ' + response.statusCode.toString());
        print('URL Request: ' + response.request.toString());
      }
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }
}
