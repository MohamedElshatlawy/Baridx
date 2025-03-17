import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/blocs/generic_cubit/generic_cubit.dart';
import '../../../../core/common/app_colors/app_colors.dart';
import '../../../../core/common/app_component_style/component_style.dart';
import '../../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../../core/components/app_radio_list_tile/app_radio_list_tile.dart';
import '../../../../core/components/app_radio_list_tile/model/app_radio_list_tile_model.dart';
import '../../../../core/components/text_form_field/app_text_field.dart';
import '../../../../core/components/text_form_field/models/app_text_field_model.dart';
import '../../../../core/util/localization/app_localizations.dart';
import '../../../../core/util/validation.dart';
import '../payment_view_model.dart';

class PaymentDetailsBody extends StatelessWidget {
  final PaymentViewModel viewModel;
  const PaymentDetailsBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<String>, GenericCubitState<String>>(
      bloc: viewModel.selectedPaymentMethod,
      builder: (context, paymentMethod) {
        return Form(
          key: viewModel.paymentFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GenericCubit<String>, GenericCubitState<String>>(
                bloc: viewModel.selectedPaymentMethodValidation,
                builder: (context, validation) {
                  return AppRadioListTile(
                    model: AppRadioListTileModel(
                      title: AppLocalizations.of(
                        context,
                      )!.translate('payment_method'),
                      options: [
                        AppLocalizations.of(context)!.translate('credit_card'),
                        AppLocalizations.of(
                          context,
                        )!.translate('cash_on_delivery'),
                        AppLocalizations.of(context)!.translate('pay_later'),
                      ],
                      onChanged: (value) {
                        viewModel.selectedPaymentMethod.onUpdateData(
                          value ?? "",
                        );
                      },
                      groupValue: viewModel.selectedPaymentMethod.state.data,
                      errorText:
                          validation.data.isNotEmpty
                              ? AppLocalizations.of(
                                context,
                              )!.translate(validation.data)
                              : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              if (paymentMethod.data ==
                  AppLocalizations.of(context)!.translate('credit_card')) ...[
                AppTextField(
                  model: AppTextFieldModel(
                    validator:
                        (value) =>
                            Validation.creditCardValidation(value, context),
                    controller: viewModel.cardNumber,
                    keyboardType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d\s-]')),
                      LengthLimitingTextInputFormatter(19),
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
                      )!.translate('card_number'),
                      hintText: AppLocalizations.of(
                        context,
                      )!.translate('card_number'),
                    ),
                  ),
                ),
              ] else if (paymentMethod.data ==
                  AppLocalizations.of(context)!.translate('pay_later')) ...[
                AppTextField(
                  model: AppTextFieldModel(
                    validator:
                        (value) => Validation.phoneValidation(value, context),
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
              ],
            ],
          ),
        );
      },
    );
  }
}
