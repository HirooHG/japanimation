
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:japanimationbloc/api/api_endpoint.dart';
import 'package:japanimationbloc/api/api_exceptions.dart';
import 'package:japanimationbloc/common/secure_storage/secure_storage.dart';
import 'package:japanimationbloc/domain/entities/base_entity.dart';

class ApiClient {

  final HttpClient client = HttpClient();

  Future<String> get(ApiEndpoint endpoint, {BaseEntity? entity, Map<String, String>? params}) async {
    String path = _getPath(params, endpoint.path);
    final request = await client.get(endpoint.host, endpoint.port, path);

    return await handleReq(request, HttpStatus.ok, entity);
  }

  Future<String> post(ApiEndpoint endpoint, BaseEntity entity) async {
    final request = await client.post(endpoint.host, endpoint.port, endpoint.path);

    return await handleReq(request, HttpStatus.noContent, entity);
  }

  Future<String> put(ApiEndpoint endpoint, BaseEntity entity) async {
    final request = await client.put(endpoint.host, endpoint.port, endpoint.path);

    return await handleReq(request, HttpStatus.noContent, entity);
  }

  Future<String> delete(ApiEndpoint endpoint, BaseEntity entity) async {
    final request = await client.delete(endpoint.host, endpoint.port, endpoint.path);

    return await handleReq(request, HttpStatus.noContent, entity);
  }

  Future<String> handleReq(HttpClientRequest request, int goodCode, BaseEntity? entity) async {
    final token = await SecureStorage().getToken();
    request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");

    if(entity != null) {
      request.headers.contentLength = utf8.encode(jsonEncode(entity.toJson())).length;
      request.write(jsonEncode(entity.toJson()));
    }

    final response = await request.close();

    if(response.statusCode != goodCode) {
      throw ApiException(
        reason: response.reasonPhrase,
        statusCode: response.statusCode
      );
    }
    
    return await response.transform(utf8.decoder).join();
  }

  String _getPath(Map<String, String>? params, String path) {
    if(params != null) {
      path += "?";
      params.forEach((key, value) {
        if(path.characters.last != "?") {
          path += "&";
        }
        path += "$key=$value";
      });
    }
    return path;
  }
}
