import 'dart:convert';

import 'package:cat_app_technical_test/model/breed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatRepository {
  Future<List<Breed>> getBreeds() async {
    List<Breed> result = [];
    try {
      String url = 'https://api.thecatapi.com/v1/breeds';
      Map<String, String> headers = {
        "x-api-key":
            'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
      };
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse is List) {
          for (var json in jsonResponse) {
            result.add(Breed.fromMap(json));
          }
        }
      } else {
        throw Exception(
          [
            'Failed to get breeds',
            response.statusCode,
            response.body,
          ],
        );
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return result;
  }
}
