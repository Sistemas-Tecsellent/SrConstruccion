import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'delivery_orders_record.g.dart';

abstract class DeliveryOrdersRecord
    implements Built<DeliveryOrdersRecord, DeliveryOrdersRecordBuilder> {
  static Serializer<DeliveryOrdersRecord> get serializer =>
      _$deliveryOrdersRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get orderForClientId;

  @nullable
  LatLng get destination;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeliveryOrdersRecordBuilder builder) => builder
    ..id = ''
    ..orderForClientId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deliveryOrders');

  static Stream<DeliveryOrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DeliveryOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeliveryOrdersRecord._();
  factory DeliveryOrdersRecord(
          [void Function(DeliveryOrdersRecordBuilder) updates]) =
      _$DeliveryOrdersRecord;

  static DeliveryOrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDeliveryOrdersRecordData({
  String id,
  String orderForClientId,
  LatLng destination,
}) =>
    serializers.toFirestore(
        DeliveryOrdersRecord.serializer,
        DeliveryOrdersRecord((d) => d
          ..id = id
          ..orderForClientId = orderForClientId
          ..destination = destination));
