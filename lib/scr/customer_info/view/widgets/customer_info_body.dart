import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors/app_colors.dart';
import '../../../../core/common/app_component_style/component_style.dart';
import '../../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../../core/components/text_form_field/app_text_field.dart';
import '../../../../core/components/text_form_field/models/app_text_field_model.dart';
import '../../../../core/util/localization/app_localizations.dart';
import '../../../../core/util/validation.dart';
import '../customer_info_view_model.dart';

class CustomerInfoBody extends StatelessWidget {
  final CustomerInfoViewModel viewModel;
  const CustomerInfoBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.customerInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            model: AppTextFieldModel(
              validator:
                  (value) => Validation.requiredFieldValidation(value, context),
              controller: viewModel.name,
              keyboardType: TextInputType.name,
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
                labelText: AppLocalizations.of(context)!.translate('name'),
                hintText: AppLocalizations.of(context)!.translate('name'),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          AppTextField(
            model: AppTextFieldModel(
              validator: (value) => Validation.phoneValidation(value, context),
              controller: viewModel.phoneNumber,
              keyboardType: TextInputType.number,
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(15),
              ],
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
                labelText: AppLocalizations.of(
                  context,
                )!.translate('phone_number'),
                hintText: AppLocalizations.of(
                  context,
                )!.translate('phone_number'),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          AppTextField(
            model: AppTextFieldModel(
              validator:
                  (value) => Validation.requiredFieldValidation(value, context),
              controller: viewModel.address,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
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
                labelText: AppLocalizations.of(context)!.translate('address'),
                hintText: AppLocalizations.of(context)!.translate('address'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
