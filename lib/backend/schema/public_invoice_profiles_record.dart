import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'public_invoice_profiles_record.g.dart';

abstract class PublicInvoiceProfilesRecord
    implements
        Built<PublicInvoiceProfilesRecord, PublicInvoiceProfilesRecordBuilder> {
  static Serializer<PublicInvoiceProfilesRecord> get serializer =>
      _$publicInvoiceProfilesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  String get rfc;

  @nullable
  String get address;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PublicInvoiceProfilesRecordBuilder builder) =>
      builder
        ..id = ''
        ..name = ''
        ..rfc = ''
        ..address = ''
        ..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('publicInvoiceProfiles');

  static Stream<PublicInvoiceProfilesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PublicInvoiceProfilesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PublicInvoiceProfilesRecord._();
  factory PublicInvoiceProfilesRecord(
          [void Function(PublicInvoiceProfilesRecordBuilder) updates]) =
      _$PublicInvoiceProfilesRecord;

  static PublicInvoiceProfilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPublicInvoiceProfilesRecordData({
  String id,
  String name,
  String rfc,
  String address,
  String email,
}) =>
    serializers.toFirestore(
        PublicInvoiceProfilesRecord.serializer,
        PublicInvoiceProfilesRecord((p) => p
          ..id = id
          ..name = name
          ..rfc = rfc
          ..address = address
          ..email = email));
