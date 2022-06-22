// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getInvoiceProfiles(String uid) async {
  return await FirebaseFirestore.instance
      .collection('users/$uid/invoiceProfiles')
      .where('id', isNotEqualTo: uid)
      .get()
      .then((QuerySnapshot querySnapshot) {
    var docs = [];
    for (var doc in querySnapshot.docs) {
      docs.add({
        'id': doc['id'],
        'name': doc['name'],
        'rfc': doc['rfc'],
        'address': doc['address'],
        'email': doc['email'],
      });
    }
    return docs;
  });
}
