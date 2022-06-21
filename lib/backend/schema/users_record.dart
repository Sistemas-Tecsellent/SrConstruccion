import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'liked_products')
  BuiltList<String> get likedProducts;

  @nullable
  String get phone;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get type;

  @nullable
  BuiltList<String> get liveOrders;

  @nullable
  BuiltList<String> get recentlyViewed;

  @nullable
  int get itemsInCart;

  @nullable
  bool get areNewNotifications;

  @nullable
  @BuiltValueField(wireName: 'liked_stores')
  BuiltList<String> get likedStores;

  @nullable
  @BuiltValueField(wireName: 'liked_brands')
  BuiltList<String> get likedBrands;

  @nullable
  String get occupation;

  @nullable
  String get businessModel;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..likedProducts = ListBuilder()
    ..phone = ''
    ..phoneNumber = ''
    ..type = ''
    ..liveOrders = ListBuilder()
    ..recentlyViewed = ListBuilder()
    ..itemsInCart = 0
    ..areNewNotifications = false
    ..likedStores = ListBuilder()
    ..likedBrands = ListBuilder()
    ..occupation = ''
    ..businessModel = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phone,
  String phoneNumber,
  String type,
  int itemsInCart,
  bool areNewNotifications,
  String occupation,
  String businessModel,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..likedProducts = null
          ..phone = phone
          ..phoneNumber = phoneNumber
          ..type = type
          ..liveOrders = null
          ..recentlyViewed = null
          ..itemsInCart = itemsInCart
          ..areNewNotifications = areNewNotifications
          ..likedStores = null
          ..likedBrands = null
          ..occupation = occupation
          ..businessModel = businessModel));
