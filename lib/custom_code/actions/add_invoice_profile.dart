// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future addInvoiceProfile(
  String uid,
  String profileId,
  String profileName,
  String profileRfc,
  String profileAddress,
  String profileEmail,
) async {
  await FirebaseFirestore.instance
      .doc('users/$uid/invoiceProfiles/$profileId')
      .set({
    'id': profileId,
    'name': profileName,
    'rfc': profileRfc,
    'address': profileAddress,
    'email': profileEmail,
  });
}
