import 'package:baseproject_rendering/BreakPoints/breakpoints.dart';
import 'package:baseproject_rendering/Common/Common%20Components/form_components.dart';
import 'package:baseproject_rendering/Screens/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

import 'Controllers/common_controllers.dart';

class FormDetailsView extends StatefulWidget {
  const FormDetailsView({super.key, required this.title});

  final String title;

  @override
  State<FormDetailsView> createState() => _FormDetailsViewState();
}

class _FormDetailsViewState extends State<FormDetailsView> {
  dbConnect() async {
    // try{
    //
    //   await db.open();
    //   print('Connected to MongoDB');
    //
    //   // Create a new collection
    //   await createCollection(db);
    //
    //   await db.close();
    //   print('Connection closed');
    //  }catch(error){
    //   print("Print Db Connect Error:$error");
    // }
  }

  final controller = Get.put(MiniController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dbConnect();
    super.initState();
  }

  void onSubmit() {
    var formData = MiniController.to.getFormValues();
    print("Final Form Data: $formData");
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
            } catch (error) {
              debugPrint("Print Db Connect Error:$error");
            }
            if(formKey.currentState!.validate()){
              onSubmit();
              debugPrint("Print From Data ::::  ${MiniController.to.fieldValues}");
            }
          },
          child: const Icon(Icons.send),
        ),
          body: GetBuilder<MiniController>(
            initState: (_) => MiniController.to.initFormState(),
            builder: (value) => Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.fieldValues.clear();
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back,
                                  color: Theme.of(context).colorScheme.primary)),
                          Text("Detail View",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Obx(() {
                      var fields = controller.commonFormDetails.fields?.entries ?? [];

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ResponsiveRow(
                          runSpacing: 10, spacing: 20,
                          columns: fields.map<ResponsiveColumn>((entry) {
                            // Determine which breakpoints to use based on field type
                            final breakpoints = entry.value['type'] == 'Children'
                                ? ResponsiveConstants().fullScreenBreakPoints
                                : ResponsiveConstants().textFormField;
                                
                            return ResponsiveColumn(
                              breakpoints,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                child: renderField(entry.key, entry.value, context),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    })
                  ),
                ],
              ),
            ),
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

      // case 'Children':
      //   if (field['fields'] != null && field['fields'] is Map) {
      //     // return ResponsiveRow(columns: [
      //     //   ResponsiveColumn(
      //     //     ResponsiveConstants().textFormField,
      //     //       // child: Text(
      //     //       //   fieldName,
      //     //       //   style: TextStyle(
      //     //       //     fontWeight: FontWeight.bold,
      //     //       //     fontSize: 16,
      //     //       //     color: Theme.of(context).colorScheme.primary,
      //     //       //   ),
      //     //       // ),

      //     //   // const SizedBox(height: 8),
      //     //   //  child: ...((field['fields'] as Map).entries.map<Widget>((entry) =>
      //     //   //     renderField(entry.key, entry.value as Map<String, dynamic>, context)
      //     //   //   ).toList())

      //     //   child: ...((field['fields'] as Map).entries.map<Widget>((entry) =>
      //     //       renderField(entry.key, entry.value as Map<String, dynamic>, context)
      //     //     ).toList())
      //     //     )
      //     // ]);
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           fieldName,
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //             color: Theme.of(context).colorScheme.primary,
      //           ),
      //         ),
      //         // const SizedBox(height: 8),
      //         ...((field['fields'] as Map).entries.map<Widget>((entry) =>
      //           renderField(entry.key, entry.value as Map<String, dynamic>, context)
      //         ).toList()),
      //         // const SizedBox(height: 8),
      //         // Divider(),
      //       ],
      //     );
      //   }
      //   return Container();

      case 'Children':
        if (field['fields'] != null && field['fields'] is Map) {
          // return Column( 
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       fieldName,
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16,
          //         color: Theme.of(context).colorScheme.primary,
          //       ),
          //     ),
          //     const SizedBox(height: 8),
          //     Container(
          //       padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.grey.shade300),
          //         borderRadius: BorderRadius.circular(8.0),
          //         color: Colors.grey.shade50,
          //       ),
          //       child: ResponsiveRow(
          //         runSpacing: 10,
          //         spacing: 20,
          //         columns: (field['fields'] as Map).entries.map<ResponsiveColumn>((entry) {
          //           return ResponsiveColumn(
          //             ResponsiveConstants().textFormField,
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          //               child: renderField(entry.key, entry.value as Map<String, dynamic>, context),
          //             ),
          //           );
          //         }).toList(),
          //       ),
          //     ),
          //     const SizedBox(height: 16),
          //   ],
          // );
          return  ResponsiveRow(
                  columns: (field['fields'] as Map).entries.map<ResponsiveColumn>((entry) {
                    return ResponsiveColumn(
                      ResponsiveConstants().textFormField,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        child: renderField(entry.key, entry.value as Map<String, dynamic>, context),
                      ),
                    );
                  }).toList(),
                );
        }
        return Container();
      default:
        return Container();
    }
  }


  // renderField(String fieldName, Map<String, dynamic> field, BuildContext context) {
    //   switch (field['type']) {
    //     case 'Char':
    //       return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9.]'));
    //     case 'Text':
    //       return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9./-]'));
    //     case 'Integer':
    //       return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9]'));
    //     case 'Decimal':
    //       return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9,.]'));
    //     case 'Choice':
    //       return FormComponents.instance.buildDropdown(context, fieldName, field['choices']);
    //     case 'DateTime':
    //       return FormComponents.instance.buildDateTimePicker(context, fieldName);
    //     case 'Date':
    //       return FormComponents.instance.buildDatePicker(context, fieldName);
    //     case 'Time':
    //       return FormComponents.instance.buildTimePicker(context, fieldName);
    //     case 'ForeignKey':
    //     case 'ManyToMany':
    //       return FormComponents.instance.buildAsyncDropdown(context, fieldName, field, isMultiSelect: field['type'] == 'ManyToMany');
    //     case 'Children':
    //       return ;
    //     default:
    //       return Container();
    //   }
    // }

}