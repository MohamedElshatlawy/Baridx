import '../../app_text/models/app_text_model.dart';
import 'package:flutter/material.dart';

class AppRadioListTileModel {
  final String title;
  final AppTextModel? titleStyle;
  final TextStyle? labelStyle;
  final List<String> options;
  String? groupValue;
  final String? errorText;
  final String? helperText;
  final void Function(String?)? onChanged;
  AppRadioListTileModel({
    this.labelStyle,
    this.errorText,
    this.helperText,
    required this.title,
    this.titleStyle,
    required this.options,
    required this.groupValue,
    this.onChanged,
  });
}
