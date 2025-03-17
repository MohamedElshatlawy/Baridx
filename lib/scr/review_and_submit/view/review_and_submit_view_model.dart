import 'package:flutter/cupertino.dart';

import '../../../core/common/app_colors/app_colors.dart';
import '../../../core/components/app_snack_bar/app_snack_bar.dart';
import '../../../core/util/loading.dart';
import '../../../core/util/localization/app_localizations.dart';
import '../domain/usecases/review_and_submit_usecase.dart';

class ReviewAndSubmitViewModel {
  final ReviewAndSubmitUseCase useCase;

  ReviewAndSubmitViewModel({required this.useCase});
  submit(BuildContext context) {
    LoadingScreen.show(context);
    Future.delayed(const Duration(seconds: 3), () async {
      if (context.mounted) {
        Navigator.pop(context);
        showAppSnackBar(
          context: context,
          message: AppLocalizations.of(
            context,
          )!.translate('request_submitted_successfully'),
          color: AppColors.green,
        );
      }
    });
  }
}
