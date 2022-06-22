import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'variants_record.g.dart';

abstract class VariantsRecord
    implements Built<VariantsRecord, VariantsRecordBuilder> {
  static Serializer<VariantsRecord> get serializer =>
      _$variantsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get parentId;

  @nullable
  int get box;

  @nullable
  BuiltList<String> get coupon;

  @nullable
  String get details;

  @nullable
  double get discount;

  @nullable
  double get discount1;

  @nullable
  double get discount2;

  @nullable
  double get discount3;

  @nullable
  int get discountRange1;

  @nullable
  int get discountRange2;

  @nullable
  int get discountRange3;

  @nullable
  String get location;

  @nullable
  int get master;

  @nullable
  double get megaWholesalePrice;

  @nullable
  double get minimumPrice;

  @nullable
  double get publicPrice;

  @nullable
  BuiltList<String> get tags;

  @nullable
  String get unit;

  @nullable
  int get weight;

  @nullable
  double get wholesalePrice;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(VariantsRecordBuilder builder) => builder
    ..id = ''
    ..parentId = ''
    ..box = 0
    ..coupon = ListBuilder()
    ..details = ''
    ..discount = 0.0
    ..discount1 = 0.0
    ..discount2 = 0.0
    ..discount3 = 0.0
    ..discountRange1 = 0
    ..discountRange2 = 0
    ..discountRange3 = 0
    ..location = ''
    ..master = 0
    ..megaWholesalePrice = 0.0
    ..minimumPrice = 0.0
    ..publicPrice = 0.0
    ..tags = ListBuilder()
    ..unit = ''
    ..weight = 0
    ..wholesalePrice = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('variants')
          : FirebaseFirestore.instance.collectionGroup('variants');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('variants').doc();

  static Stream<VariantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VariantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VariantsRecord._();
  factory VariantsRecord([void Function(VariantsRecordBuilder) updates]) =
      _$VariantsRecord;

  static VariantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVariantsRecordData({
  String id,
  String parentId,
  int box,
  String details,
  double discount,
  double discount1,
  double discount2,
  double discount3,
  int discountRange1,
  int discountRange2,
  int discountRange3,
  String location,
  int master,
  double megaWholesalePrice,
  double minimumPrice,
  double publicPrice,
  String unit,
  int weight,
  double wholesalePrice,
}) =>
    serializers.toFirestore(
        VariantsRecord.serializer,
        VariantsRecord((v) => v
          ..id = id
          ..parentId = parentId
          ..box = box
          ..coupon = null
          ..details = details
          ..discount = discount
          ..discount1 = discount1
          ..discount2 = discount2
          ..discount3 = discount3
          ..discountRange1 = discountRange1
          ..discountRange2 = discountRange2
          ..discountRange3 = discountRange3
          ..location = location
          ..master = master
          ..megaWholesalePrice = megaWholesalePrice
          ..minimumPrice = minimumPrice
          ..publicPrice = publicPrice
          ..tags = null
          ..unit = unit
          ..weight = weight
          ..wholesalePrice = wholesalePrice));
