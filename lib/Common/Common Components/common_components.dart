import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';




// Optional: Dropdown component that matches the style
class CommonDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  const CommonDropdown({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}



class CommonComponents {
  static Column defaultTextField(context,
      {TextEditingController? controller,
      String? title = '',
      String? labelTitle = '',
      String? hintText,
      String? errorText,
      String? initialValue,
      bool? readOnly = false,
      bool? enable = true,
      bool? filled = false,
      Widget? prefixIcon,
      Widget? suffixIcon,
      int? maxLength,
      // int? maxLines,
      // int? minLines,
      bool? obscureText = false,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      FocusNode? focusNode,
      TextCapitalization? textCapitalization,
      TextAlign? textAlign = TextAlign.left,
      InputDecoration? decoration,
      validator,
      void Function(String?)? onSaved,
      void Function()? onTap,
      void Function()? onEditingComplete,
      void Function(String)? onChange,
      void Function(String)? onFieldSubmitted}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Container(
                    height: 8,
                  ),
                ],
              )
            : Container(),
        TextFormField(
          autofocus: false,
          maxLength: maxLength,
          readOnly: readOnly!,
          enabled: enable,
          initialValue: initialValue,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          focusNode: focusNode,
          textInputAction: textInputAction,
          // maxLines: maxLines,
          // minLines: minLines,
          textAlign: textAlign!,
          obscureText: obscureText!,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          cursorColor: Theme.of(context).colorScheme.primary,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
                labelText: hintText, // Use the hint text as the label
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                  // color: Theme.of(context).colorScheme.primary,
                ),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto, // This makes the label float up when focused or filled
                counterText: '',
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
              ),
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onEditingComplete,
        ),
        if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            errorText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  static Column defaultTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      TextFormField(
        controller: controller,
        maxLength: maxLength,
        readOnly: readOnly,
        enabled: enable,
        initialValue: initialValue,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
          counterText: '',
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        validator: validator,
        onEditingComplete: onEditingComplete,
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            errorText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}

static Column defaultTextFieldFixedHeight(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      SizedBox(
      height: 42,
        child: TextFormField(
          controller: controller,
          maxLength: maxLength,
          readOnly: readOnly,
          enabled: enable,
          initialValue: initialValue,
          obscureText: obscureText,
          textCapitalization: textCapitalization,
          focusNode: focusNode,
          textInputAction: textInputAction,
          textAlign: textAlign,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            counterText: '',
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onEditingComplete,
        ),
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            errorText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}


  static CheckboxListTile defaultCheckBoxListTile(
    BuildContext context, {
    required bool value,
    String? title,
    required ValueChanged<bool?> onChanged,
    Color? activeColor,
    Color? checkColor,
    Color? titleColor,
    TextStyle? titleStyle,
    EdgeInsets? padding,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.leading,
  }) {
    return CheckboxListTile(
      value: value,
      title: Text(
        title!,
        style: titleStyle ??
            TextStyle(
              // color: titleColor ?? Theme.of(context).colorScheme.primary,
              color: titleColor ?? Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
      ),
      activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
      checkColor: checkColor ?? Colors.white,
      onChanged: onChanged,
      controlAffinity: controlAffinity,
      contentPadding: padding ?? EdgeInsets.zero, // Optional padding
    );
  }


  static AlertDialog showAlertDialog(
      BuildContext context, {
    required String title,
    required String message,
    required Widget icon,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 20),
            Text(message),
          ],
        ),
        actions: [
          if (onCancel != null)
            TextButton(
              onPressed: () {
                Get.back();
                onCancel();
              },
              child: Text('Cancel'),
            ),
          if (onConfirm != null)
            TextButton(
              onPressed: () {
                Get.back();
                onConfirm();
              },
              child: Text('Confirm'),
            ),
        ],
      ),
    );
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: 20),
          Text(message),
        ],
      ),
      actions: [
        if (onCancel != null)
          TextButton(
            onPressed: () {
              Get.back();
              onCancel();
            },
            child: Text('Cancel'),
          ),
        if (onConfirm != null)
          TextButton(
            onPressed: () {
              Get.back();
              onConfirm();
            },
            child: Text('Confirm'),
          ),
      ],
    );
  }

  static Column defaultDropdownSearch<T>(context,
      {Key? key,
      //   TextEditingController? controller,
      String? title,
      String? hintText,
      bool? enabled,
      List<T>? items,
      validator,
      Future<List<T>> Function(String)? asyncItems,
      compareFn,
      itemAsString,
      selectedItem,
      onChanged,
      itemBuilder,
      bool? showTitle = true,
      bool? showBottomSheet = true,
      }) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Visibility(
        visible: showTitle == true ? true : false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 10)),
            Text("$title", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10)),
            Container(height: 8),
          ],
        ),
      ),
      DropdownSearch<T>(
          autoValidateMode: AutovalidateMode.onUserInteraction,
          asyncItems: asyncItems,
          items: items ?? [],
          key: ValueKey(title),
          dropdownButtonProps: const DropdownButtonProps(
            icon: Icon(Icons.keyboard_arrow_down),
          ),
          validator: validator,
          compareFn: compareFn,
          enabled: enabled ?? true,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xffE0E0E0)),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: title,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              hintText: "Select $title",
              hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ),
          popupProps: showBottomSheet == false
              ? PopupProps.menu(
                  fit: FlexFit.loose,
                  constraints: BoxConstraints(maxHeight: 250),
                  menuProps:  MenuProps(backgroundColor: Colors.white)
                )
              : PopupPropsMultiSelection.modalBottomSheet(
                  showSelectedItems: true,
                  showSearchBox: true,
                  itemBuilder: itemBuilder,
                  fit: FlexFit.tight,
                  searchFieldProps: const TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search Here',
                    ),
                  ),
                  modalBottomSheetProps: ModalBottomSheetProps(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
          itemAsString: itemAsString,
          selectedItem: selectedItem,
          onChanged: onChanged,
        ),
    ]);
  }

  static Column defaultMultiSelectionDropdownSearch<T>(context,
      {Key? key,
        //   TextEditingController? controller,
        String? title,
        String? hintText,
        bool? enabled,
        List<T>? items,
        validator,
        Future<List<T>> Function(String)? asyncItems,
        compareFn,
        itemAsString,
        selectedItem,
        onChanged,
        itemBuilder,
        bool? showTitle = true,
        bool? underLineBorder = false}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: showTitle == true ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!, style: Theme.of(context).textTheme.labelMedium),
                Container(height: 8),
              ],
            ),
          ),
          DropdownSearch<T>.multiSelection(
              autoValidateMode: AutovalidateMode.onUserInteraction,
              asyncItems: asyncItems ?? asyncItems,
              items: items ?? [],
              key: ValueKey(title),
              dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(Icons.keyboard_arrow_down)),
              // clearButtonProps: const ClearButtonProps(isVisible: true),
              validator: validator,
              compareFn: compareFn,
              enabled: enabled ?? true,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  enabledBorder: underLineBorder == true
                      ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )
                      : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  focusedBorder: underLineBorder == true
                      ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )
                      : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  disabledBorder: underLineBorder == true
                      ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )
                      : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  errorBorder: underLineBorder == true
                      ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )
                      : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  focusedErrorBorder: underLineBorder == true
                      ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )
                      : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25)),
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
                  // labelText: title,
                  filled: true,
                  fillColor: enabled == true
                      ? Colors.white.withOpacity(0.2)
                      : Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.2),
                  labelStyle:  TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Select $title",
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                  counterStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                  // filled: true,
                  // fillColor: Colors.grey[100],
                ),
              ),
              popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  showSelectedItems: true,
                  showSearchBox: true,
                  itemBuilder: itemBuilder,
                  fit: FlexFit.tight,
                  searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Theme.of(context).colorScheme.primaryContainer),
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: const Icon(Icons.search),
                        // labelText: 'Search Here',
                        // labelStyle: const TextStyle(fontSize: 16),
                        // floatingLabelAlignment: FloatingLabelAlignment.start,
                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Search Here',
                      )),
                  modalBottomSheetProps: ModalBottomSheetProps(
                      backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      )),
                  title: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      // boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 10.0)],
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              itemAsString: itemAsString,
              selectedItems: selectedItem,
              // selectedItem: selectedItem,
              onChanged: onChanged)
        ]);
  }

  static Column defaultSmallDropdownSearch<T>(
    context, {
    Key? key,
    String? title,
    String? hintText,
    bool? enabled,
    List<T>? items,
    validator,
    Future<List<T>> Function(String)? asyncItems,
    compareFn,
    itemAsString,
    selectedItem,
    onChanged,
    itemBuilder,
    bool? showTitle = true,
    bool? showBottomSheet = true,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showTitle == true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10),
              ),
              // SizedBox(height: 4), // Reduced spacing
            ],
          ),
        ),
        SizedBox(
          width: 120, // Reduced width
          height: 40, // Reduced height
          child: DropdownSearch<T>(
            autoValidateMode: AutovalidateMode.onUserInteraction,
            asyncItems: asyncItems,
            items: items ?? [],
            key: ValueKey(title),
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(Icons.keyboard_arrow_down, size: 16), // Smaller icon
              padding: EdgeInsets.only(right: 8), // Add padding to the dropdown icon
            ),
            validator: validator,
            compareFn: compareFn,
            enabled: enabled ?? true,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              dropdownSearchDecoration: InputDecoration(
                // contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -5.0), // Adjusted padding
                contentPadding: EdgeInsets.only(right: 10.0, top: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Smaller border radius
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xffE0E0E0)),
                ),
                filled: true,
                fillColor: Colors.white,
                alignLabelWithHint: true, // Align label with hint
                labelText: title,
                floatingLabelAlignment: FloatingLabelAlignment.start, // Align floating label
                labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                hintText: "Select $title",
                hintStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey),
              ),
            ),
            popupProps: showBottomSheet == false
                ? PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200), // Reduced popup height
                    menuProps:  MenuProps(backgroundColor: Colors.white)
                  )
                : PopupPropsMultiSelection.modalBottomSheet(
                    showSelectedItems: true,
                    showSearchBox: true,
                    itemBuilder: itemBuilder,
                    fit: FlexFit.tight,
                    searchFieldProps: const TextFieldProps(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search),
                        hintText: 'Search Here',
                      ),
                    ),
                    modalBottomSheetProps: ModalBottomSheetProps(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
            itemAsString: itemAsString,
            selectedItem: selectedItem,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}