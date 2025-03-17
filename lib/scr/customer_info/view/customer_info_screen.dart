import 'package:barid/scr/customer_info/view/widgets/customer_info_body.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/app_component_style/component_style.dart';
import '../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../core/components/app_bar/app_bar.dart';
import '../../../core/components/app_bar/model/app_bar_model.dart';
import '../../../core/components/app_button/app_button.dart';
import '../../../core/components/app_button/models/app_button_model.dart';
import '../../../core/components/app_text/app_text.dart';
import '../../../core/components/app_text/models/app_text_model.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/localization/app_localizations.dart';
import 'customer_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/depindancy_injection.dart';
import '../../../core/common/app_colors/app_colors.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});
  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final viewModel = sl<CustomerInfoViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Constants.appBarSize,
        child: CustomAppBar(
          model: CustomAppBarModel(
            title: AppLocalizations.of(context)!.translate('customer_info'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
        child: CustomerInfoBody(viewModel: viewModel),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
        child: AppButton(
          model: AppButtonModel(
            child: AppText(
              text: AppLocalizations.of(context)!.translate('next'),
              model: AppTextModel(
                style: AppFontStyleGlobal(
                  AppLocalizations.of(context)!.locale,
                ).label.copyWith(color: AppColors.white),
              ),
            ),
            decoration: ComponentStyle.buttonDecoration.copyWith(
              color: AppColors.primaryColor,
            ),
            buttonStyle: ComponentStyle.buttonStyle,
          ),
          onPressed: ()=>viewModel.moveToPackageDetailsScreen(context),
        ),
      ),
    );
  }
}
