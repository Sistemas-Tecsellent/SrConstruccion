import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invoice_profiles_record.g.dart';

abstract class InvoiceProfilesRecord
    implements Built<InvoiceProfilesRecord, InvoiceProfilesRecordBuilder> {
  static Serializer<InvoiceProfilesRecord> get serializer =>
      _$invoiceProfilesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get address;

  @nullable
  String get email;

  @nullable
  String get name;

  @nullable
  String get rfc;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(InvoiceProfilesRecordBuilder builder) =>
      builder
        ..id = ''
        ..address = ''
        ..email = ''
        ..name = ''
        ..rfc = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('invoiceProfiles')
          : FirebaseFirestore.instance.collectionGroup('invoiceProfiles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('invoiceProfiles').doc();

  static Stream<InvoiceProfilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InvoiceProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  InvoiceProfilesRecord._();
  factory InvoiceProfilesRecord(
          [void Function(InvoiceProfilesRecordBuilder) updates]) =
      _$InvoiceProfilesRecord;

  static InvoiceProfilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInvoiceProfilesRecordData({
  String id,
  String address,
  String email,
  String name,
  String rfc,
}) =>
    serializers.toFirestore(
        InvoiceProfilesRecord.serializer,
        InvoiceProfilesRecord((i) => i
          ..id = id
          ..address = address
          ..email = email
          ..name = name
          ..rfc = rfc));
