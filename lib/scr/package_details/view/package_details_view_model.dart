import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../review_and_submit/data/models/review_model.dart';
import '../domain/usecases/package_details_usecase.dart';

class PackageDetailsViewModel {
  final PackageDetailsUseCase useCase;

  PackageDetailsViewModel({required this.useCase});

  List<String> packageType = ["type1", "type2", "type3"];
  final packageDetailsFormKey = GlobalKey<FormState>();
  String packageTypeValue = "";
  TextEditingController deliveryNote = TextEditingController();
  TextEditingController weight = TextEditingController();

  moveToPaymentScreen(
    BuildContext context, {
    required ReviewModel orderDetails,
  }) {
    if (packageDetailsFormKey.currentState!.validate()) {
      orderDetails = orderDetails.copyWith(
        packageType: packageTypeValue,
        deliveryNote: deliveryNote.text,
        weight: weight.text,
      );
      final reviewJson = jsonEncode(orderDetails.toJson());
      GoRouter.of(context).push('/paymentScreen?orderDetails=$reviewJson');
    }
  }
}
