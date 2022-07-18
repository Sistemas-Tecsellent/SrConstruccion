// @JS()
// library stripe;

// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code

// import 'package:js/js.dart';
// import 'package:cloud_functions/cloud_functions.dart';

Future<String> webCheckout(
  String checkoutId,
  String bundleId,
) async {
  // HttpsCallable createStripeProduct =
  //     FirebaseFunctions.instance.httpsCallable('createStripeProduct');
  // final response = await createStripeProduct
  //     .call(<String, dynamic>{'checkoutId': checkoutId, 'bundleId': bundleId});

  // var res = response.data;
  // var productId = res['id'];
  // var productName = res['name'];

  // var result = Stripe(
  //         'pk_live_51KeQUnBmz2HhZ6eyQglZ73HPFGbxY1ztVm4EHqFV95Bw78Imz4JSXevSzV3yWcPvJA5Gv5H78fzcXu0siZMJwT6800CuYmmuME')
  //     .redirectToCheckout(CheckoutOptions(
  //   lineItems: [
  //     LineItem(
  //       price: productId,
  //       quantity: 1,
  //     )
  //   ],
  //   mode: 'payment',
  //   successUrl: 'http://tienda.srconstruccion.com',
  //   cancelUrl: 'http://tienda.srconstruccion.com',
  // ));

  // return productName;
  return '';
}

// @JS()
// class Stripe {
//   external Stripe(String key);

//   external redirectToCheckout(CheckoutOptions options);
// }

// @JS()
// @anonymous
// class CheckoutOptions {
//   external List<LineItem> get lineItems;

//   external String get mode;

//   external String get successUrl;

//   external String get cancelUrl;

//   external factory CheckoutOptions({
//     List<LineItem> lineItems,
//     String mode,
//     String successUrl,
//     String cancelUrl,
//     String sessionId,
//   });
// }


// @JS()
// @anonymous
// class LineItem {
//   external String get price;

//   external int get quantity;

//   external factory LineItem({String price, int quantity});
// }

