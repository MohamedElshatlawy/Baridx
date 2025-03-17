import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../review_and_submit/data/models/review_model.dart';
import '../domain/usecases/customer_info_usecase.dart';

class CustomerInfoViewModel {
  final CustomerInfoUseCase useCase;

  CustomerInfoViewModel({required this.useCase});

  final customerInfoFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  moveToPackageDetailsScreen(BuildContext context) {
    if (customerInfoFormKey.currentState!.validate()) {
      ReviewModel orderDetails = ReviewModel(
        customerName: name.text,
        customerPhoneNumber: phoneNumber.text,
        customerAddress: address.text,
      );
      final reviewJson = jsonEncode(orderDetails.toJson());
      GoRouter.of(
        context,
      ).push('/packageDetailsScreen?orderDetails=$reviewJson');
    }
  }
}
