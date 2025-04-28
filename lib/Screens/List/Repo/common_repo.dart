import 'package:baseproject_rendering/Screens/List/Models/common_form_model.dart';
import 'package:baseproject_rendering/Screens/List/Models/common_form_view_model.dart';
import 'package:baseproject_rendering/Screens/List/Models/common_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MiniRepo {
  final dio = Dio();

  Future<List<MiniCommonModel>> loadEstimations(url) async {
    List<MiniCommonModel> result = [];
    try {
      dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1X2kiOiJzdSIsInVfdCI6IlVzZXIiLCJleHAiOjE3NzIwMTkyMTEsImlhdCI6MTc0MDQ4MzIxMS41MDcyfQ.34hNF50HAqRMBGi6n1lh7SRJP63SxSWg8bk5W6arZgY';

      var response = await dio.get(
          url);

      if (response.statusCode == 200) {
        debugPrint("Response Data:  ${response.data}");
        var data = response.data['results'];
        data.forEach((item) {
          result.add(MiniCommonModel.fromJson(item));
        });
        return result;
      } else {
        return result;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return result;
  }

  Future<List<dynamic>> loadMasterItems(url) async {
    List<dynamic> result = [];
    try {
      dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1X2kiOiJzdSIsInVfdCI6IlVzZXIiLCJleHAiOjE3NzIwMTkyMTEsImlhdCI6MTc0MDQ4MzIxMS41MDcyfQ.34hNF50HAqRMBGi6n1lh7SRJP63SxSWg8bk5W6arZgY';

      var response = await dio.get(
          url);

      if (response.statusCode == 200) {
        debugPrint("Response Data:  ${response.data}");
        var data = response.data['results'];
        data.forEach((item) {
          result.add(item);
        });
        return result;
      } else {
        return result;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return result;
  }

  Future<CommonFormModel?> getFormDetails() async {
    try {
      dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1X2kiOiJzdSIsInVfdCI6IlVzZXIiLCJleHAiOjE3NzIwMTkyMTEsImlhdCI6MTc0MDQ4MzIxMS41MDcyfQ.34hNF50HAqRMBGi6n1lh7SRJP63SxSWg8bk5W6arZgY';
      var response = await dio.get(
          "http://dynamicdjango.dev.absol.in/dynamicdjango/dynamic_model/",options: Options());
      print("Print Response:::${response.data}");
      if (response.statusCode == 200) {
        return CommonFormModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message); //throw e.response!.data;
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }
  Future<CommonFormDetailsModel?> getFormViewDetails(id) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1X2kiOiJzdSIsInVfdCI6IlVzZXIiLCJleHAiOjE3NzIwMTkyMTEsImlhdCI6MTc0MDQ4MzIxMS41MDcyfQ.34hNF50HAqRMBGi6n1lh7SRJP63SxSWg8bk5W6arZgY';
      var response = await dio.get(
          "http://dynamicdjango.dev.absol.in/dynamicdjango/dynamic_model/$id/",options: Options());
      print("Print Response:::${response.data}");
      if (response.statusCode == 200) {
        return CommonFormDetailsModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message); //throw e.response!.data;
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }
}