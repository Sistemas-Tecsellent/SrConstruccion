import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pricing_requests_record.g.dart';

abstract class PricingRequestsRecord
    implements Built<PricingRequestsRecord, PricingRequestsRecordBuilder> {
  static Serializer<PricingRequestsRecord> get serializer =>
      _$pricingRequestsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get checkoutId;

  @nullable
  String get owner;

  @nullable
  String get ownerName;

  @nullable
  String get ownerAddress;

  @nullable
  String get ownerPhone;

  @nullable
  String get shipmentPrice;

  @nullable
  String get assignedTo;

  @nullable
  String get deliveryDate;

  @nullable
  String get deliveryTime;

  @nullable
  BuiltList<String> get totalSuppliersIds;

  @nullable
  double get productsTotal;

  @nullable
  DateTime get createdDate;

  @nullable
  bool get active;

  @nullable
  String get status;

  @nullable
  String get store;

  @nullable
  String get storeName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PricingRequestsRecordBuilder builder) =>
      builder
        ..id = ''
        ..checkoutId = ''
        ..owner = ''
        ..ownerName = ''
        ..ownerAddress = ''
        ..ownerPhone = ''
        ..shipmentPrice = ''
        ..assignedTo = ''
        ..deliveryDate = ''
        ..deliveryTime = ''
        ..totalSuppliersIds = ListBuilder()
        ..productsTotal = 0.0
        ..active = false
        ..status = ''
        ..store = ''
        ..storeName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricingRequests');

  static Stream<PricingRequestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PricingRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PricingRequestsRecord._();
  factory PricingRequestsRecord(
          [void Function(PricingRequestsRecordBuilder) updates]) =
      _$PricingRequestsRecord;

  static PricingRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPricingRequestsRecordData({
  String id,
  String checkoutId,
  String owner,
  String ownerName,
  String ownerAddress,
  String ownerPhone,
  String shipmentPrice,
  String assignedTo,
  String deliveryDate,
  String deliveryTime,
  double productsTotal,
  DateTime createdDate,
  bool active,
  String status,
  String store,
  String storeName,
}) =>
    serializers.toFirestore(
        PricingRequestsRecord.serializer,
        PricingRequestsRecord((p) => p
          ..id = id
          ..checkoutId = checkoutId
          ..owner = owner
          ..ownerName = ownerName
          ..ownerAddress = ownerAddress
          ..ownerPhone = ownerPhone
          ..shipmentPrice = shipmentPrice
          ..assignedTo = assignedTo
          ..deliveryDate = deliveryDate
          ..deliveryTime = deliveryTime
          ..totalSuppliersIds = null
          ..productsTotal = productsTotal
          ..createdDate = createdDate
          ..active = active
          ..status = status
          ..store = store
          ..storeName = storeName));
