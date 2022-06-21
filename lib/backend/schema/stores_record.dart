import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stores_record.g.dart';

abstract class StoresRecord
    implements Built<StoresRecord, StoresRecordBuilder> {
  static Serializer<StoresRecord> get serializer => _$storesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get logo;

  @nullable
  String get banner;

  @nullable
  String get owner;

  @nullable
  String get name;

  @nullable
  String get location;

  @nullable
  String get locationCity;

  @nullable
  BuiltList<String> get categories;

  @nullable
  LatLng get mapLocation;

  @nullable
  String get address;

  @nullable
  BuiltList<String> get transports;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoresRecordBuilder builder) => builder
    ..id = ''
    ..logo = ''
    ..banner = ''
    ..owner = ''
    ..name = ''
    ..location = ''
    ..locationCity = ''
    ..categories = ListBuilder()
    ..address = ''
    ..transports = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoresRecord._();
  factory StoresRecord([void Function(StoresRecordBuilder) updates]) =
      _$StoresRecord;

  static StoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoresRecordData({
  String id,
  String logo,
  String banner,
  String owner,
  String name,
  String location,
  String locationCity,
  LatLng mapLocation,
  String address,
}) =>
    serializers.toFirestore(
        StoresRecord.serializer,
        StoresRecord((s) => s
          ..id = id
          ..logo = logo
          ..banner = banner
          ..owner = owner
          ..name = name
          ..location = location
          ..locationCity = locationCity
          ..categories = null
          ..mapLocation = mapLocation
          ..address = address
          ..transports = null));
