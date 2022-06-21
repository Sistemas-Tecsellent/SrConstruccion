import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'work_days_record.g.dart';

abstract class WorkDaysRecord
    implements Built<WorkDaysRecord, WorkDaysRecordBuilder> {
  static Serializer<WorkDaysRecord> get serializer =>
      _$workDaysRecordSerializer;

  @nullable
  String get id;

  @nullable
  DateTime get closes;

  @nullable
  bool get enabled;

  @nullable
  DateTime get opens;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(WorkDaysRecordBuilder builder) => builder
    ..id = ''
    ..enabled = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('workDays')
          : FirebaseFirestore.instance.collectionGroup('workDays');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('workDays').doc();

  static Stream<WorkDaysRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<WorkDaysRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WorkDaysRecord._();
  factory WorkDaysRecord([void Function(WorkDaysRecordBuilder) updates]) =
      _$WorkDaysRecord;

  static WorkDaysRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWorkDaysRecordData({
  String id,
  DateTime closes,
  bool enabled,
  DateTime opens,
}) =>
    serializers.toFirestore(
        WorkDaysRecord.serializer,
        WorkDaysRecord((w) => w
          ..id = id
          ..closes = closes
          ..enabled = enabled
          ..opens = opens));
