import 'package:flutter/material.dart';

class AppDropdownButtonFormFieldModel {
  final String? hint;
  dynamic value;
  String? Function(dynamic)? validator;
  final InputDecoration decoration;
  final List<DropdownMenuItem<dynamic>> items;
  final BorderRadiusGeometry? borderRadius;
  final void Function(dynamic)? onChangeInput;
  final String? errorText;
  final String? helperText;
  final Widget? icon;
  final bool? removeIconVisible;
  final dynamic Function()?  removeIconPressed;
  Color? iconEnabledColor;
  bool? showClearIcon;
  AppDropdownButtonFormFieldModel({
    this.hint,
    this.onChangeInput,
    required this.value,
    required this.items,
    required this.decoration,
    this.borderRadius,
    this.errorText,
    this.helperText,
    this.icon,
    this.removeIconVisible,
    this.removeIconPressed,
    this.validator,
    this.iconEnabledColor,
    this.showClearIcon = false,
  });
}
