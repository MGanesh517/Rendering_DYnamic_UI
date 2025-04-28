
import 'package:baseproject_rendering/Screens/Login/login_controller.dart';
import 'package:baseproject_rendering/Screens/Login/logout.dart';
import 'package:baseproject_rendering/Screens/drawer_code.dart';
import 'package:baseproject_rendering/Screens/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//////************************************** CommonComponent for the EveryPage **************************************//////

class CommonScaffoldWithAppBar extends StatelessWidget {
  final Widget body;
  final Color? appBarBGColor, iconColor;
  final VoidCallback? leadingLink;
  final Widget? leadingChild;
  final String? titleChild;
  final List<Widget>? actionsWidget;
  final bool? centerTitle;
  final Widget? floatingActionButton;

  CommonScaffoldWithAppBar({
    super.key,
    required this.body,
    this.appBarBGColor,
    this.leadingLink,
    this.iconColor,
    this.leadingChild,
    this.titleChild,
    this.actionsWidget,
    this.centerTitle,
    this.floatingActionButton
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final loginController = Get.put(LoginController());

  
  void showTopDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.center, // 👈 Positioned at the top
          child: Material(
            color: Colors.transparent,
            child: CustomLogoutDialog(
                    onConfirm: () {
                      // Navigator.of(context).pop();
                      // loginController.logout();
                      Future.delayed(Duration.zero, () {
                      loginController.logout().then((val) {
                        // dashBoardController.changeTabIndex(0);
                      });
                    });
                    },
              onCancel: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // 👈 Slide down from top
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        if (MediaQuery.of(context).size.width < 700 &&
            !Get.find<DrawerControllerX>().isTextNotVisible) {
          Get.find<DrawerControllerX>().toggleShowText();
        }

        Widget drawer = AdaptiveDrawer(
          title: '',
          currentScreen: body,
          onScreenSelected: (screen) {
            if (!isLargeScreen) {
              Navigator.of(context).pop();
            }
          },
        );

        return Scaffold(
          floatingActionButton: floatingActionButton,
          backgroundColor: Colors.grey[50],
          key: scaffoldKey,
          appBar: AppBar(
            toolbarHeight: 64,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: leadingChild != null
                ? Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: leadingLink,
                      child: leadingChild,
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
                    onPressed: () {
                      if (!isLargeScreen) {
                        scaffoldKey.currentState?.openDrawer();
                      } else {
                        Get.find<DrawerControllerX>().toggleShowText();
                      }
                    },
                  ),
            // title: isLargeScreen ? buildWebNavigation() : null,
            actions: [
              // IconButton(onPressed: () {
              //       Get.dialog(LogoutDialog(dialogWidth: DialogWidthF.extraSmall ,
              //     dialogHeight: DialogHeightF.fitContent,),  barrierDismissible: false);
              //     }, icon: Icon(Icons.logout)),
              IconButton(onPressed: () => showTopDialog(context), icon: Icon(Icons.logout)),
              SizedBox(width: isLargeScreen ? 30 : 10),
            ],
            centerTitle: centerTitle,
          ),
          drawer: !isLargeScreen ? drawer : null,
          body: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLargeScreen)
                  Obx(() => SizedBox(
                        width: Get.find<DrawerControllerX>().isTextNotVisible
                            ? 250
                            : 070,
                        child: drawer,
                      )),
                      VerticalDivider(thickness: 0.5,width: 0.5,),
                Expanded(child: body),
              ],
            ),
          ),
          // bottomNavigationBar: !isLargeScreen ? buildMobileNavigation() : null,
        );
      },
    );
  }
}

class AdaptiveDrawer extends StatefulWidget {
  final String title;
  final Widget currentScreen;
  final Function(Widget) onScreenSelected;

  const AdaptiveDrawer({
    super.key,
    required this.title,
    required this.currentScreen,
    required this.onScreenSelected,
  });

  @override
  _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
}

class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
  final drawerController = Get.find<DrawerControllerX>();

  // void onItemTapped(int index, String route) {
  //   setState(() {
  //     drawerController.selectedIndex = index;
  //   });
  //   Get.offAllNamed(route);
  // }

  void onItemTapped(int index, String route) {
    drawerController.selectedIndex = index;
    Get.toNamed(route);
  }

//////************************************** Drawer & it's SubItems **************************************//////


  @override
  Widget build(BuildContext context) {
    final drawerController = Get.find<DrawerControllerX>();

    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MediaQuery.of(context).size.width <= 700
              ? Container(height: 70)
              : Container(height: 0),
              
          Obx(() => CommonCardForDrawer(
                title: drawerController.isTextNotVisible
                    ? const Text('List Screen')
                    : const SizedBox.shrink(),
                icon: const Icon(Icons.list_alt_outlined),
                isSelected: drawerController.selectedIndex == 0,
                onTapNavigation: () => onItemTapped(0, '/formListView'),
              )),

          // Obx(() => CommonCardForDrawer(
          //       title: drawerController.isTextNotVisible
          //           ? const Text('Advance Filters')
          //           : const SizedBox.shrink(),
          //       icon: const Icon(Icons.sort_by_alpha_sharp),
          //       isSelected: drawerController.selectedIndex == 1,
          //       onTapNavigation: () => onItemTapped(1, '/advanceFilterScreen'),
          //     )),
        ],
      ),
    );
  }
}