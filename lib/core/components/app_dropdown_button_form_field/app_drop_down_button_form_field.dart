import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors/app_colors.dart';
import '../../common/app_font_style/app_font_style_global.dart';
import '../../util/localization/app_localizations.dart';
import 'model/app_drop_down_button_form_field_mode.dart';

class AppDropdownButtonFormField extends StatefulWidget {
  final AppDropdownButtonFormFieldModel model;
  const AppDropdownButtonFormField({super.key, required this.model});

  @override
  State<AppDropdownButtonFormField> createState() =>
      _AppDropdownButtonFormFieldState();
}

class _AppDropdownButtonFormFieldState
    extends State<AppDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      key: UniqueKey(),
      validator: widget.model.validator,
      dropdownColor: AppColors.white,
      style: AppFontStyleGlobal(
        AppLocalizations.of(context)!.locale,
      ).bodyRegular1.copyWith(color: AppColors.primaryColor, height: 1),

      icon: widget.model.icon ?? const Icon(Icons.expand_more),

      decoration: widget.model.decoration.copyWith(
        hintStyle: AppFontStyleGlobal(AppLocalizations.of(context)!.locale)
            .smallTab
            .copyWith(color: AppColors.labelColor, height: 1, fontSize: 14.sp),

        labelStyle: AppFontStyleGlobal(
          AppLocalizations.of(context)!.locale,
        ).smallTab.copyWith(fontSize: 12.sp, color: AppColors.primaryColor),

        suffixIcon:
            widget.model.showClearIcon == true
                ? widget.model.value != null
                    ? InkWell(
                      child: Icon(
                        Icons.clear,
                        color:
                            widget.model.iconEnabledColor ??
                            AppColors.hintColor,
                        size: 20,
                      ),
                      onTap: () {
                        setState(() {
                          widget.model.value = null;
                        });
                        if (widget.model.onChangeInput != null) {
                          widget.model.onChangeInput!(null);
                        }
                      },
                    )
                    : null
                : null,
      ),
      value: widget.model.value,
      items: widget.model.items,
      onChanged: widget.model.onChangeInput,
      menuMaxHeight: 300,
      padding: EdgeInsets.zero,
    );
  }
}
