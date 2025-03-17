import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../scr/customer_info/view/customer_info_screen.dart';
import '../../scr/package_details/view/package_details_screen.dart';
import '../../scr/payment/view/payment_screen.dart';
import '../../scr/review_and_submit/data/models/review_model.dart';
import '../../scr/review_and_submit/view/review_and_submit_screen.dart';
import '../../scr/splash_screen/view/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/customerInfoScreen',
      builder: (context, state) => const CustomerInfoScreen(),
    ),
    GoRoute(
      path: '/packageDetailsScreen',
      builder: (context, state) {
        final orderDetailsString = state.uri.queryParameters['orderDetails'];
        final ReviewModel orderDetails =
            orderDetailsString != null
                ? ReviewModel.fromJson(jsonDecode(orderDetailsString))
                : ReviewModel();
        return PackageDetailsScreen(orderDetails: orderDetails);
      },
    ),
    GoRoute(
      path: '/paymentScreen',
      builder: (context, state) {
        final orderDetailsString = state.uri.queryParameters['orderDetails'];
        final ReviewModel orderDetails =
            orderDetailsString != null
                ? ReviewModel.fromJson(jsonDecode(orderDetailsString))
                : ReviewModel();
        return PaymentScreen(orderDetails: orderDetails);
      },
    ),
    GoRoute(
      path: '/reviewAndSubmitScreen',
      builder: (context, state) {
        final orderDetailsString = state.uri.queryParameters['orderDetails'];
        final ReviewModel orderDetails =
            orderDetailsString != null
                ? ReviewModel.fromJson(jsonDecode(orderDetailsString))
                : ReviewModel();
        return ReviewAndSubmitScreen(orderDetails: orderDetails);
      },
    ),
  ],
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
);
