import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_bundles_record.g.dart';

abstract class OrderBundlesRecord
    implements Built<OrderBundlesRecord, OrderBundlesRecordBuilder> {
  static Serializer<OrderBundlesRecord> get serializer =>
      _$orderBundlesRecordSerializer;

  @nullable
  String get owner;

  @nullable
  String get id;

  @nullable
  String get status;

  @nullable
  DateTime get createdDate;

  @nullable
  String get code;

  @nullable
  String get expressStatus;

  @nullable
  String get normalStatus;

  @nullable
  String get bundleTotal;

  @nullable
  String get bundleSubtotal;

  @nullable
  String get bundleShipmentPrice;

  @nullable
  String get customerAddress;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderBundlesRecordBuilder builder) => builder
    ..owner = ''
    ..id = ''
    ..status = ''
    ..code = ''
    ..expressStatus = ''
    ..normalStatus = ''
    ..bundleTotal = ''
    ..bundleSubtotal = ''
    ..bundleShipmentPrice = ''
    ..customerAddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderBundles');

  static Stream<OrderBundlesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrderBundlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderBundlesRecord._();
  factory OrderBundlesRecord(
          [void Function(OrderBundlesRecordBuilder) updates]) =
      _$OrderBundlesRecord;

  static OrderBundlesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderBundlesRecordData({
  String owner,
  String id,
  String status,
  DateTime createdDate,
  String code,
  String expressStatus,
  String normalStatus,
  String bundleTotal,
  String bundleSubtotal,
  String bundleShipmentPrice,
  String customerAddress,
}) =>
    serializers.toFirestore(
        OrderBundlesRecord.serializer,
        OrderBundlesRecord((o) => o
          ..owner = owner
          ..id = id
          ..status = status
          ..createdDate = createdDate
          ..code = code
          ..expressStatus = expressStatus
          ..normalStatus = normalStatus
          ..bundleTotal = bundleTotal
          ..bundleSubtotal = bundleSubtotal
          ..bundleShipmentPrice = bundleShipmentPrice
          ..customerAddress = customerAddress));
