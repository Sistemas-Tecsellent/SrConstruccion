import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subcategories_record.g.dart';

abstract class SubcategoriesRecord
    implements Built<SubcategoriesRecord, SubcategoriesRecordBuilder> {
  static Serializer<SubcategoriesRecord> get serializer =>
      _$subcategoriesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get image;

  @nullable
  String get parentCategory;

  @nullable
  String get banner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(SubcategoriesRecordBuilder builder) => builder
    ..id = ''
    ..image = ''
    ..parentCategory = ''
    ..banner = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('subcategories')
          : FirebaseFirestore.instance.collectionGroup('subcategories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('subcategories').doc();

  static Stream<SubcategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubcategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubcategoriesRecord._();
  factory SubcategoriesRecord(
          [void Function(SubcategoriesRecordBuilder) updates]) =
      _$SubcategoriesRecord;

  static SubcategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubcategoriesRecordData({
  String id,
  String image,
  String parentCategory,
  String banner,
}) =>
    serializers.toFirestore(
        SubcategoriesRecord.serializer,
        SubcategoriesRecord((s) => s
          ..id = id
          ..image = image
          ..parentCategory = parentCategory
          ..banner = banner));
