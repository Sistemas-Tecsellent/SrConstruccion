// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getApplicableVariants(
  String productId,
  String userType,
  String userLocation,
  List<String> localStores,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var enabledSellersForThisProduct = await firestore
      .collection('products')
      .doc(productId)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    var results = [];
    for (var store in localStores) {
      if (documentSnapshot['stores'].contains(store)) {
        results.add(store);
      }
    }
    return results;
  });

  var result = await firestore
      .collection('products/$productId/variants')
      .get()
      .then((QuerySnapshot querySnapshot) async {
    var validRecords = []; //the list of formatted and applicable variants.
    var formattedVariant = {};

    //this variable tracks the records in which the location is the same of the user.
    var unitsThatOverrideOtherRecords = [];

    //this loop populates the previous list with records in which the location is equal to the user one
    for (var document in querySnapshot.docs) {
      formattedVariant = {}; //clearing just to be sure

      if (document['location'] == userLocation) {
        formattedVariant = fillVariant(document, userType);

        formattedVariant['localInventory'] = await getInventory(
            productId, document['id'], enabledSellersForThisProduct, userType);

        validRecords.add(formattedVariant);
        unitsThatOverrideOtherRecords.add(document['unit']);
      }
    }
    //Now we have the records that take precedence because of their location

    //Looping through the list again to add the records that do not have a unit equal in the previous list
    if (unitsThatOverrideOtherRecords.isEmpty) {
      for (var document in querySnapshot.docs) {
        formattedVariant = {};
        if (document['location'] != 'global') {
          continue;
        }

        formattedVariant = fillVariant(document, userType);

        formattedVariant['localInventory'] = await getInventory(
            productId, document['id'], enabledSellersForThisProduct, userType);

        validRecords.add(formattedVariant);
      }
    } else {
      for (var document in querySnapshot.docs) {
        formattedVariant = {};
        if (unitsThatOverrideOtherRecords.contains(document['unit'])) {
          continue;
        }

        formattedVariant = fillVariant(document, userType);
        formattedVariant['localInventory'] = await getInventory(
            productId, document['id'], enabledSellersForThisProduct, userType);

        validRecords.add(formattedVariant);
      }
    }
    return validRecords;
  });
  return result;
}

Future<int> getInventory(String productId, String variantId,
    List<dynamic> stores, String userType) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    return await firestore
        .collection('products/$productId/variants/$variantId/inventories')
        .where('storeId', whereIn: stores)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var totalInventory = 0;
      for (var document in querySnapshot.docs) {
        if (userType == "public" && document['publicPriceEnabled'] == true) {
          totalInventory = totalInventory + document['inventory'];
        }
      }
      return totalInventory;
    });
  } catch (e) {
    return 0;
  }
}

Map fillVariant(document, userType) {
  Map formattedVariant = {};
  formattedVariant['id'] = document['id'];
  formattedVariant['parentId'] = document['parentId'];
  formattedVariant['publicPrice'] = document['publicPrice'];
  formattedVariant['priceWithDiscount'] = document['publicPrice'];
  formattedVariant['unit'] = document['unit'];
  formattedVariant['tags'] = document['tags'];
  if (userType == "wholesale") {
    formattedVariant['normalPrice'] = document['wholesalePrice'];
  } else if (userType == "megaWholesale") {
    formattedVariant['normalPrice'] = document['megaWholesalePrice'];
  } else {
    formattedVariant['normalPrice'] = document['publicPrice'];
  }
  formattedVariant['discount1'] = document['discount1'];
  formattedVariant['discount2'] = document['discount2'];
  formattedVariant['discount3'] = document['discount3'];
  formattedVariant['discountRange1'] = document['discountRange1'];
  formattedVariant['discountRange2'] = document['discountRange2'];
  formattedVariant['discountRange3'] = document['discountRange3'];

  return formattedVariant;
}
