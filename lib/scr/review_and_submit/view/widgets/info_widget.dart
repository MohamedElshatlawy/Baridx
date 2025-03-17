import 'package:flutter/material.dart';

import '../../../../core/common/app_colors/app_colors.dart';
import '../../../../core/common/app_font_style/app_font_style_global.dart';
import '../../../../core/components/app_text/app_text.dart';
import '../../../../core/components/app_text/models/app_text_model.dart';
import '../../../../core/util/localization/app_localizations.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String info;
  const InfoWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          model: AppTextModel(
            style: AppFontStyleGlobal(
              AppLocalizations.of(context)!.locale,
            ).overLine.copyWith(color: AppColors.primaryColor),
          ),
        ),
        AppText(
          text: info,
          model: AppTextModel(
            style: AppFontStyleGlobal(
              AppLocalizations.of(context)!.locale,
            ).overLine.copyWith(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
