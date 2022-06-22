import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class ReverseGeocodingCall {
  static Future<ApiCallResponse> call({
    String latlng = '0,0',
    String key = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'reverseGeocoding',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
        'key': key,
      },
      returnBody: true,
    );
  }
}

class GetVariantInventoryByStoreCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String variantId = '',
    String store = '',
    String priceType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVariantInventoryByStore',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getVariantInventoryByStore',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'variantId': variantId,
        'store': store,
        'priceType': priceType,
      },
      returnBody: true,
    );
  }

  static dynamic inventory(dynamic response) => getJsonField(
        response,
        r'''$.inventory''',
      );
}

class GetSuborderInfoCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String orderType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSuborderInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSuborderInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'orderType': orderType,
      },
      returnBody: true,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
      );
}

class GetApplicableVariantsCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String userLocation = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getApplicableVariants',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getApplicableVariants',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'userLocation': userLocation,
      },
      returnBody: true,
    );
  }
}

class GetVariantInventoryCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String variantId = '',
    String userLocationState = '',
    String userLocationCity = '',
    String priceType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVariantInventory',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getVariantInventory',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'variantId': variantId,
        'userLocationState': userLocationState,
        'userLocationCity': userLocationCity,
        'priceType': priceType,
      },
      returnBody: true,
    );
  }

  static dynamic inventory(dynamic response) => getJsonField(
        response,
        r'''$.inventory''',
      );
}

class GetCartCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCart',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getCart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
      },
      returnBody: true,
    );
  }
}

class GetCartTotalCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCartTotal',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getCartTotal',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
      },
      returnBody: true,
    );
  }

  static dynamic value(dynamic response) => getJsonField(
        response,
        r'''$.total.value''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.total.text''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.total.message''',
      );
}

class GetOneVariantCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String userLocation = '',
    String userType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOneVariant',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getOneVariant',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'userLocation': userLocation,
        'userType': userType,
      },
      returnBody: true,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.variant.id''',
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.variant.price''',
      );
  static dynamic unit(dynamic response) => getJsonField(
        response,
        r'''$.variant.unit''',
      );
}

class GetOrderForClientInfoCall {
  static Future<ApiCallResponse> call({
    String orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderForClientInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getOrderForClientInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
      },
      returnBody: true,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
      );
  static dynamic suppliers(dynamic response) => getJsonField(
        response,
        r'''$.totalSuppliers''',
      );
}

class GetProductsStoreSuppliedCall {
  static Future<ApiCallResponse> call({
    String orderId = '',
    String store = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductsStoreSupplied',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getProductsStoreSupplied',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
        'store': store,
      },
      returnBody: true,
    );
  }

  static dynamic productsStoreSupplied(dynamic response) => getJsonField(
        response,
        r'''$.productsStoreSupplied''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
}

class GetLatLngToFieldCall {
  static Future<ApiCallResponse> call({
    String lat = '',
    String lng = '',
    String field = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatLngToField',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getLatLngToField',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lat': lat,
        'lng': lng,
        'field': field,
      },
      returnBody: true,
    );
  }
}

class GetSellerWiseCartCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSellerWiseCart',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSellerWiseCart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }
}

class GetSellerWiseCartTotalCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSellerWiseCartTotal',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSellerWiseCartTotal',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }

  static dynamic value(dynamic response) => getJsonField(
        response,
        r'''$.total.value''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.total.text''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.total.message''',
      );
}

class GetSellerWiseCheckoutCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSellerWiseCheckout',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSellerWiseCheckout',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }

  static dynamic expressOrder(dynamic response) => getJsonField(
        response,
        r'''$.expressOrder''',
      );
  static dynamic normalOrder(dynamic response) => getJsonField(
        response,
        r'''$.normalOrder''',
      );
  static dynamic pickupInStoreOrder(dynamic response) => getJsonField(
        response,
        r'''$.pickupInStoreOrder''',
      );
}

class ClearSellerWiseCartCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'clearSellerWiseCart',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/clearSellerWiseCart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }
}

class GetCartAmountCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String cartId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCartAmount',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getCartAmount',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
        'cartId': cartId,
      },
      returnBody: true,
    );
  }

  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
}
