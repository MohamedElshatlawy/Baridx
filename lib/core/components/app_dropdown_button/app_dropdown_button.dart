import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors/app_colors.dart';
import '../../common/app_font_style/app_font_style_global.dart';
import '../../util/localization/app_localizations.dart';
import '../app_text/app_text.dart';
import '../app_text/models/app_text_model.dart';
import 'model/app_dropdown_button_model.dart';

class AppDropdownButton extends StatefulWidget {
  final AppDropdownButtonModel model;

  const AppDropdownButton({super.key, required this.model});

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 8.w),
      decoration: BoxDecoration(
        color: widget.model.dropdownColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: widget.model.borderColor ?? AppColors.labelColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                padding: EdgeInsets.zero,
                hint: AppText(
                  text: widget.model.dropDownValue ?? widget.model.hint,
                  model: AppTextModel(
                    style:
                        AppFontStyleGlobal(AppLocalizations.of(context)!.locale)
                            .smallTab
                            .copyWith(
                              fontSize: widget.model.dropDownValue == null
                                  ? 12.sp
                                  : 16.sp,
                              color: widget.model.dropDownValue == null
                                  ? widget.model.hintColor ??
                                      AppColors.hintColor
                                  : widget.model.textColor ??
                                      AppColors.primaryColor,
                            ),
                  ),
                ),
                isExpanded: true,
                iconEnabledColor: widget.model.iconEnabledColor,
                iconDisabledColor: widget.model.iconDisabledColor,
                iconSize: 30.0,
                style: AppFontStyleGlobal(AppLocalizations.of(context)!.locale)
                    .headingMedium5
                    .copyWith(
                      color: widget.model.textColor ?? AppColors.primaryColor,
                      fontSize: 15.sp,
                    ),
                items: widget.model.items,
                onChanged: (val) {
                  setState(() {
                    widget.model.dropDownValue = val;
                  });
                  if (widget.model.onChanged != null) {
                    widget.model.onChanged!(val);
                  }
                },
                underline: const SizedBox.shrink(),
                value: widget.model.dropDownValue,
              ),
            ),
          ),
          if (widget.model.showClearIcon == true) ...[
            if (widget.model.dropDownValue != null) ...[
              IconButton(
                icon: Icon(Icons.clear,
                    color:
                        widget.model.iconEnabledColor ?? AppColors.hintColor),
                onPressed: () {
                  setState(() {
                    widget.model.dropDownValue = null;
                  });
                  if (widget.model.onChanged != null) {
                    widget.model.onChanged!(null);
                  }
                },
                iconSize: 20.0,
                splashRadius: 20.0,
              ),
            ],
          ],
        ],
      ),
    );
  }
}
