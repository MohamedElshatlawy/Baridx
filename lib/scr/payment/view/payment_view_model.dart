import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/blocs/generic_cubit/generic_cubit.dart';
import '../../review_and_submit/data/models/review_model.dart';
import '../domain/usecases/payment_usecase.dart';

class PaymentViewModel {
  final PaymentUseCase useCase;

  PaymentViewModel({required this.useCase});

  final paymentFormKey = GlobalKey<FormState>();
  GenericCubit<String> selectedPaymentMethod = GenericCubit("");
  GenericCubit<String> selectedPaymentMethodValidation = GenericCubit('');
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController cardNumber = TextEditingController();

  bool checkPaymentMethodValidation() {
    selectedPaymentMethodValidation.onLoadingState();
    if (selectedPaymentMethod.state.data.isEmpty) {
      selectedPaymentMethodValidation.onUpdateData(
        "enter_select_payment_method",
      );
      return false;
    } else {
      selectedPaymentMethodValidation.onUpdateData("");
      return true;
    }
  }

  moveToReviewAndSubmitScreen(
    BuildContext context, {
    required ReviewModel orderDetails,
  }) {
    if (paymentFormKey.currentState!.validate()) {
      final bool result = checkPaymentMethodValidation();
      if (result) {
        orderDetails = orderDetails.copyWith(
          paymentMethod: selectedPaymentMethod.state.data,
          cardNumber: cardNumber.text,
          payLaterPhoneNumber: phoneNumber.text,
        );
        final reviewJson = jsonEncode(orderDetails.toJson());
        GoRouter.of(
          context,
        ).push('/reviewAndSubmitScreen?orderDetails=$reviewJson');
      }
    }
  }
}
