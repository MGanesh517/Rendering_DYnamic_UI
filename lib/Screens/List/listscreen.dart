import 'package:baseproject_rendering/Screens/List/Controllers/common_controllers.dart';
import 'package:baseproject_rendering/Screens/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormsListView extends StatefulWidget {
   FormsListView({super.key});

  @override
  State<FormsListView> createState() => _FormsListViewState();
}

class _FormsListViewState extends State<FormsListView> {
  final controller = Get.put(MiniController());
  // final controller = Get.find<MiniController>();


  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: GetBuilder<MiniController>(
        initState: (_) => MiniController.to.initFormState(),
        builder: (value) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Expanded(
              //   child: Obx(()=>
              //   controller.commonFormData.results!=null?ListView.builder(
              //     itemCount: controller.commonFormData.results!.length,
              //     itemBuilder: (buildcontex,index){
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ListTile(
              //           onTap: ()async{
              //             await controller.getFormDetails(controller.commonFormData.results![index].id);
              //           },
              //           shape: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15),
              //               borderSide: BorderSide(color: Get.theme.colorScheme.primary.withOpacity( 0.1)),
              //               gapPadding: 10
              //           ),
              //           style: ListTileStyle.drawer,
              //           title: Text("${controller.commonFormData.results![index].modelName}"),
              //           subtitle: Text("${controller.commonFormData.results![index].appLabel}"),
              //         ),
              //       );
              //     },
              //   ):const Center(child: Text("No Records Found"),)
              //   ),
              // ),
              Expanded(child: Obx(
                      () => controller.commonFormData.results != null &&  controller.commonFormData.results!.isNotEmpty
                          ? GridView.builder(
                              itemCount: controller.commonFormData.results!.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: MediaQuery.of(context).size.width <= 800
                                    ? 1
                                    : MediaQuery.of(context).size.width <= 1300
                                        ? 2
                                        : MediaQuery.of(context).size.width <= 1700
                                            ? 3
                                            : 4,
                                childAspectRatio: 1,
                                crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
                                mainAxisExtent: 100,
                              ),
                              itemBuilder: (context, index) {
                                return CardWidget(
                                  key: ValueKey(controller.commonFormData.results![index].id),
                                  modelName: controller.commonFormData.results![index].modelName ?? "N/A",
                                  appLabel: controller.commonFormData.results![index].appLabel ?? 'N/A',
                                  onTap: () async {
                                    await controller.getFormDetails(controller.commonFormData.results![index].id);
                                  },
                                );
                              },
                            )
                          : const Center(child: Text("Data not found")),
                    ),)
            ],
          ),
        ),
      ),
    );
  }
}



class CardWidget extends StatelessWidget {
  final String appLabel;
  final String modelName;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    required this.appLabel,
    required this.modelName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "AppLabel : ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Text(appLabel, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "ModelName : ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Text(modelName, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
