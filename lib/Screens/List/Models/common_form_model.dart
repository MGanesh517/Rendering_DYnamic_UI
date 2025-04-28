// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CommonFormModel commonFormModelFromJson(String str) => CommonFormModel.fromJson(json.decode(str));

String commonFormModelToJson(CommonFormModel data) => json.encode(data.toJson());

class CommonFormModel {
  int? count;
  List<FormResult>? results;

  CommonFormModel({
    this.count,
    this.results,
  });

  factory CommonFormModel.fromJson(Map<String, dynamic> json) => CommonFormModel(
    count: json["count"],
    results: json["results"] == null ? [] : List<FormResult>.from(json["results"]!.map((x) => FormResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class FormResult {
  int? id;
  String? appLabel;
  String? modelName;
  dynamic fields;

  FormResult({
    this.id,
    this.appLabel,
    this.modelName,
    this.fields,
  });

  factory FormResult.fromJson(Map<String, dynamic> json) => FormResult(
    id: json["id"],
    appLabel: json["app_label"],
    modelName: json["model_name"],
    // fields: json["fields"] == null ? null : ResultFields.fromJson(json["fields"]),
    fields: json["fields"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_label": appLabel,
    "model_name": modelName,
    // "fields": fields?.toJson(),
    "fields": fields,
  };
}

class ResultFields {
  Abso? character;
  Assad? text;
  Abso? choice;
  Assad? integer;
  Abso? dateTime;
  Abso? date;
  Assad? time;
  Abso? duration;
  Abso? decimal;
  ForeignKey? manyToMany;
  ForeignKey? foreignKey;
  Abso? boolean;
  Abso? children;
  Abso? fieldsData;
  Assad? fgv;
  Abso? abso;
  Assad? adsasd;
  Assad? casdf;
  Assad? fgDsf;
  Absolin? team;
  Absolin? sad;
  Absolin? huffy;
  Assad? items;
  Abso? dropdown;
  Absolin? fgfdg;
  Absolin? absolin;
  Assad? assad;
  Assad? assadS;
  Assad? asdasa;
  Assad? sdf;
  Assad? dfgfdg;
  Assad? dfgdfgdfgdfgdfg;
  Abso? dodd;
  Assad? asdfsfd;
  Assad? adds;
  Assad? dfdsfd;
  Assad? sdfds;
  Assad? ghddfg;
  Assad? fdsfdsfsdff;
  Assad? asdasdad;
  Assad? dfgdfgfd;
  Assad? heheh;
  Assad? fdsfsd;
  Assad? safdar;
  Assad? listTypes;

  ResultFields({
    this.character,
    this.text,
    this.choice,
    this.integer,
    this.dateTime,
    this.date,
    this.time,
    this.duration,
    this.decimal,
    this.manyToMany,
    this.foreignKey,
    this.boolean,
    this.children,
    this.fieldsData,
    this.fgv,
    this.abso,
    this.adsasd,
    this.casdf,
    this.fgDsf,
    this.team,
    this.sad,
    this.huffy,
    this.items,
    this.dropdown,
    this.fgfdg,
    this.absolin,
    this.assad,
    this.assadS,
    this.asdasa,
    this.sdf,
    this.dfgfdg,
    this.dfgdfgdfgdfgdfg,
    this.dodd,
    this.asdfsfd,
    this.adds,
    this.dfdsfd,
    this.sdfds,
    this.ghddfg,
    this.fdsfdsfsdff,
    this.asdasdad,
    this.dfgdfgfd,
    this.heheh,
    this.fdsfsd,
    this.safdar,
    this.listTypes,
  });

  factory ResultFields.fromJson(Map<String, dynamic> json) => ResultFields(
    character: json["Character"] == null ? null : Abso.fromJson(json["Character"]),
    text: json["Text"] == null ? null : Assad.fromJson(json["Text"]),
    choice: json["Choice"] == null ? null : Abso.fromJson(json["Choice"]),
    integer: json["Integer"] == null ? null : Assad.fromJson(json["Integer"]),
    dateTime: json["DateTime"] == null ? null : Abso.fromJson(json["DateTime"]),
    date: json["Date"] == null ? null : Abso.fromJson(json["Date"]),
    time: json["Time"] == null ? null : Assad.fromJson(json["Time"]),
    duration: json["Duration"] == null ? null : Abso.fromJson(json["Duration"]),
    decimal: json["Decimal"] == null ? null : Abso.fromJson(json["Decimal"]),
    manyToMany: json["ManyToMany"] == null ? null : ForeignKey.fromJson(json["ManyToMany"]),
    foreignKey: json["ForeignKey"] == null ? null : ForeignKey.fromJson(json["ForeignKey"]),
    boolean: json["Boolean"] == null ? null : Abso.fromJson(json["Boolean"]),
    children: json["Children"] == null ? null : Abso.fromJson(json["Children"]),
    fieldsData: json["Fields Data"] == null ? null : Abso.fromJson(json["Fields Data"]),
    fgv: json["fgv"] == null ? null : Assad.fromJson(json["fgv"]),
    abso: json["Abso"] == null ? null : Abso.fromJson(json["Abso"]),
    adsasd: json["adsasd"] == null ? null : Assad.fromJson(json["adsasd"]),
    casdf: json["casdf"] == null ? null : Assad.fromJson(json["casdf"]),
    fgDsf: json["fg dsf"] == null ? null : Assad.fromJson(json["fg dsf"]),
    team: json["Team"] == null ? null : Absolin.fromJson(json["Team"]),
    sad: json["sad"] == null ? null : Absolin.fromJson(json["sad"]),
    huffy: json["huffy"] == null ? null : Absolin.fromJson(json["huffy"]),
    items: json["items"] == null ? null : Assad.fromJson(json["items"]),
    dropdown: json["Dropdown"] == null ? null : Abso.fromJson(json["Dropdown"]),
    fgfdg: json["fgfdg"] == null ? null : Absolin.fromJson(json["fgfdg"]),
    absolin: json["Absolin"] == null ? null : Absolin.fromJson(json["Absolin"]),
    assad: json["Assad"] == null ? null : Assad.fromJson(json["Assad"]),
    assadS: json["Assad’s"] == null ? null : Assad.fromJson(json["Assad’s"]),
    asdasa: json["asdasa"] == null ? null : Assad.fromJson(json["asdasa"]),
    sdf: json["sdf"] == null ? null : Assad.fromJson(json["sdf"]),
    dfgfdg: json["dfgfdg"] == null ? null : Assad.fromJson(json["dfgfdg"]),
    dfgdfgdfgdfgdfg: json["dfgdfgdfgdfgdfg"] == null ? null : Assad.fromJson(json["dfgdfgdfgdfgdfg"]),
    dodd: json["Dodd"] == null ? null : Abso.fromJson(json["Dodd"]),
    asdfsfd: json["asdfsfd"] == null ? null : Assad.fromJson(json["asdfsfd"]),
    adds: json["adds"] == null ? null : Assad.fromJson(json["adds"]),
    dfdsfd: json["dfdsfd"] == null ? null : Assad.fromJson(json["dfdsfd"]),
    sdfds: json["sdfds"] == null ? null : Assad.fromJson(json["sdfds"]),
    ghddfg: json["ghddfg"] == null ? null : Assad.fromJson(json["ghddfg"]),
    fdsfdsfsdff: json["fdsfdsfsdff"] == null ? null : Assad.fromJson(json["fdsfdsfsdff"]),
    asdasdad: json["asdasdad"] == null ? null : Assad.fromJson(json["asdasdad"]),
    dfgdfgfd: json["dfgdfgfd"] == null ? null : Assad.fromJson(json["dfgdfgfd"]),
    heheh: json["heheh"] == null ? null : Assad.fromJson(json["heheh"]),
    fdsfsd: json["fdsfsd"] == null ? null : Assad.fromJson(json["fdsfsd"]),
    safdar: json["safdar"] == null ? null : Assad.fromJson(json["safdar"]),
    listTypes: json["List Types"] == null ? null : Assad.fromJson(json["List Types"]),
  );

  Map<String, dynamic> toJson() => {
    "Character": character?.toJson(),
    "Text": text?.toJson(),
    "Choice": choice?.toJson(),
    "Integer": integer?.toJson(),
    "DateTime": dateTime?.toJson(),
    "Date": date?.toJson(),
    "Time": time?.toJson(),
    "Duration": duration?.toJson(),
    "Decimal": decimal?.toJson(),
    "ManyToMany": manyToMany?.toJson(),
    "ForeignKey": foreignKey?.toJson(),
    "Boolean": boolean?.toJson(),
    "Children": children?.toJson(),
    "Fields Data": fieldsData?.toJson(),
    "fgv": fgv?.toJson(),
    "Abso": abso?.toJson(),
    "adsasd": adsasd?.toJson(),
    "casdf": casdf?.toJson(),
    "fg dsf": fgDsf?.toJson(),
    "Team": team?.toJson(),
    "sad": sad?.toJson(),
    "huffy": huffy?.toJson(),
    "items": items?.toJson(),
    "Dropdown": dropdown?.toJson(),
    "fgfdg": fgfdg?.toJson(),
    "Absolin": absolin?.toJson(),
    "Assad": assad?.toJson(),
    "Assad’s": assadS?.toJson(),
    "asdasa": asdasa?.toJson(),
    "sdf": sdf?.toJson(),
    "dfgfdg": dfgfdg?.toJson(),
    "dfgdfgdfgdfgdfg": dfgdfgdfgdfgdfg?.toJson(),
    "Dodd": dodd?.toJson(),
    "asdfsfd": asdfsfd?.toJson(),
    "adds": adds?.toJson(),
    "dfdsfd": dfdsfd?.toJson(),
    "sdfds": sdfds?.toJson(),
    "ghddfg": ghddfg?.toJson(),
    "fdsfdsfsdff": fdsfdsfsdff?.toJson(),
    "asdasdad": asdasdad?.toJson(),
    "dfgdfgfd": dfgdfgfd?.toJson(),
    "heheh": heheh?.toJson(),
    "fdsfsd": fdsfsd?.toJson(),
    "safdar": safdar?.toJson(),
    "List Types": listTypes?.toJson(),
  };
}

class Abso {
  String? type;
  bool? required;
  bool? showInView;
  bool? showInReport;
  bool? showInEdit;
  bool? showInFilter;
  bool? showInList;
  bool? showInAdd;
  dynamic fields;
  dynamic absoDefault;
  int? maxLength;
  int? minLength;
  List<List<dynamic>>? choices;
  bool? readOnly;
  bool? rangeFilter;
  int? maxDigits;
  int? decimalPlaces;

  Abso({
    this.type,
    this.required,
    this.showInView,
    this.showInReport,
    this.showInEdit,
    this.showInFilter,
    this.showInList,
    this.showInAdd,
    this.fields,
    this.absoDefault,
    this.maxLength,
    this.minLength,
    this.choices,
    this.readOnly,
    this.rangeFilter,
    this.maxDigits,
    this.decimalPlaces,
  });

  factory Abso.fromJson(Map<String, dynamic> json) => Abso(
    type: json["type"],
    required: json["required"],
    showInView: json["show_in_view"],
    showInReport: json["show_in_report"],
    showInEdit: json["show_in_edit"],
    showInFilter: json["show_in_filter"],
    showInList: json["show_in_list"],
    showInAdd: json["show_in_add"],
    fields: json["fields"],
    absoDefault: json["default"],
    maxLength: json["max_length"],
    minLength: json["min_length"],
    choices: json["choices"] == null ? [] : List<List<dynamic>>.from(json["choices"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    readOnly: json["read_only"],
    rangeFilter: json["range_filter"],
    maxDigits: json["max_digits"],
    decimalPlaces: json["decimal_places"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "required": required,
    "show_in_view": showInView,
    "show_in_report": showInReport,
    "show_in_edit": showInEdit,
    "show_in_filter": showInFilter,
    "show_in_list": showInList,
    "show_in_add": showInAdd,
    "fields": fields,
    "default": absoDefault,
    "max_length": maxLength,
    "min_length": minLength,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "read_only": readOnly,
    "range_filter": rangeFilter,
    "max_digits": maxDigits,
    "decimal_places": decimalPlaces,
  };
}

class FilterDataClass {
  FilterDataClass();

  factory FilterDataClass.fromJson(Map<String, dynamic> json) => FilterDataClass(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Absolin {
  String? type;
  String? fields;

  Absolin({
    this.type,
    this.fields,
  });

  factory Absolin.fromJson(Map<String, dynamic> json) => Absolin(
    type: json["type"],
    fields: json["fields"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "fields": fields,
  };
}

class Assad {
  String? type;
  bool? required;
  bool? rangeFilter;
  bool? showInView;
  bool? showInReport;
  bool? showInEdit;
  bool? showInFilter;
  bool? showInList;
  bool? showInAdd;
  int? assadDefault;
  List<List<dynamic>>? choices;
  int? maxLength;
  int? minLength;
  bool? readOnly;
  FilterDataClass? fields;

  Assad({
    this.type,
    this.required,
    this.rangeFilter,
    this.showInView,
    this.showInReport,
    this.showInEdit,
    this.showInFilter,
    this.showInList,
    this.showInAdd,
    this.assadDefault,
    this.choices,
    this.maxLength,
    this.minLength,
    this.readOnly,
    this.fields,
  });

  factory Assad.fromJson(Map<String, dynamic> json) => Assad(
    type: json["type"],
    required: json["required"],
    rangeFilter: json["range_filter"],
    showInView: json["show_in_view"],
    showInReport: json["show_in_report"],
    showInEdit: json["show_in_edit"],
    showInFilter: json["show_in_filter"],
    showInList: json["show_in_list"],
    showInAdd: json["show_in_add"],
    assadDefault: json["default"],
    choices: json["choices"] == null ? [] : List<List<dynamic>>.from(json["choices"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    maxLength: json["max_length"],
    minLength: json["min_length"],
    readOnly: json["read_only"],
    fields: json["fields"] == null ? null : FilterDataClass.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "required": required,
    "range_filter": rangeFilter,
    "show_in_view": showInView,
    "show_in_report": showInReport,
    "show_in_edit": showInEdit,
    "show_in_filter": showInFilter,
    "show_in_list": showInList,
    "show_in_add": showInAdd,
    "default": assadDefault,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "max_length": maxLength,
    "min_length": minLength,
    "read_only": readOnly,
    "fields": fields?.toJson(),
  };
}

class ForeignKey {
  String? type;
  bool? required;
  bool? showInView;
  bool? showInReport;
  bool? showInEdit;
  bool? showInFilter;
  bool? showInList;
  bool? showInAdd;
  String? to;
  List<String>? readFields;
  FilterDataClass? filterData;
  String? relatedName;
  List<String>? importFields;
  List<String>? exportFields;
  bool? multipleFilter;

  ForeignKey({
    this.type,
    this.required,
    this.showInView,
    this.showInReport,
    this.showInEdit,
    this.showInFilter,
    this.showInList,
    this.showInAdd,
    this.to,
    this.readFields,
    this.filterData,
    this.relatedName,
    this.importFields,
    this.exportFields,
    this.multipleFilter,
  });

  factory ForeignKey.fromJson(Map<String, dynamic> json) => ForeignKey(
    type: json["type"],
    required: json["required"],
    showInView: json["show_in_view"],
    showInReport: json["show_in_report"],
    showInEdit: json["show_in_edit"],
    showInFilter: json["show_in_filter"],
    showInList: json["show_in_list"],
    showInAdd: json["show_in_add"],
    to: json["to"],
    readFields: json["read_fields"] == null ? [] : List<String>.from(json["read_fields"]!.map((x) => x)),
    filterData: json["filter_data"] == null ? null : FilterDataClass.fromJson(json["filter_data"]),
    relatedName: json["related_name"],
    importFields: json["import_fields"] == null ? [] : List<String>.from(json["import_fields"]!.map((x) => x)),
    exportFields: json["export_fields"] == null ? [] : List<String>.from(json["export_fields"]!.map((x) => x)),
    multipleFilter: json["multiple_filter"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "required": required,
    "show_in_view": showInView,
    "show_in_report": showInReport,
    "show_in_edit": showInEdit,
    "show_in_filter": showInFilter,
    "show_in_list": showInList,
    "show_in_add": showInAdd,
    "to": to,
    "read_fields": readFields == null ? [] : List<dynamic>.from(readFields!.map((x) => x)),
    "filter_data": filterData?.toJson(),
    "related_name": relatedName,
    "import_fields": importFields == null ? [] : List<dynamic>.from(importFields!.map((x) => x)),
    "export_fields": exportFields == null ? [] : List<dynamic>.from(exportFields!.map((x) => x)),
    "multiple_filter": multipleFilter,
  };
}

