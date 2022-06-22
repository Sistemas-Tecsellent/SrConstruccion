import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'addresses_record.g.dart';

abstract class AddressesRecord
    implements Built<AddressesRecord, AddressesRecordBuilder> {
  static Serializer<AddressesRecord> get serializer =>
      _$addressesRecordSerializer;

  @nullable
  String get addressLine1;

  @nullable
  String get city;

  @nullable
  String get country;

  @nullable
  String get id;

  @nullable
  LatLng get mapLocation;

  @nullable
  String get name;

  @nullable
  String get postalCode;

  @nullable
  String get state;

  @nullable
  String get suburb;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(AddressesRecordBuilder builder) => builder
    ..addressLine1 = ''
    ..city = ''
    ..country = ''
    ..id = ''
    ..name = ''
    ..postalCode = ''
    ..state = ''
    ..suburb = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('addresses')
          : FirebaseFirestore.instance.collectionGroup('addresses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('addresses').doc();

  static Stream<AddressesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AddressesRecord._();
  factory AddressesRecord([void Function(AddressesRecordBuilder) updates]) =
      _$AddressesRecord;

  static AddressesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAddressesRecordData({
  String addressLine1,
  String city,
  String country,
  String id,
  LatLng mapLocation,
  String name,
  String postalCode,
  String state,
  String suburb,
}) =>
    serializers.toFirestore(
        AddressesRecord.serializer,
        AddressesRecord((a) => a
          ..addressLine1 = addressLine1
          ..city = city
          ..country = country
          ..id = id
          ..mapLocation = mapLocation
          ..name = name
          ..postalCode = postalCode
          ..state = state
          ..suburb = suburb));
