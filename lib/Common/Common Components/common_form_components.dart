import 'package:baseproject_rendering/Common/Common%20Components/common_components.dart';
import 'package:baseproject_rendering/Screens/List/Controllers/common_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class CommonFormComponents extends StatefulWidget {
  final String? fieldName;
      final Map<String, dynamic>? field;
  const CommonFormComponents({super.key, this.fieldName, this.field});

  @override
  State<CommonFormComponents> createState() => _CommonFormComponentsState();
}

class _CommonFormComponentsState extends State<CommonFormComponents> {
  final controller = Get.put(MiniController());

  @override
  Widget build(BuildContext context) {
    // print("Print field Name ::::$fieldName");
    // print("Print field  ::::$field");
    switch (widget.field!['type']) {
      case 'Char':
        return CommonComponents.defaultTextField(context,
            title: widget.fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[A-Z,a-z,0-9,.]'))],
            validator: (String? val){
              if(widget.field!['required']==true){
                if(val!.isEmpty){
                  return "Please Enter ${widget.fieldName}";
                }else{
                  return null;
                }
              }else{
                return null;
              }
            }
          // hintText: field['hinttext'],
        );
      case 'Text':
        return CommonComponents.defaultTextField(context,
            title: widget.fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[A-Z,a-z,0-9,.-/-]'))],
            validator: (String? val){
              if(widget.field!['required']==true){
                if(val!.isEmpty){
                  return "Please Enter ${widget.fieldName}";
                }else{
                  return null;
                }
              }else{
                return null;
              }
            }
          // hintText: field['hinttext'],
        );
      case 'Choice':
        return CommonComponents.defaultDropdownSearch(context,
            title: widget.fieldName,
            items: (widget.field!['choices'] as List),
            onChanged: (value) {
              // Handle the selected value
            },
            compareFn: (i, dynamic s) => i == s,
            itemAsString: (dynamic u) => u[1].toString());
      case 'Integer':
        return CommonComponents.defaultTextField(context, title: widget.fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          // hintText: field['hinttext'],
          validator: (String? val){
          if(widget.field!['required']==true){
            if(val!.isEmpty){
              return "Please Enter ${widget.fieldName}";
            }else{
              return null;
            }
          }else{
            return null;
          }
          }
        );
      case 'Decimal':
        return CommonComponents.defaultTextField(context, title: widget.fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9,.]'))],
            validator: (String? val){
              if(widget.field!['required']==true){
                if(val!.isEmpty){
                  return "Please Enter ${widget.fieldName}";
                }else{
                  return null;
                }
              }else{
                return null;
              }
            }
          // hintText: field['hinttext'],
        );
      case 'DateTime':
        return CommonComponents.defaultTextField(context, title: widget.fieldName,
            // hintText: field['hinttext'],

            onTap: () async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                  lastDate: DateTime(
                    2026,
                  ),
                  firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
                  .then((
                  DateTime? date,
                  ) async {
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(date),
                  );
                  debugPrint("Date & Time ::::${DateTime(date.year, date.month, date.day, time!.hour, time.minute)}");
                  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
                } else {
                  return null;
                }
              });
              debugPrint("Print Date Time :::::::${picked!.day}-${picked.month}-${picked.year}");
              debugPrintSynchronously("Print Date Time :::::::${picked.day}-${picked.month}-${picked.year}");
            },
            validator: (String? val){
              if(widget.field!['required']==true){
                if(val!.isEmpty){
                  return "Please Enter ${widget.fieldName}";
                }else{
                  return null;
                }
              }else{
                return null;
              }
            }
        );
      case 'Time':
        return CommonComponents.defaultTextField(context, title: widget.fieldName,
            // hintText: field['hinttext'],
            onTap: () async {

              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(DateTime.now()),
              );
              debugPrint("Date & Time ::::${DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day, time!.hour, time.minute)}");
              // return DateTime(date.year, date.month, date.day, time.hour, time.minute);

              // debugPrint("Print Date Time :::::::${picked!.day}-${picked.month}-${picked.year}");
              // debugPrintSynchronously("Print Date Time :::::::${picked.day}-${picked.month}-${picked.year}");
            },
            validator: (String? val){
              if(widget.field!['required']==true){
                if(val!.isEmpty){
                  return "Please Enter ${widget.fieldName}";
                }else{
                  return null;
                }
              }else{
                return null;
              }
            }
        );
      case 'ForeignKey':
        return CommonComponents.defaultDropdownSearch(
          context,
          title: widget.fieldName,
          asyncItems: (String? filter) async {
            await controller.fetchMasterList(
                'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/${widget.fieldName}/');
            return controller.masterList;
          },
          onChanged: (value) {
            // Handle the selected value
          },
          compareFn: (i, dynamic s) => i != null ? i[widget.field!['read_fields'][0]] == s[widget.field!['read_fields'][0]] : false,
          itemAsString: (dynamic u) => u[widget.field!['read_fields'][0]].toString(),
        );
      case 'ManyToMany':
        return CommonComponents.defaultMultiSelectionDropdownSearch(
          context,
          title: widget.fieldName,
          asyncItems: (String? filter) async {
            await controller.fetchMasterList(
                'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/${widget.fieldName}/');
            return controller.masterList;
          },
          onChanged: (value) {
            // Handle the selected value
          },
          selectedItem: [],
          compareFn: (i, dynamic s) => i != null ? i[widget.field!['read_fields'][0]] == s[widget.field!['read_fields'][0]] : false,
          itemAsString: (dynamic u) => u[widget.field!['read_fields'][0]].toString(),
        );
      case 'Boolean':
        return Column(
            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.fieldName!, textAlign: TextAlign.left,),
              Container(height: 8),
              CupertinoSwitch(
                onChanged: (value) {
                  // controller.onChangeHypothationStatus(value);
                  setState(() {
                    widget.field!['default'] = value;
                  });
                },
                value: widget.field!['default'] ?? false,
                activeColor: Theme.of(context).colorScheme.primary,
              )
            ]);
      default:
        return Container();
    }
  }
}
