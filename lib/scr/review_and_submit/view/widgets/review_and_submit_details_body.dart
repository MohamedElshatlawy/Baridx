import 'package:flutter/material.dart';
import '../../../../core/common/app_colors/app_colors.dart';
import '../../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../../core/components/app_text/app_text.dart';
import '../../../../core/components/app_text/models/app_text_model.dart';
import '../../../../core/util/localization/app_localizations.dart';
import '../../data/models/review_model.dart';
import '../review_and_submit_view_model.dart';
import 'info_widget.dart';

class ReviewAndSubmitDetailsBody extends StatelessWidget {
  final ReviewAndSubmitViewModel viewModel;
  final ReviewModel orderDetails;

  const ReviewAndSubmitDetailsBody({
    super.key,
    required this.viewModel,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: AppLocalizations.of(context)!.translate('customer_info'),
          model: AppTextModel(
            style: AppFontStyleGlobal(
              AppLocalizations.of(context)!.locale,
            ).label.copyWith(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoWidget(
              title: AppLocalizations.of(context)!.translate('name'),
              info: orderDetails.customerName ?? "",
            ),
            InfoWidget(
              title: AppLocalizations.of(context)!.translate('phone_number'),
              info: orderDetails.customerPhoneNumber ?? "",
            ),
          ],
        ),
        const SizedBox(height: 8),
        InfoWidget(
          title: AppLocalizations.of(context)!.translate('address'),
          info: orderDetails.customerAddress ?? "",
        ),
        const SizedBox(height: 15),
        AppText(
          text: AppLocalizations.of(context)!.translate('package_details'),
          model: AppTextModel(
            style: AppFontStyleGlobal(
              AppLocalizations.of(context)!.locale,
            ).label.copyWith(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoWidget(
              title: AppLocalizations.of(context)!.translate('package_type'),
              info: orderDetails.packageType ?? "",
            ),
            InfoWidget(
              title: AppLocalizations.of(context)!.translate('weight'),
              info: orderDetails.weight ?? "",
            ),
          ],
        ),
        const SizedBox(height: 8),
        InfoWidget(
          title: AppLocalizations.of(context)!.translate('delivery_note'),
          info: orderDetails.deliveryNote ?? "",
        ),
        const SizedBox(height: 15),

        AppText(
          text: AppLocalizations.of(context)!.translate('payment'),
          model: AppTextModel(
            style: AppFontStyleGlobal(
              AppLocalizations.of(context)!.locale,
            ).label.copyWith(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 10),

        InfoWidget(
          title: AppLocalizations.of(context)!.translate('payment_method'),
          info: orderDetails.paymentMethod ?? "",
        ),
      ],
    );
  }
}
