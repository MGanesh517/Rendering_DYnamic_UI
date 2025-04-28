// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CommonFormDetailsModel commonFormDetailsModelFromJson(String str) => CommonFormDetailsModel.fromJson(json.decode(str));

String commonFormDetailsModelToJson(CommonFormDetailsModel data) => json.encode(data.toJson());

class CommonFormDetailsModel {
  int? id;
  String? appLabel;
  String? modelName;
  dynamic fields;
  String? rules;

  CommonFormDetailsModel({
    this.id,
    this.appLabel,
    this.modelName,
    this.fields,
    this.rules,
  });

  factory CommonFormDetailsModel.fromJson(Map<String, dynamic> json) => CommonFormDetailsModel(
    id: json["id"],
    appLabel: json["app_label"],
    modelName: json["model_name"],
    fields: json["fields"],
    rules: json["rules"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_label": appLabel,
    "model_name": modelName,
    "fields": fields?.toJson(),
    "rules": rules,
  };
}



