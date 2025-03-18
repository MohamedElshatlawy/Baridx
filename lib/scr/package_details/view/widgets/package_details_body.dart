import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors/app_colors.dart';
import '../../../../core/common/app_component_style/component_style.dart';
import '../../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../../core/components/app_dropdown_button_form_field/app_drop_down_button_form_field.dart';
import '../../../../core/components/app_dropdown_button_form_field/model/app_drop_down_button_form_field_mode.dart';
import '../../../../core/components/app_text/app_text.dart';
import '../../../../core/components/app_text/models/app_text_model.dart';
import '../../../../core/components/text_form_field/app_text_field.dart';
import '../../../../core/components/text_form_field/models/app_text_field_model.dart';
import '../../../../core/util/localization/app_localizations.dart';
import '../../../../core/util/validation.dart';
import '../package_details_view_model.dart';

class PackageDetailsBody extends StatefulWidget {
  final PackageDetailsViewModel viewModel;
  const PackageDetailsBody({super.key, required this.viewModel});

  @override
  State<PackageDetailsBody> createState() => _PackageDetailsBodyState();
}

class _PackageDetailsBodyState extends State<PackageDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.viewModel.packageDetailsFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDropdownButtonFormField(
            model: AppDropdownButtonFormFieldModel(
              showClearIcon: true,
              validator:
                  (value) => Validation.requiredFieldValidation(value, context),
              onChangeInput: (val) {
                setState(() {
                  widget.viewModel.packageTypeValue = val ?? "";
                });
              },
              borderRadius: BorderRadius.circular(12.r),
              decoration: ComponentStyle.inputDecoration(
                AppLocalizations.of(context)!.locale,
              ).copyWith(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: AppLocalizations.of(
                  context,
                )!.translate('package_type'),
                hintText: AppLocalizations.of(
                  context,
                )!.translate('package_type'),
              ),
              value:
                  widget.viewModel.packageTypeValue.isEmpty
                      ? null
                      : widget.viewModel.packageTypeValue,
              items:
                  widget.viewModel.packageType.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: SizedBox(
                        child: AppText(
                          text: e,
                          model: AppTextModel(
                            textAlign:
                                AppLocalizations.of(
                                          context,
                                        )!.locale.languageCode ==
                                        'en'
                                    ? TextAlign.left
                                    : TextAlign.right,
                            style: AppFontStyleGlobal(
                              AppLocalizations.of(context)!.locale,
                            ).smallTab.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 15),
          AppTextField(
            model: AppTextFieldModel(
              validator:
                  (value) => Validation.requiredFieldValidation(value, context),
              controller: widget.viewModel.weight,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              borderRadius: BorderRadius.circular(12.r),
              decoration: ComponentStyle.inputDecoration(
                AppLocalizations.of(context)!.locale,
              ).copyWith(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintStyle: AppFontStyleGlobal(
                  AppLocalizations.of(context)!.locale,
                ).smallTab.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.labelColor,
                ),
                labelText: AppLocalizations.of(context)!.translate('weight'),
                hintText: AppLocalizations.of(context)!.translate('weight'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          AppTextField(
            model: AppTextFieldModel(
              controller: widget.viewModel.deliveryNote,
              minLines: 7,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              borderRadius: BorderRadius.circular(12.r),
              decoration: ComponentStyle.inputDecoration(
                AppLocalizations.of(context)!.locale,
              ).copyWith(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintStyle: AppFontStyleGlobal(
                  AppLocalizations.of(context)!.locale,
                ).smallTab.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.labelColor,
                ),
                hintText: AppLocalizations.of(
                  context,
                )!.translate('delivery_note'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
