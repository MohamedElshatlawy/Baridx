import 'package:flutter/material.dart';

class AppDropdownButtonModel {
  List<DropdownMenuItem<dynamic>> items;
  dynamic dropDownValue;
  String hint;
  void Function(dynamic)? onChanged;
  Color? borderColor;
  Color? hintColor;
  Color? textColor;
  Color? dropdownColor;
  Color? iconEnabledColor;
  Color? iconDisabledColor;
  bool? showClearIcon;
  AppDropdownButtonModel({
    required this.items,
    this.dropDownValue,
    required this.hint,
    this.onChanged,
    this.borderColor,
    this.hintColor,
    this.dropdownColor,
    this.textColor,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.showClearIcon = false,
  });
}
