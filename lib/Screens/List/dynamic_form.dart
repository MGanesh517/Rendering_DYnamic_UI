import 'package:baseproject_rendering/Common/Common%20Components/form_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Controllers/common_controllers.dart';

class DynamicForm extends StatefulWidget {
  const DynamicForm({super.key});

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.put(MiniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("widget.title"),
      ),
      body: GetBuilder<MiniController>(
        initState: (_) => MiniController.to.initFormState(),
        builder: (value) => SingleChildScrollView(
          child: Obx(
            () {
              List<dynamic> widgetList = controller.commonFormData.results != null
                  // ? controller.commonFormData.results!.first.fields.entries.map((entry) {
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //       child: renderField(entry.key, entry.value, context),
                  //     );
                  //   }).toList()
                  ?controller.commonFormData.results!.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: renderField(entry.appLabel!, entry.toJson(), context),
                );
              }).toList()
                  : [];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: widgetList.cast<Widget>(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget renderField(String fieldName, Map<String, dynamic> field, BuildContext context) {
    switch (field['type']) {
      case 'Char':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9.]'));
      case 'Text':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9./-]'));
      case 'Integer':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9]'));
      case 'Decimal':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9,.]'));
      case 'Choice':
        return FormComponents.instance.buildDropdown(context, fieldName, field['choices']);
      case 'DateTime':
        return FormComponents.instance.buildDateTimePicker(context, fieldName);
      case 'Date':
        return FormComponents.instance.buildDatePicker(context, fieldName);
      case 'Time':
        return FormComponents.instance.buildTimePicker(context, fieldName);
      case 'ForeignKey':
      case 'ManyToMany':
        return FormComponents.instance.buildAsyncDropdown(context, fieldName, field, isMultiSelect: field['type'] == 'ManyToMany');
      default:
        return Container();
    }
  }
}
