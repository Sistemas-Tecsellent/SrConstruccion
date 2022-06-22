// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getUserInvoiceProfiles(String uid) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return await firestore
      .collection('users/$uid/invoiceProfiles')
      .where('id', isNotEqualTo: uid)
      .get()
      .then((QuerySnapshot querySnapshot) {
    var response = [];
    for (var doc in querySnapshot.docs) {
      response.add({
        'id': doc['id'],
        'name': doc['name'],
        'addressLine1': doc['addressLine1'],
        'city': doc['city'],
        'country': doc['country'],
        'postalCode': doc['postalCode'],
        'state': doc['state'],
        'suburb': doc['suburb'],
      });
    }
    return response;
  });
}
