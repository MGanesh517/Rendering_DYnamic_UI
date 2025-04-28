
import 'package:baseproject_rendering/Common/Common%20Components/common_button.dart';
import 'package:baseproject_rendering/Screens/Login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogWidthF {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
}

enum DialogHeightF {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
  fitContent,
}

class LogoutDialog extends StatelessWidget {
  final DialogWidthF dialogWidth;
  final double? customWidth;
  final double? maxWidthPercentage;
  final double? minWidth;

  final DialogHeightF dialogHeight;
  final double? customHeight;
  final double? maxHeightPercentage;
  final double? minHeight;

  LogoutDialog({
    super.key,
    required this.dialogWidth,
    this.customWidth,
    this.maxWidthPercentage,
    this.minWidth,
    required this.dialogHeight,
    this.customHeight,
    this.maxHeightPercentage,
    this.minHeight,
  });
  
  final loginController = Get.put(LoginController());

  double getDialogWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = _calculateTargetWidth(screenWidth);
    double maxWidth = screenWidth * (maxWidthPercentage ?? 0.9);
    double constrainedWidth = targetWidth.clamp(
      minWidth ?? _getDefaultMinWidth(screenWidth), 
      maxWidth
    );
    return constrainedWidth;
  }

  double _calculateTargetWidth(double screenWidth) {
    switch (dialogWidth) {
      case DialogWidthF.extraSmall:
        return screenWidth * 0.4;
      case DialogWidthF.small:
        return screenWidth * 0.5;
      case DialogWidthF.medium:
        return screenWidth * 0.6;
      case DialogWidthF.large:
        return screenWidth * 0.75;
      case DialogWidthF.extraLarge:
        return screenWidth * 0.9;
      case DialogWidthF.custom:
        return customWidth ?? (screenWidth * 0.6);
    }
  }

  double _getDefaultMinWidth(double screenWidth) {
    return screenWidth * 0.3;
  }

  double? getDialogHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (dialogHeight == DialogHeightF.fitContent) {
      return null;
    }
    double targetHeight = _calculateTargetHeight(screenHeight);
    double maxHeight = screenHeight * (maxHeightPercentage ?? 0.9);
    double constrainedHeight = targetHeight.clamp(
      minHeight ?? _getDefaultMinHeight(screenHeight),
      maxHeight
    );
    return constrainedHeight;
  }

  double _calculateTargetHeight(double screenHeight) {
    switch (dialogHeight) {
      case DialogHeightF.extraSmall:
        return screenHeight * 0.25;
      case DialogHeightF.small:
        return screenHeight * 0.35;
      case DialogHeightF.medium:
        return screenHeight * 0.5;
      case DialogHeightF.large:
        return screenHeight * 0.65;
      case DialogHeightF.extraLarge:
        return screenHeight * 0.85;
      case DialogHeightF.custom:
        return customHeight ?? (screenHeight * 0.5);
      case DialogHeightF.fitContent:
        return 0;
    }
  }

  double _getDefaultMinHeight(double screenHeight) {
    return screenHeight * 0.2;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: getDialogWidth(context),
          maxWidth: getDialogWidth(context),
          minHeight: getDialogHeight(context) ?? 0,
          maxHeight: getDialogHeight(context) ?? double.infinity,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the info message
                children: [
                  Icon(Icons.info_outline, color: Colors.orange[200]),
                  SizedBox(width: 5.0),
                  Flexible(  // Added Flexible to prevent text overflow
                    child: Text(
                      "Are You Sure Want To Logout ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Replace the Row with a better layout for buttons
              Wrap(  // Using Wrap instead of Row for better responsive behavior
                spacing: 10, // Spacing between buttons
                alignment: WrapAlignment.spaceBetween,
                children: [
                  CommonButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Cancel',
                  ),
                  CommonButton(
                    onPressed: () {
                      Future.delayed(Duration.zero, () {
                        loginController.logout().then((val) {
                          // dashBoardController.changeTabIndex(0);
                        });
                      });
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => LogoutDialog(
        dialogWidth: MediaQuery.of(context).size.width <= 600 
          ? DialogWidthF.large 
          : DialogWidthF.extraSmall,
        dialogHeight: DialogHeightF.fitContent,
      ),
      barrierDismissible: true,
    );
  }
}








class CustomLogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomLogoutDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline, color: Colors.amber, size: 40),
            const SizedBox(height: 10),
            const Text(
              "Are you sure you want to logout?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel Button
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: MaterialButton(
                    elevation: 2,
                    onPressed: onCancel,
                    height: 50,
                    minWidth: 100,
                    color: Theme.of(context).colorScheme.secondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: MaterialButton(
                    elevation: 2,
                    onPressed: onConfirm,
                    height: 50,
                    minWidth: 100,
                    color: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}