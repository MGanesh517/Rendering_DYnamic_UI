// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CommonComponents {
//   // static Column defaultTextField(context,
//   //     {TextEditingController? controller,
//   //       String? title,
//   //       String? hintText,
//   //       String? errorText,
//   //       bool? readOnly = false,
//   //       bool? enabled = true,
//   //       bool? showTitle = true,
//   //       bool? filled = false,
//   //       bool? obscureText = false,
//   //       Icon? prefixIcon,
//   //       Widget? suffixIcon,
//   //       Icon? suffix,
//   //       int? maxLength,
//   //       int? maxLines,
//   //       int? minLines,
//   //       List<TextInputFormatter>? inputFormatters,
//   //       TextInputAction? textInputAction,
//   //       TextInputType? keyboardType,
//   //       FocusNode? focusNode,
//   //       TextCapitalization? textCapitalization,
//   //       validator,
//   //       void Function(String?)? onSaved,
//   //       void Function()? onTap,
//   //       void Function()? onEditingComplete,
//   //       void Function(String)? onChange,
//   //       void Function(String)? onFieldSubmitted}) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Visibility(
//   //         visible: showTitle == true ? true : false,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Text(title!, style: Theme
//   //                 .of(context)
//   //                 .textTheme
//   //                 .labelMedium),
//   //             Container(height: 8),
//   //           ],
//   //         ),
//   //       ),
//   //       TextFormField(
//   //         scrollPadding: EdgeInsets.only(
//   //             bottom: MediaQuery
//   //                 .of(context)
//   //                 .viewInsets
//   //                 .bottom + 30),
//   //         autofocus: false,
//   //         maxLength: maxLength,
//   //         // key: ValueKey(title),
//   //         readOnly: readOnly!,
//   //         obscureText: obscureText!,
//   //         controller: controller,
//   //         textCapitalization: textCapitalization ?? TextCapitalization.none,
//   //         focusNode: focusNode,
//   //         textInputAction: textInputAction,
//   //         maxLines: obscureText ? 1 : maxLines,
//   //         minLines: minLines,
//   //         enabled: enabled,
//   //         keyboardType: keyboardType,
//   //         autovalidateMode: AutovalidateMode.onUserInteraction,
//   //         inputFormatters: inputFormatters,
//   //         cursorColor: Theme
//   //             .of(context)
//   //             .primaryColor,
//   //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),

//   //         // decoration: InputDecoration(
//   //         //     border: OutlineInputBorder(
//   //         //         borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//   //         //     counterText: '',
//   //         //     hintText: hintText,
//   //         //     // labelText: title,
//   //         //     floatingLabelAlignment: FloatingLabelAlignment.start,
//   //         //     floatingLabelBehavior: FloatingLabelBehavior.always,
//   //         //     errorText: errorText,
//   //         //     contentPadding: const EdgeInsets.all(10),
//   //         //     labelStyle: const TextStyle(fontSize: 16),
//   //         //
//   //         //     // label: title != null ? Text(title) : null,
//   //         //     filled: filled,
//   //         //     fillColor: enabled! ? Theme.of(context).colorScheme.primary : Colors.blueGrey[100],
//   //         //     prefixIcon: prefixIcon,
//   //         //     suffix: suffixIcon,
//   //         //     suffixIcon: suffix),
//   //         decoration: InputDecoration(
//   //           // border: OutlineInputBorder(
//   //           //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//   //             counterText: '',
//   //             hintText: hintText,
//   //             // labelText: title,
//   //             floatingLabelAlignment: FloatingLabelAlignment.start,
//   //             floatingLabelBehavior: FloatingLabelBehavior.always,
//   //             errorText: errorText,
//   //             hintStyle: TextStyle(color: Theme
//   //                 .of(context)
//   //                 .colorScheme
//   //                 .secondary
//   //                 .withOpacity(0.5), fontSize: 12),
//   //             // contentPadding: const EdgeInsets.all(10),
//   //             labelStyle: const TextStyle(fontSize: 16),
//   //             enabledBorder: UnderlineInputBorder(
//   //               borderSide:
//   //               BorderSide(color: Theme
//   //                   .of(context)
//   //                   .colorScheme
//   //                   .secondary),
//   //             ),
//   //             focusedBorder: UnderlineInputBorder(
//   //               borderSide:
//   //               BorderSide(color: Theme
//   //                   .of(context)
//   //                   .colorScheme
//   //                   .secondary),
//   //             ),
//   //             errorBorder: UnderlineInputBorder(
//   //               borderSide:
//   //               BorderSide(color: Theme
//   //                   .of(context)
//   //                   .colorScheme
//   //                   .secondary),
//   //             ),
//   //             focusedErrorBorder: UnderlineInputBorder(
//   //               borderSide:
//   //               BorderSide(color: Theme
//   //                   .of(context)
//   //                   .colorScheme
//   //                   .error),
//   //             ),
//   //             disabledBorder: UnderlineInputBorder(
//   //               borderSide:
//   //               BorderSide(color: Theme
//   //                   .of(context)
//   //                   .colorScheme
//   //                   .secondary),
//   //             ),
//   //             // label: title != null ? Text(title) : null,
//   //             filled: filled,
//   //             fillColor: enabled! ? Colors.grey[100] : Colors.blueGrey[100],
//   //             prefixIcon: prefixIcon,
//   //             suffix: suffixIcon,
//   //             suffixIcon: suffix),
//   //         onChanged: onChange,
//   //         onFieldSubmitted: onFieldSubmitted,
//   //         onSaved: onSaved,
//   //         onTap: onTap,
//   //         validator: validator,
//   //         onEditingComplete: onEditingComplete,
//   //       ),
//   //     ],
//   //   );
//   // }

//   static Column defaultTextField(
//     context, {
//     TextEditingController? controller,
//     bool? isMultiline = false,
//     String? title = '',
//     String? hintText,
//     String? errorText,
//     bool? readOnly = false,
//     bool? enable = true,
//     bool? filled = true,
//     Icon? prefixIcon,
//     Widget? suffixIcon,
//     int? maxLength,
//     int? maxLines,
//     bool? obscureText = false,
//     List<TextInputFormatter>? inputFormatters,
//     TextInputAction? textInputAction,
//     TextInputType? keyboardType,
//     FocusNode? focusNode,
//     TextCapitalization? textCapitalization,
//     InputDecoration? decoration,
//     bool? isRequired = false,
//     validator,
//     void Function(String?)? onSaved,
//     void Function()? onTap,
//     void Function()? onEditingComplete,
//     void Function(String)? onChange,
//     void Function(String)? onFieldSubmitted,
//     void Function(PointerDownEvent)? onTapOutside,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           autofocus: false,
//           maxLength: maxLength,
//           maxLines: obscureText! ? 1 : maxLines,
//           readOnly: readOnly!,
//           enabled: enable,
//           controller: controller,
//           textCapitalization: textCapitalization ?? TextCapitalization.none,
//           focusNode: focusNode,
//           textInputAction: textInputAction,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           inputFormatters: inputFormatters,
//           cursorColor: filled! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
//           style: TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w500,
//             color: filled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
//           ),
//           decoration: InputDecoration(
//             counterText: '',
//             hintText: hintText,
//             floatingLabelBehavior: FloatingLabelBehavior.always, // Floating inside only
//             labelText: isRequired! ? "* $title" : title, // Add * only if required
//             // labelStyle: TextStyle(color: isRequired ? Colors.red : null),
//             hintStyle: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: !filled ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.primaryFixed,
//             ),
//             prefixIcon: prefixIcon,
//             suffixIcon: Padding(
//               padding: const EdgeInsets.only(right: 16.0),
//               child: suffixIcon,
//             ),
//             filled: filled,
//             fillColor: filled ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryFixed),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             contentPadding: const EdgeInsets.all(10),
//             suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
//             prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
//           ),
//           onTapOutside: onTapOutside,
//           onChanged: onChange,
//           onFieldSubmitted: onFieldSubmitted,
//           onSaved: onSaved,
//           onTap: onTap,
//           validator: validator,
//           onEditingComplete: onEditingComplete,
//         ),
//       ],
//     );
//   }

// static Column defaultDropdownSearch<T>(context,
//       {Key? key,
//       //   TextEditingController? controller,
//       String? title,
//       String? hintText,
//       bool? enabled,
//       List<T>? items,
//       validator,
//       Future<List<T>> Function(String)? asyncItems,
//       compareFn,
//       itemAsString,
//       selectedItem,
//       onChanged,
//       itemBuilder,
//       bool? showTitle = true,
//       bool? showBottomSheet = true,
//       }) {
//     return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
//       // Visibility(
//       //   visible: showTitle == true ? true : false,
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       // Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 10)),
//       //       Text(title!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10)),
//       //       Container(height: 8),
//       //     ],
//       //   ),
//       // ),
//       DropdownSearch<T>(
//           autoValidateMode: AutovalidateMode.onUserInteraction,
//           asyncItems: asyncItems,
//           items: items ?? [],
//           key: ValueKey(title),
//           dropdownButtonProps: const DropdownButtonProps(
//             icon: Icon(Icons.keyboard_arrow_down),
//           ),
//           validator: validator,
//           compareFn: compareFn,
//           enabled: enabled ?? true,
//           dropdownDecoratorProps: DropDownDecoratorProps(
//             dropdownSearchDecoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Color(0xffE0E0E0)),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               labelText: title,
//               labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               hintText: "Select $title",
//               hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
//             ),
//           ),
//           popupProps: showBottomSheet == false
//               ? PopupProps.menu(
//                   fit: FlexFit.loose,
//                   constraints: BoxConstraints(maxHeight: 250),
//                   menuProps:  MenuProps(backgroundColor: Colors.white)
//                 )
//               : PopupPropsMultiSelection.modalBottomSheet(
//                   showSelectedItems: true,
//                   showSearchBox: true,
//                   itemBuilder: itemBuilder,
//                   fit: FlexFit.tight,
//                   searchFieldProps: const TextFieldProps(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       suffixIcon: Icon(Icons.search),
//                       hintText: 'Search Here',
//                     ),
//                   ),
//                   modalBottomSheetProps: ModalBottomSheetProps(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                       ),
//                     ),
//                   ),
//                 ),
//           itemAsString: itemAsString,
//           selectedItem: selectedItem,
//           onChanged: onChanged,
//         ),
//     ]);
//   }


//   static Column defaultMultiSelectionDropdownSearch<T>(context,
//       {Key? key,
//         //   TextEditingController? controller,
//         String? title,
//         String? hintText,
//         bool? enabled,
//         List<T>? items,
//         validator,
//         Future<List<T>> Function(String)? asyncItems,
//         compareFn,
//         itemAsString,
//         selectedItem,
//         onChanged,
//         itemBuilder,
//         bool? showTitle = true,
//         bool? underLineBorder = false}) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Visibility(
//             visible: showTitle == true ? true : false,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title!, style: Theme.of(context).textTheme.labelMedium),
//                 Container(height: 8),
//               ],
//             ),
//           ),
//           DropdownSearch<T>.multiSelection(
//               autoValidateMode: AutovalidateMode.onUserInteraction,
//               asyncItems: asyncItems ?? asyncItems,
//               items: items ?? [],
//               key: ValueKey(title),
//               dropdownButtonProps: const DropdownButtonProps(
//                   icon: Icon(Icons.keyboard_arrow_down)),
//               // clearButtonProps: const ClearButtonProps(isVisible: true),
//               validator: validator,
//               compareFn: compareFn,
//               enabled: enabled ?? true,
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   enabledBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   focusedBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   disabledBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   errorBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   focusedErrorBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   // border: OutlineInputBorder(
//                   //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//                   // labelText: title,
//                   filled: true,
//                   fillColor: enabled == true
//                       ? Colors.white.withOpacity(0.2)
//                       : Theme.of(context)
//                       .colorScheme
//                       .secondaryContainer
//                       .withOpacity(0.2),
//                   labelStyle:  TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   floatingLabelAlignment: FloatingLabelAlignment.start,
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   hintText: "Select $title",
//                   hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   counterStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   // filled: true,
//                   // fillColor: Colors.grey[100],
//                 ),
//               ),
//               popupProps: PopupPropsMultiSelection.modalBottomSheet(
//                   showSelectedItems: true,
//                   showSearchBox: true,
//                   itemBuilder: itemBuilder,
//                   fit: FlexFit.tight,
//                   searchFieldProps: TextFieldProps(
//                       decoration: InputDecoration(
//                         enabled: true,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color:
//                                 Theme.of(context).colorScheme.primaryContainer),
//                             borderRadius: BorderRadius.circular(15)),
//                         suffixIcon: const Icon(Icons.search),
//                         // labelText: 'Search Here',
//                         // labelStyle: const TextStyle(fontSize: 16),
//                         // floatingLabelAlignment: FloatingLabelAlignment.start,
//                         // floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: 'Search Here',
//                       )),
//                   modalBottomSheetProps: ModalBottomSheetProps(
//                       backgroundColor:
//                       Theme.of(context).colorScheme.secondaryContainer,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25),
//                           topRight: Radius.circular(25),
//                         ),
//                       )),
//                   title: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                       ),
//                       // boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 10.0)],
//                     ),
//                     child: Center(
//                       child: Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   )),
//               itemAsString: itemAsString,
//               selectedItems: selectedItem,
//               // selectedItem: selectedItem,
//               onChanged: onChanged)
//         ]);
//   }

//   static Column defaultRadioButton(context,
//   {TextEditingController? controller,
//   String? title,
//   String? label,
//     dynamic groupVal,
//     dynamic value,
//     choices,
//     onChanged,
//   }){
//     return Column(
//       children: [
//         Text(title!),
//         Row(
//           children: (choices as List).map<Widget>((item) =>
//               Row(
//                 children: [
//                   Radio(
//                     value: value,
//                     groupValue: groupVal,
//                     onChanged: onChanged,
//                   ),
//                   Text(item['label']),
//                 ],
//               )
//           ).toList(),
//         ),
//       ],
//     );
//   }
// }