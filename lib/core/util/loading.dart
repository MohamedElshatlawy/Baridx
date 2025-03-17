import 'package:flutter/material.dart' hide FontWeight;
import 'package:loading_indicator/loading_indicator.dart';

import '../common/app_colors/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final Indicator indicator;

  const LoadingWidget({
    super.key,
    this.indicator = Indicator.ballScale,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: LoadingIndicator(
          indicatorType: indicator,
          colors: const [AppColors.primaryColor],
        ),
      ),
    );
  }
}

class LoadingScreen {
  LoadingScreen._();

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoadingWidget(
                indicator: Indicator.ballScale,
              )
            ],
          ),
        );
      },
    );
  }
}
