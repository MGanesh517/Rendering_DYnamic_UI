import 'package:baseproject_rendering/Screens/List/Models/common_form_model.dart';
import 'package:baseproject_rendering/Screens/List/Models/common_form_view_model.dart';
import 'package:baseproject_rendering/Screens/List/Models/common_model.dart';
import 'package:baseproject_rendering/Screens/List/Repo/common_repo.dart';
import 'package:baseproject_rendering/Screens/List/form_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniController extends GetxController {
  static MiniController get to => Get.find();

  var fieldValues = <String, dynamic>{}.obs;

  void updateField(String key, dynamic value) {
    fieldValues[key] = value;
    print("Updated Field [$key]: $value");
  }

  Map<String, dynamic> getFormValues() {
    return fieldValues;
  }
  
  @override
  void onInit() {
    super.onInit();
    initFormState();
  }

  final _estimationList = <MiniCommonModel>[].obs;

  RxList<MiniCommonModel> get estimationList => _estimationList;

  set estimationList(value) => _estimationList.value = value;

  fetchEstimationsList(url) async {
    print("Print Url ::::$url");
    _estimationList.value = <MiniCommonModel>[];
    _estimationList.value = await MiniRepo().loadEstimations(url);
  }

  final _masterList = <dynamic>[].obs;

  RxList<dynamic> get masterList => _masterList;

  set masterList(value) => _masterList.value = value;
  fetchMasterList(url) async {
    print("Print Url ::::$url");
    _masterList.value = <dynamic>[];
    _masterList.value = await MiniRepo().loadMasterItems(url);
  }

  initFormState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
    await getFormData();
    commonFormData.results!.last.fields!.forEach((key, field) {
      print("Print Fields ::::: $field");
      commonFieldValues[key] = field['default'] ?? null;
    });
    });
  }

  Map<String, dynamic> commonFieldValues = {};
  final _commonFormData = CommonFormModel().obs;
  CommonFormModel get commonFormData => _commonFormData.value;
  set commonFormData(value) => _commonFormData.value = value;

  getFormData({bool isNavigate = true}) async {
    try {
      // showLoadingDialog();
      final data = await MiniRepo().getFormDetails();
      // closeLoadingDialog();
      if (data != null) {
        // print("Print Len ::::${data.results![0].fields}");
        _commonFormData.value = data;
        print("Print Common Form Data:::::::::::${_commonFormData.value.toJson()}");
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Api  Response error:: ${e} ");

      // closeLoadingDialog();
    }
  }


  // Map<String, dynamic> commonFieldValues = {};
  final _commonFormDetails = CommonFormDetailsModel().obs;
  CommonFormDetailsModel get commonFormDetails => _commonFormDetails.value;
  set commonFormDetails(value) => _commonFormDetails.value = value;

  getFormDetails(id,{bool isNavigate = true}) async {
    try {
      // showLoadingDialog();
      final data = await MiniRepo().getFormViewDetails(id);
      // closeLoadingDialog();
      if (data != null) {
        // print("Print Len ::::${data.results![0].fields}");
        _commonFormDetails.value = data;
        Get.to(FormDetailsView(title: "${commonFormDetails.appLabel}"), duration: Duration(milliseconds: 0), transition: Transition.noTransition);
        print("Print Common Form Data:::::::::::${_commonFormData.value.toJson()}");
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Api  Response error:: ${e} ");

      // closeLoadingDialog();
    }
  }
}