import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../model/exception_model.dart';
import '../../../model/secure_model.dart';
import '../../main.dart';
import '../config/routes.dart';
import '../enum/enums.dart';

mixin DataSource {
  final defaultHeader = {'referer': 'https://needs-tyranno.web.app/', 'Connection': 'Keep-Alive'};

  static (StatusCode, dynamic) checkStatus(http.StreamedResponse response, dynamic body, url, {bool? loginRequest}) {
    // logger.d('$url \n===============================================================\n ${jsonEncode(body)}');
    if (response.statusCode == 200) {
      return (StatusCode.success, body);
    } else if (response.statusCode == 201) {
      return (StatusCode.success, body);
    } else if (response.statusCode == 400) {
      final exceptionModel = ExceptionModel.fromJson(body);
      return (StatusCode.badRequest, exceptionModel.exceptionMessage);
    } else if (response.statusCode == 401) {
      final exceptionModel = ExceptionModel.fromJson(body);
      if (loginRequest ?? true && navigatorKey.currentContext != null) {
        navigatorKey.currentContext!.push('/login/false');
      }
      return (StatusCode.unAuthorized, exceptionModel.exceptionMessage);
    } else if (response.statusCode == 403) {
      if (loginRequest ?? true && navigatorKey.currentContext != null) {
        navigatorKey.currentContext!.push('/login/false');
      }
      final exceptionModel = ExceptionModel.fromJson(body);
      return (StatusCode.forbidden, exceptionModel.exceptionMessage);
    } else if (response.statusCode == 404) {
      final exceptionModel = ExceptionModel.fromJson(body);
      return (StatusCode.notFound, exceptionModel.exceptionMessage);
    } else {
      final exceptionModel = ExceptionModel.fromJson(body);
      return (StatusCode.error, exceptionModel.exceptionMessage);
    }
  }

  static Uri getUrl(String url, {String? param, String? query}) {
    final paramUrl = param != null ? '$url/$param' : url;
    return Uri.parse(query != null ? "$paramUrl?$query" : paramUrl);
  }

  static http.MultipartRequest jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      request.fields[key] = data[key].toString();
    }
    return request;
  }

  static Future<TokenData> getTokenData() async {
    var secureString = await AppConfig.to.storage.read(key: 'secureInfo');
    if (secureString != null) {
      return SecureModel.fromJson(jsonDecode(secureString)).tokenData;
    } else {
      return TokenData(accessToken: "", refreshToken: "");
    }
  }

  Future<(StatusCode, dynamic)> get(String url, {TokenType token = TokenType.none, String? param, String? query, Map<String, dynamic>? body, bool? loginRequest}) async {
    final request = http.Request('GET', getUrl(url, param: param, query: query));
    request.headers.addAll(defaultHeader);
    switch (token) {
      case TokenType.none:
      case TokenType.refreshToken:
      case TokenType.customToken:
        break;
      case TokenType.accessToken:
        request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
        break;
    }
    if (body != null) request.body = jsonEncode(body);
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url, loginRequest: loginRequest);
  }

  Future<(StatusCode, dynamic)> post(String url, {TokenType token = TokenType.none, String? param, String? query, String? customToken, Map<String, dynamic>? body, bool loginRequest = true}) async {
    final request = http.Request('POST', getUrl(url, param: param, query: query));
    request.headers.addAll(defaultHeader);
    request.headers.addAll({'Content-Type': 'application/json'});
    switch (token) {
      case TokenType.none:
        break;
      case TokenType.refreshToken:
        request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).refreshToken}'});
        request.body = jsonEncode({'token': (await getTokenData()).accessToken});
        break;
      case TokenType.customToken:
        request.headers.addAll({'Authorization': 'Bearer $customToken'});
        break;
      case TokenType.accessToken:
        request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
        break;
    }
    if (body != null) request.body = jsonEncode(body);
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url, loginRequest: loginRequest);
  }

  Future<(StatusCode, dynamic)> postWithImage(String url,
      {TokenType token = TokenType.none, String? param, String? query, Map<String, dynamic> body = const {}, List<int>? imageByte, List<http.MultipartFile>? images}) async {
    final request = jsonToFormData(http.MultipartRequest('POST', getUrl(url, param: param, query: query)), body);
    request.headers.addAll(defaultHeader);
    if (token == TokenType.accessToken) request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
    if (imageByte != null && imageByte.isNotEmpty) request.files.add(http.MultipartFile.fromBytes('file', imageByte));
    if (images != null && images.isNotEmpty) request.files.addAll(images);
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url);
  }

  Future<(StatusCode, dynamic)> patch(String url, {TokenType token = TokenType.none, String? param, String? query, String? customToken, Map<String, dynamic>? body, bool loginRequest = true}) async {
    var request = http.Request('PATCH', getUrl(url, param: param, query: query));
    request.headers.addAll({'Content-Type': 'application/json'});
    if (token == TokenType.accessToken) request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
    request.headers.addAll(defaultHeader);
    request.body = jsonEncode(body);
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url);
  }

  Future<(StatusCode, dynamic)> patchWithImage(String url,
      {TokenType token = TokenType.none, String? param, String? query, Map<String, dynamic> body = const {}, List<int>? imageByte, List<http.MultipartFile>? images}) async {
    var request = http.MultipartRequest('PATCH', getUrl(url, param: param, query: query));
    request.headers.addAll(defaultHeader);
    if (token == TokenType.accessToken) request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
    if (imageByte != null && imageByte.isNotEmpty) request.files.add(http.MultipartFile.fromBytes('file', imageByte, filename: 'image.jpg', contentType: MediaType('file', 'brandImage')));
    if (images != null && images.isNotEmpty) request.files.addAll(images);
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url);
  }

  Future<(StatusCode, dynamic)> delete(String url, {TokenType token = TokenType.none, String? param, String? query, Map<String, dynamic>? body}) async {
    final request = http.Request('DELETE', getUrl(url, param: param, query: query));
    request.headers.addAll(defaultHeader);
    if (token == TokenType.accessToken) request.headers.addAll({'Authorization': 'Bearer ${(await getTokenData()).accessToken}'});
    if (body != null) request.body = jsonEncode(body);
    http.StreamedResponse response = await request.send();
    return checkStatus(response, await jsonDecode(await response.stream.bytesToString()), request.url);
  }
}
