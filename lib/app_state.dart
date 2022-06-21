import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _userIsLogged = prefs.getBool('ff_userIsLogged') ?? _userIsLogged;
    _locationKey = prefs.getString('ff_locationKey') ?? _locationKey;
    _locationKeyCity =
        prefs.getString('ff_locationKeyCity') ?? _locationKeyCity;
    _userAddresses = prefs.getStringList('ff_userAddresses')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        })?.toList() ??
        _userAddresses;
    _paymentMethod = prefs.getString('ff_paymentMethod') ?? _paymentMethod;
    _paymentId = prefs.getString('ff_paymentId') ?? _paymentId;
  }

  SharedPreferences prefs;

  bool _userIsLogged = false;
  bool get userIsLogged => _userIsLogged;
  set userIsLogged(bool _value) {
    _userIsLogged = _value;
    prefs.setBool('ff_userIsLogged', _value);
  }

  dynamic currentVariantFormatted;

  String _locationKey = 'Morelos';
  String get locationKey => _locationKey;
  set locationKey(String _value) {
    _locationKey = _value;
    prefs.setString('ff_locationKey', _value);
  }

  String _locationKeyCity = 'Cuernavaca';
  String get locationKeyCity => _locationKeyCity;
  set locationKeyCity(String _value) {
    _locationKeyCity = _value;
    prefs.setString('ff_locationKeyCity', _value);
  }

  List<dynamic> applicableVariants = [];

  List<dynamic> cart = [];

  List<String> localStores = [];

  dynamic checkoutSession;

  dynamic checkoutAddress;

  List<dynamic> _userAddresses = [];
  List<dynamic> get userAddresses => _userAddresses;
  set userAddresses(List<dynamic> _value) {
    _userAddresses = _value;
    prefs.setStringList(
        'ff_userAddresses', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToUserAddresses(dynamic _value) {
    _userAddresses.add(_value);
    prefs.setStringList(
        'ff_userAddresses', _userAddresses.map((x) => jsonEncode(x)).toList());
  }

  void removeFromUserAddresses(dynamic _value) {
    _userAddresses.remove(_value);
    prefs.setStringList(
        'ff_userAddresses', _userAddresses.map((x) => jsonEncode(x)).toList());
  }

  String _paymentMethod = 'Tarjeta Crédito / Débito';
  String get paymentMethod => _paymentMethod;
  set paymentMethod(String _value) {
    _paymentMethod = _value;
    prefs.setString('ff_paymentMethod', _value);
  }

  String _paymentId = '';
  String get paymentId => _paymentId;
  set paymentId(String _value) {
    _paymentId = _value;
    prefs.setString('ff_paymentId', _value);
  }

  double cartTotal = 0.0;

  dynamic orderDetails;

  dynamic bundleCheckout;

  dynamic expressOrderDetails;

  List<dynamic> notifications = [];

  List<dynamic> invoiceProfiles = [];

  List<String> productsStoreSupplied = [];

  List<dynamic> checkoutInvoiceProfiles = [];

  dynamic checkoutInvoiceProfile;

  String invoiceUsage = '';

  String currentVariant = '';

  List<String> brandsFilter = [];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
