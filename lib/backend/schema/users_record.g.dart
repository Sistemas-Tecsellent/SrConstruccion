// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likedProducts;
    if (value != null) {
      result
        ..add('liked_products')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.liveOrders;
    if (value != null) {
      result
        ..add('liveOrders')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.recentlyViewed;
    if (value != null) {
      result
        ..add('recentlyViewed')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.itemsInCart;
    if (value != null) {
      result
        ..add('itemsInCart')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.areNewNotifications;
    if (value != null) {
      result
        ..add('areNewNotifications')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.likedStores;
    if (value != null) {
      result
        ..add('liked_stores')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.likedBrands;
    if (value != null) {
      result
        ..add('liked_brands')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.occupation;
    if (value != null) {
      result
        ..add('occupation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.businessModel;
    if (value != null) {
      result
        ..add('businessModel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'liked_products':
          result.likedProducts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liveOrders':
          result.liveOrders.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'recentlyViewed':
          result.recentlyViewed.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'itemsInCart':
          result.itemsInCart = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'areNewNotifications':
          result.areNewNotifications = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'liked_stores':
          result.likedStores.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'liked_brands':
          result.likedBrands.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'occupation':
          result.occupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'businessModel':
          result.businessModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final BuiltList<String> likedProducts;
  @override
  final String phone;
  @override
  final String phoneNumber;
  @override
  final String type;
  @override
  final BuiltList<String> liveOrders;
  @override
  final BuiltList<String> recentlyViewed;
  @override
  final int itemsInCart;
  @override
  final bool areNewNotifications;
  @override
  final BuiltList<String> likedStores;
  @override
  final BuiltList<String> likedBrands;
  @override
  final String occupation;
  @override
  final String businessModel;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.likedProducts,
      this.phone,
      this.phoneNumber,
      this.type,
      this.liveOrders,
      this.recentlyViewed,
      this.itemsInCart,
      this.areNewNotifications,
      this.likedStores,
      this.likedBrands,
      this.occupation,
      this.businessModel,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        likedProducts == other.likedProducts &&
        phone == other.phone &&
        phoneNumber == other.phoneNumber &&
        type == other.type &&
        liveOrders == other.liveOrders &&
        recentlyViewed == other.recentlyViewed &&
        itemsInCart == other.itemsInCart &&
        areNewNotifications == other.areNewNotifications &&
        likedStores == other.likedStores &&
        likedBrands == other.likedBrands &&
        occupation == other.occupation &&
        businessModel == other.businessModel &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            email
                                                                                .hashCode),
                                                                        displayName
                                                                            .hashCode),
                                                                    photoUrl
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            createdTime
                                                                .hashCode),
                                                        likedProducts.hashCode),
                                                    phone.hashCode),
                                                phoneNumber.hashCode),
                                            type.hashCode),
                                        liveOrders.hashCode),
                                    recentlyViewed.hashCode),
                                itemsInCart.hashCode),
                            areNewNotifications.hashCode),
                        likedStores.hashCode),
                    likedBrands.hashCode),
                occupation.hashCode),
            businessModel.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('likedProducts', likedProducts)
          ..add('phone', phone)
          ..add('phoneNumber', phoneNumber)
          ..add('type', type)
          ..add('liveOrders', liveOrders)
          ..add('recentlyViewed', recentlyViewed)
          ..add('itemsInCart', itemsInCart)
          ..add('areNewNotifications', areNewNotifications)
          ..add('likedStores', likedStores)
          ..add('likedBrands', likedBrands)
          ..add('occupation', occupation)
          ..add('businessModel', businessModel)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  ListBuilder<String> _likedProducts;
  ListBuilder<String> get likedProducts =>
      _$this._likedProducts ??= new ListBuilder<String>();
  set likedProducts(ListBuilder<String> likedProducts) =>
      _$this._likedProducts = likedProducts;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  ListBuilder<String> _liveOrders;
  ListBuilder<String> get liveOrders =>
      _$this._liveOrders ??= new ListBuilder<String>();
  set liveOrders(ListBuilder<String> liveOrders) =>
      _$this._liveOrders = liveOrders;

  ListBuilder<String> _recentlyViewed;
  ListBuilder<String> get recentlyViewed =>
      _$this._recentlyViewed ??= new ListBuilder<String>();
  set recentlyViewed(ListBuilder<String> recentlyViewed) =>
      _$this._recentlyViewed = recentlyViewed;

  int _itemsInCart;
  int get itemsInCart => _$this._itemsInCart;
  set itemsInCart(int itemsInCart) => _$this._itemsInCart = itemsInCart;

  bool _areNewNotifications;
  bool get areNewNotifications => _$this._areNewNotifications;
  set areNewNotifications(bool areNewNotifications) =>
      _$this._areNewNotifications = areNewNotifications;

  ListBuilder<String> _likedStores;
  ListBuilder<String> get likedStores =>
      _$this._likedStores ??= new ListBuilder<String>();
  set likedStores(ListBuilder<String> likedStores) =>
      _$this._likedStores = likedStores;

  ListBuilder<String> _likedBrands;
  ListBuilder<String> get likedBrands =>
      _$this._likedBrands ??= new ListBuilder<String>();
  set likedBrands(ListBuilder<String> likedBrands) =>
      _$this._likedBrands = likedBrands;

  String _occupation;
  String get occupation => _$this._occupation;
  set occupation(String occupation) => _$this._occupation = occupation;

  String _businessModel;
  String get businessModel => _$this._businessModel;
  set businessModel(String businessModel) =>
      _$this._businessModel = businessModel;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _likedProducts = $v.likedProducts?.toBuilder();
      _phone = $v.phone;
      _phoneNumber = $v.phoneNumber;
      _type = $v.type;
      _liveOrders = $v.liveOrders?.toBuilder();
      _recentlyViewed = $v.recentlyViewed?.toBuilder();
      _itemsInCart = $v.itemsInCart;
      _areNewNotifications = $v.areNewNotifications;
      _likedStores = $v.likedStores?.toBuilder();
      _likedBrands = $v.likedBrands?.toBuilder();
      _occupation = $v.occupation;
      _businessModel = $v.businessModel;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              likedProducts: _likedProducts?.build(),
              phone: phone,
              phoneNumber: phoneNumber,
              type: type,
              liveOrders: _liveOrders?.build(),
              recentlyViewed: _recentlyViewed?.build(),
              itemsInCart: itemsInCart,
              areNewNotifications: areNewNotifications,
              likedStores: _likedStores?.build(),
              likedBrands: _likedBrands?.build(),
              occupation: occupation,
              businessModel: businessModel,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedProducts';
        _likedProducts?.build();

        _$failedField = 'liveOrders';
        _liveOrders?.build();
        _$failedField = 'recentlyViewed';
        _recentlyViewed?.build();

        _$failedField = 'likedStores';
        _likedStores?.build();
        _$failedField = 'likedBrands';
        _likedBrands?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
