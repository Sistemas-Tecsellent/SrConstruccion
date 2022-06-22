import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notifications_record.g.dart';

abstract class NotificationsRecord
    implements Built<NotificationsRecord, NotificationsRecordBuilder> {
  static Serializer<NotificationsRecord> get serializer =>
      _$notificationsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get status;

  @nullable
  bool get isRead;

  @nullable
  String get title;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(NotificationsRecordBuilder builder) => builder
    ..id = ''
    ..status = ''
    ..isRead = false
    ..title = ''
    ..description = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('notifications')
          : FirebaseFirestore.instance.collectionGroup('notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notifications').doc();

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  NotificationsRecord._();
  factory NotificationsRecord(
          [void Function(NotificationsRecordBuilder) updates]) =
      _$NotificationsRecord;

  static NotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNotificationsRecordData({
  String id,
  String status,
  bool isRead,
  String title,
  String description,
}) =>
    serializers.toFirestore(
        NotificationsRecord.serializer,
        NotificationsRecord((n) => n
          ..id = id
          ..status = status
          ..isRead = isRead
          ..title = title
          ..description = description));
