import '../../app_text/models/app_text_model.dart';

class CustomAppBarModel {
  final String? title;
  final AppTextModel? titleStyle;
  final bool? showActions;
  final bool? showBackButton;
  final bool? showUserIcon;
  final bool? showCloseIcon;
  final void Function()? backOnTap;
  CustomAppBarModel({
     this.title,
    this.titleStyle,
    this.showActions = false,
    this.showBackButton = false,
    this.showUserIcon = false,
    this.showCloseIcon = false,
    this.backOnTap,
  });
}
