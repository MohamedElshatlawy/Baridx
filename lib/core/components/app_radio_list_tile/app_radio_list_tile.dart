import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_colors/app_colors.dart';
import '../../common/app_font_style/app_font_style_global.dart';
import '../../util/localization/app_localizations.dart';
import '../app_text/app_text.dart';
import '../app_text/models/app_text_model.dart';
import 'model/app_radio_list_tile_model.dart';

class AppRadioListTile extends StatefulWidget {
  final AppRadioListTileModel model;

  const AppRadioListTile({super.key, required this.model});

  @override
  State<AppRadioListTile> createState() => _AppRadioListTileState();
}

class _AppRadioListTileState extends State<AppRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.model.title,
          model:
              widget.model.titleStyle ??
              AppTextModel(
                style:
                    widget.model.labelStyle ??
                    AppFontStyleGlobal(
                      AppLocalizations.of(context)!.locale,
                    ).label.copyWith(
                      // fontSize: 16.sp,
                      color: AppColors.black,
                      // height: 0,
                    ),
              ),
        ),
        SizedBox(height: 8.h),
        ...widget.model.options.map((e) {
          return Theme(
            data: Theme.of(
              context,
            ).copyWith(listTileTheme: ListTileThemeData(horizontalTitleGap: 5)),
            child: RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (!states.contains(MaterialState.selected)) {
                  return AppColors.hint;
                }
                return null;
              }),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              title: AppText(
                text: e,
                model:
                    widget.model.titleStyle ??
                    AppTextModel(
                      textAlign:
                          AppLocalizations.of(context)!.locale.languageCode ==
                                  'en'
                              ? TextAlign.left
                              : TextAlign.right,
                      style: AppFontStyleGlobal(
                        AppLocalizations.of(context)!.locale,
                      ).bodyMedium1.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.hint,
                      ),
                    ),
              ),
              value: e,
              activeColor: AppColors.primaryColor,
              groupValue: widget.model.groupValue,
              onChanged:
                  widget.model.onChanged ??
                  (value) {
                    setState(() {
                      widget.model.groupValue = value!;
                    });
                  },
            ),
          );
        }).toList(),
        if (widget.model.errorText != null) ...[
          if (widget.model.errorText!.isNotEmpty) ...[
            AppText(
              text: widget.model.errorText.toString(),
              model: AppTextModel(
                style: AppFontStyleGlobal(
                  AppLocalizations.of(context)!.locale,
                ).smallTab.copyWith(color: AppColors.error, fontSize: 10.sp),
              ),
            ),
          ],
        ],
        if (widget.model.helperText != null) ...[
          if (widget.model.helperText!.isNotEmpty &&
              widget.model.errorText == null) ...[
            Padding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w),
              child: AppText(
                text: widget.model.helperText.toString(),
                model: AppTextModel(
                  style: AppFontStyleGlobal(
                    AppLocalizations.of(context)!.locale,
                  ).overLine.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtGreyColor,
                  ),
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}
