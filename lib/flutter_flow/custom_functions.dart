import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool isInTagList(
  List<String> tagsList,
  String tag,
) {
  if (tagsList.contains(tag)) {
    return true;
  }
  return false;
}

bool isLikedProduct(
  List<String> likedProducts,
  String productId,
) {
  if (likedProducts.contains(productId)) {
    return true;
  }
  return false;
}

LatLng getUserLocation(LatLng userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

String setLocation(LatLng location) {
  return location.toString();
}

double getLatitudeFromLatlng(LatLng coord) {
  return coord.latitude;
}

double getLongitudeFromLatlng(LatLng coord) {
  return coord.longitude;
}

bool isSameState(
  String databaseLocation,
  String userLocation,
) {
  if (databaseLocation == userLocation) {
    return true;
  }
  return false;
}

bool compareStrings(
  String stringToCompare,
  String stringToCompareTo,
) {
  if (stringToCompare == stringToCompareTo) {
    return true;
  } else {
    return false;
  }
}

bool isOrderEmpty(
  dynamic checkout,
  String order,
) {
  if (order == 'expressOrder') {
    if (checkout['expressOrder']['amountOfProducts'] == 0) {
      return true;
    } else {
      return false;
    }
  }
  if (order == 'normalOrder') {
    if (checkout['normalOrder']['amountOfProducts'] == 0) {
      return true;
    } else {
      return false;
    }
  }
  if (order == 'largePeriodOrder') {
    if (checkout['largePeriodOrder']['amountOfProducts'] == 0) {
      return true;
    } else {
      return false;
    }
  }
  if (order == 'services') {
    if (checkout['services']['amountOfProducts'] == 0) {
      return true;
    } else {
      return false;
    }
  }
  if (order == 'storeWiseOrders') {
    if (checkout['storeWiseOrders']['amountOfProducts'] == 0) {
      return true;
    } else {
      return false;
    }
  }
  return true;
}

double getProductForCartSubtotal(
  double first,
  double second,
  int firstMultiplier,
  int secondMultiplier,
) {
  var firstItem = (first * firstMultiplier);
  var secondItem = (second * secondMultiplier);
  var total = firstItem + secondItem;
  return total;
}

bool isGreaterThanZero(int value) {
  if (value > 0) {
    return true;
  }
  return false;
}

double extractLatOrLng(
  LatLng coord,
  String retreiveValue,
) {
  if (retreiveValue == "lat") {
    return coord.latitude;
  }
  return coord.longitude;
}

bool isGreaterThan(
  int value,
  int than,
) {
  if (value > than) {
    return true;
  }
  return false;
}

bool isEqualTo(
  int value,
  int equalTo,
) {
  if (value == equalTo) {
    return true;
  }
  return false;
}

int substractOne(int value) {
  if (value <= 0) {
    return 0;
  }
  return value - 1;
}

bool areStringsEqual(
  String value,
  String compareTo,
) {
  if (value == compareTo) {
    return true;
  }
  return false;
}
