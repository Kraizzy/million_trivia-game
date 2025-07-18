import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millionaire_trivia/models/country_model.dart';

Future<List<Country>> loadCountries(BuildContext context) async {
  try {
    final String data = await DefaultAssetBundle.of(context).loadString('assets/country_json.json');
    final List<dynamic> jsonResult = json.decode(data);
    return jsonResult.map((e) => Country.fromJson(e)).toList();
  } catch (e) {
    print('Error loading countries: $e');
    return [];
  }
}