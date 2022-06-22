import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_for_clients_record.g.dart';

abstract class OrdersForClientsRecord
    implements Built<OrdersForClientsRecord, OrdersForClientsRecordBuilder> {
  static Serializer<OrdersForClientsRecord> get serializer =>
      _$ordersForClientsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get bundleId;

  @nullable
  String get customerId;

  @nullable
  String get status;

  @nullable
  int get amountOfProducts;

  @nullable
  double get shipmentDistance;

  @nullable
  String get shipmentTimeText;

  @nullable
  double get subtotal;

  @nullable
  double get total;

  @nullable
  String get type;

  @nullable
  double get shipmentPrice;

  @nullable
  String get deliverDate;

  @nullable
  String get statusForClient;

  @nullable
  String get code;

  @nullable
  BuiltList<String> get totalSuppliersIds;

  @nullable
  DateTime get createdDate;

  @nullable
  double get discount;

  @nullable
  String get parcelName;

  @nullable
  String get parcelGuide;

  @nullable
  String get parcelLink;

  @nullable
  String get parcelLogo;

  @nullable
  String get distanceText;

  @nullable
  String get store;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrdersForClientsRecordBuilder builder) =>
      builder
        ..id = ''
        ..bundleId = ''
        ..customerId = ''
        ..status = ''
        ..amountOfProducts = 0
        ..shipmentDistance = 0.0
        ..shipmentTimeText = ''
        ..subtotal = 0.0
        ..total = 0.0
        ..type = ''
        ..shipmentPrice = 0.0
        ..deliverDate = ''
        ..statusForClient = ''
        ..code = ''
        ..totalSuppliersIds = ListBuilder()
        ..discount = 0.0
        ..parcelName = ''
        ..parcelGuide = ''
        ..parcelLink = ''
        ..parcelLogo = ''
        ..distanceText = ''
        ..store = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ordersForClients');

  static Stream<OrdersForClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersForClientsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersForClientsRecord._();
  factory OrdersForClientsRecord(
          [void Function(OrdersForClientsRecordBuilder) updates]) =
      _$OrdersForClientsRecord;

  static OrdersForClientsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersForClientsRecordData({
  String id,
  String bundleId,
  String customerId,
  String status,
  int amountOfProducts,
  double shipmentDistance,
  String shipmentTimeText,
  double subtotal,
  double total,
  String type,
  double shipmentPrice,
  String deliverDate,
  String statusForClient,
  String code,
  DateTime createdDate,
  double discount,
  String parcelName,
  String parcelGuide,
  String parcelLink,
  String parcelLogo,
  String distanceText,
  String store,
}) =>
    serializers.toFirestore(
        OrdersForClientsRecord.serializer,
        OrdersForClientsRecord((o) => o
          ..id = id
          ..bundleId = bundleId
          ..customerId = customerId
          ..status = status
          ..amountOfProducts = amountOfProducts
          ..shipmentDistance = shipmentDistance
          ..shipmentTimeText = shipmentTimeText
          ..subtotal = subtotal
          ..total = total
          ..type = type
          ..shipmentPrice = shipmentPrice
          ..deliverDate = deliverDate
          ..statusForClient = statusForClient
          ..code = code
          ..totalSuppliersIds = null
          ..createdDate = createdDate
          ..discount = discount
          ..parcelName = parcelName
          ..parcelGuide = parcelGuide
          ..parcelLink = parcelLink
          ..parcelLogo = parcelLogo
          ..distanceText = distanceText
          ..store = store));
