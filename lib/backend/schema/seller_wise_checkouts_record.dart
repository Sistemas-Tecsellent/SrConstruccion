import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'seller_wise_checkouts_record.g.dart';

abstract class SellerWiseCheckoutsRecord
    implements
        Built<SellerWiseCheckoutsRecord, SellerWiseCheckoutsRecordBuilder> {
  static Serializer<SellerWiseCheckoutsRecord> get serializer =>
      _$sellerWiseCheckoutsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get message;

  @nullable
  int get ordersAmount;

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
  int get expressProducts;

  @nullable
  int get normalProducts;

  @nullable
  int get pickupInStoreProducts;

  @nullable
  bool get pendingShipmentPrice;

  @nullable
  String get deliverDate;

  @nullable
  bool get hadPricingRequest;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(SellerWiseCheckoutsRecordBuilder builder) =>
      builder
        ..id = ''
        ..message = ''
        ..ordersAmount = 0
        ..paymentMethod = ''
        ..shipmentTotal = 0.0
        ..subtotal = 0.0
        ..total = 0.0
        ..totalInCents = 0
        ..expressProducts = 0
        ..normalProducts = 0
        ..pickupInStoreProducts = 0
        ..pendingShipmentPrice = false
        ..deliverDate = ''
        ..hadPricingRequest = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('sellerWiseCheckouts')
          : FirebaseFirestore.instance.collectionGroup('sellerWiseCheckouts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sellerWiseCheckouts').doc();

  static Stream<SellerWiseCheckoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SellerWiseCheckoutsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SellerWiseCheckoutsRecord._();
  factory SellerWiseCheckoutsRecord(
          [void Function(SellerWiseCheckoutsRecordBuilder) updates]) =
      _$SellerWiseCheckoutsRecord;

  static SellerWiseCheckoutsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSellerWiseCheckoutsRecordData({
  String id,
  String message,
  int ordersAmount,
  String paymentMethod,
  double shipmentTotal,
  double subtotal,
  double total,
  int totalInCents,
  int expressProducts,
  int normalProducts,
  int pickupInStoreProducts,
  bool pendingShipmentPrice,
  String deliverDate,
  bool hadPricingRequest,
}) =>
    serializers.toFirestore(
        SellerWiseCheckoutsRecord.serializer,
        SellerWiseCheckoutsRecord((s) => s
          ..id = id
          ..message = message
          ..ordersAmount = ordersAmount
          ..paymentMethod = paymentMethod
          ..shipmentTotal = shipmentTotal
          ..subtotal = subtotal
          ..total = total
          ..totalInCents = totalInCents
          ..expressProducts = expressProducts
          ..normalProducts = normalProducts
          ..pickupInStoreProducts = pickupInStoreProducts
          ..pendingShipmentPrice = pendingShipmentPrice
          ..deliverDate = deliverDate
          ..hadPricingRequest = hadPricingRequest));
