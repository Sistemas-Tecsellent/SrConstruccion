import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'store_brands_record.g.dart';

abstract class StoreBrandsRecord
    implements Built<StoreBrandsRecord, StoreBrandsRecordBuilder> {
  static Serializer<StoreBrandsRecord> get serializer =>
      _$storeBrandsRecordSerializer;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(StoreBrandsRecordBuilder builder) =>
      builder..id = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('storeBrands')
          : FirebaseFirestore.instance.collectionGroup('storeBrands');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('storeBrands').doc();

  static Stream<StoreBrandsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoreBrandsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoreBrandsRecord._();
  factory StoreBrandsRecord([void Function(StoreBrandsRecordBuilder) updates]) =
      _$StoreBrandsRecord;

  static StoreBrandsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoreBrandsRecordData({
  String id,
}) =>
    serializers.toFirestore(
        StoreBrandsRecord.serializer, StoreBrandsRecord((s) => s..id = id));
