import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deliverers_location_record.g.dart';

abstract class DeliverersLocationRecord
    implements
        Built<DeliverersLocationRecord, DeliverersLocationRecordBuilder> {
  static Serializer<DeliverersLocationRecord> get serializer =>
      _$deliverersLocationRecordSerializer;

  @nullable
  String get orderOwner;

  @nullable
  String get order;

  @nullable
  LatLng get location;

  @nullable
  String get orderForClientId;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeliverersLocationRecordBuilder builder) =>
      builder
        ..orderOwner = ''
        ..order = ''
        ..orderForClientId = ''
        ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deliverersLocation');

  static Stream<DeliverersLocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DeliverersLocationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeliverersLocationRecord._();
  factory DeliverersLocationRecord(
          [void Function(DeliverersLocationRecordBuilder) updates]) =
      _$DeliverersLocationRecord;

  static DeliverersLocationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDeliverersLocationRecordData({
  String orderOwner,
  String order,
  LatLng location,
  String orderForClientId,
  String id,
}) =>
    serializers.toFirestore(
        DeliverersLocationRecord.serializer,
        DeliverersLocationRecord((d) => d
          ..orderOwner = orderOwner
          ..order = order
          ..location = location
          ..orderForClientId = orderForClientId
          ..id = id));
