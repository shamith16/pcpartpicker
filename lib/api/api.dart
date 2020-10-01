import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pcpartpicker/entities/guides.dart';

final dioInstance = Dio(BaseOptions(
  baseUrl: "https://pcpartpicker.herokuapp.com"
));


Future<BuildGuides> getBuildGuides() async {
  final resp = await dioInstance.get('/guides');

  return BuildGuides.fromJson(json.decode(resp.data));
}