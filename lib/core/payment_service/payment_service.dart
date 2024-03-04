import 'package:dio/dio.dart';
import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/app_keys/app_keys.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  //1.
  Future<String> createPaymentIntent({
    required String amount,
    required String currency,
    required String customerStripeId,
  }) async {
    var response = await Dio().post(
      'https://api.stripe.com/v1/payment_intents',
      data: {
        'amount': amount,
        "currency": currency,
        'customer': customerStripeId,
      },
      options: Options(headers: {
        'Content-Type': Headers.formUrlEncodedContentType,
        'Authorization': 'Bearer ${AppKeys.stripeSecretKey}'
      }),
    );
    return response.data['client_secret'];
  }

  //2.
  Future initPaymentSheet({
    required String clientSecret,
    required String ephemeralKey,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Mahmoud Niazy',
        style: ThemeMode.light,
        appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
          background: Colors.white,
              icon: AppConstance.primaryColor,
              primary: AppConstance.primaryColor,
              componentBackground: Colors.blue.shade50,
              componentText: AppConstance.primaryColor,
              secondaryText: AppConstance.primaryColor,
              placeholderText: AppConstance.primaryColor,
        )),
        customerId: await CacheHelper.getData(key: 'customerStripeId') ?? '',
        customerEphemeralKeySecret: ephemeralKey,
      ),
    );
  }

  //3.
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //Final Method
  Future makePayment({
    required String amount,
    required String currency,
    required customerStripeId,
  }) async {
    String clientSecret = await createPaymentIntent(
      amount: amount,
      currency: currency,
      customerStripeId: customerStripeId,
    );
    String ephemeralKey = await createEphemeralKey(
      customerId: await CacheHelper.getData(
            key: 'customerStripeId',
          ) ??
          '',
    );
    await initPaymentSheet(
      clientSecret: clientSecret,
      ephemeralKey: ephemeralKey,
    );
    await displayPaymentSheet();
  }

  Future<String> createCustomer({
    required String name,
  }) async {
    var response = await Dio().post(
      'https://api.stripe.com/v1/customers',
      data: {
        'name': name,
      },
      options: Options(headers: {
        'Content-Type': Headers.formUrlEncodedContentType,
        'Authorization': 'Bearer ${AppKeys.stripeSecretKey}'
      }),
    );
    return response.data['id'];
  }

  createEphemeralKey({
    required String customerId,
  }) async {
    var response = await Dio().post(
      'https://api.stripe.com/v1/ephemeral_keys',
      data: {
        'customer': customerId,
      },
      options: Options(headers: {
        'Content-Type': Headers.formUrlEncodedContentType,
        'Authorization': 'Bearer ${AppKeys.stripeSecretKey}',
        'Stripe-Version': "2023-10-16",
      }),
    );
    return response.data['secret'];
  }
}
