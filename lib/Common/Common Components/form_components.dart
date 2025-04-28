import 'package:baseproject_rendering/Common/Common%20Components/common_components.dart';
import 'package:baseproject_rendering/Screens/List/Controllers/common_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class FormComponents {
  static final FormComponents _singleton = FormComponents._internal();
  FormComponents._internal();
  static FormComponents get instance => _singleton;
  final controller = Get.put(MiniController());
  // final fieldValueController = TextEditingController(
  //   text: MiniController.to.fieldValues['key'] ?? '',
  // );

  
  /// Helper function to create a text field with input filtering
    buildTextField(BuildContext context, String fieldName, RegExp allowedChars  ) {
    return CommonComponents.defaultTextField(
      context,
      hintText: fieldName,
      // controller: fieldValueController,
      inputFormatters: [FilteringTextInputFormatter.allow(allowedChars)],
      onChange: (inputValue) {
        MiniController.to.updateField(fieldName, inputValue);
      }
    );
  }
  /// Helper function to create a dropdown field
   buildDropdown(BuildContext context, String fieldName, List<dynamic> items) {
    return CommonComponents.defaultDropdownSearch(
      context,
      title: fieldName,
  showTitle: false,
      showBottomSheet: Get.width >= 500 ? false : true,
      items: items,
      onChanged: (value) {
        MiniController.to.updateField(fieldName, value);
      },
      compareFn: (i, dynamic s) => i == s,
      itemAsString: (dynamic u) => u[1].toString(),
    );
  }
  /// Helper function to create a date-time picker field
   buildDateTimePicker(BuildContext context, String fieldName,) {
    return CommonComponents.defaultTextField(
      context,
      hintText: fieldName,
      readOnly: true,
      controller: TextEditingController(),
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime(1900),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(pickedDate),
          );
          if (pickedTime != null) {
            DateTime finalDateTime = DateTime(
                pickedDate.year, pickedDate.month, pickedDate.day);
            debugPrint("Selected Date & Time: $finalDateTime");
          }
        }
          MiniController.to.updateField(fieldName, pickedDate.toString());
      },
    );
  }
  /// Helper function to create a date picker field
   buildDatePicker(BuildContext context, String fieldName) {
    return CommonComponents.defaultTextField(
      context,
      hintText: fieldName,
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(1900),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );
        if (picked != null) {
          debugPrint("Selected Date: ${picked.day}-${picked.month}-${picked.year}");
        }
        MiniController.to.updateField(fieldName, picked.toString());
      },
    );
  }
  /// Helper function to create a time picker field
   buildTimePicker(BuildContext context, String fieldName,) {
    return CommonComponents.defaultTextField(
      context,
      hintText: fieldName,
      readOnly: true,
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          debugPrint("Selected Time: ${picked.hour}:${picked.minute}");
        } 
        MiniController.to.updateField(fieldName, picked.toString());
      },
    );
  }
  /// Helper function to create an async dropdown field (ForeignKey & ManyToMany)
   buildAsyncDropdown(BuildContext context, String fieldName, Map<String, dynamic> field, {bool isMultiSelect = false}) {
    return isMultiSelect
        ? CommonComponents.defaultMultiSelectionDropdownSearch(
      context,
      hintText: fieldName,
      asyncItems: (String? filter) async => await fetchMasterList(fieldName: fieldName),
      onChanged: (value) {
        MiniController.to.updateField(fieldName, value);
      },
      selectedItem: [],
      compareFn: (i, dynamic s) => i?['id'] == s?['id'],
      itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
    )
        : CommonComponents.defaultDropdownSearch(
      context,
      hintText: fieldName,
      asyncItems: (String? filter) async => await fetchMasterList(fieldName: fieldName),
      onChanged: (value) {
        MiniController.to.updateField(fieldName, value);
      },
      compareFn: (i, dynamic s) => i?['id'] == s?['id'],
      itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
    );
  }
  /// Function to fetch master list data
  Future<List<dynamic>> fetchMasterList({required String fieldName}) async {
    await controller.fetchMasterList(
        'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/$fieldName/');
    return controller.masterList;
  }
}