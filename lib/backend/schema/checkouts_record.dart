import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'checkouts_record.g.dart';

abstract class CheckoutsRecord
    implements Built<CheckoutsRecord, CheckoutsRecordBuilder> {
  static Serializer<CheckoutsRecord> get serializer =>
      _$checkoutsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get message;

  @nullable
  String get paymentMethod;

  @nullable
  double get shipmentTotal;

  @nullable
  double get subtotal;

  @nullable
  double get total;

  @nullable
  int get totalInCents;

  @nullable
  int get ordersAmount;

  @nullable
  int get expressProducts;

  @nullable
  int get normalProducts;

  @nullable
  bool get pendingShipmentPrice;

  @nullable
  String get deliveryDate;

  @nullable
  bool get hadPricingRequest;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CheckoutsRecordBuilder builder) => builder
    ..id = ''
    ..message = ''
    ..paymentMethod = ''
    ..shipmentTotal = 0.0
    ..subtotal = 0.0
    ..total = 0.0
    ..totalInCents = 0
    ..ordersAmount = 0
    ..expressProducts = 0
    ..normalProducts = 0
    ..pendingShipmentPrice = false
    ..deliveryDate = ''
    ..hadPricingRequest = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checkouts');

  static Stream<CheckoutsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CheckoutsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CheckoutsRecord._();
  factory CheckoutsRecord([void Function(CheckoutsRecordBuilder) updates]) =
      _$CheckoutsRecord;

  static CheckoutsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCheckoutsRecordData({
  String id,
  String message,
  String paymentMethod,
  double shipmentTotal,
  double subtotal,
  double total,
  int totalInCents,
  int ordersAmount,
  int expressProducts,
  int normalProducts,
  bool pendingShipmentPrice,
  String deliveryDate,
  bool hadPricingRequest,
}) =>
    serializers.toFirestore(
        CheckoutsRecord.serializer,
        CheckoutsRecord((c) => c
          ..id = id
          ..message = message
          ..paymentMethod = paymentMethod
          ..shipmentTotal = shipmentTotal
          ..subtotal = subtotal
          ..total = total
          ..totalInCents = totalInCents
          ..ordersAmount = ordersAmount
          ..expressProducts = expressProducts
          ..normalProducts = normalProducts
          ..pendingShipmentPrice = pendingShipmentPrice
          ..deliveryDate = deliveryDate
          ..hadPricingRequest = hadPricingRequest));
