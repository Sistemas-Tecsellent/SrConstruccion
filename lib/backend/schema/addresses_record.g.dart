// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressesRecord> _$addressesRecordSerializer =
    new _$AddressesRecordSerializer();

class _$AddressesRecordSerializer
    implements StructuredSerializer<AddressesRecord> {
  @override
  final Iterable<Type> types = const [AddressesRecord, _$AddressesRecord];
  @override
  final String wireName = 'AddressesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AddressesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.addressLine1;
    if (value != null) {
      result
        ..add('addressLine1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mapLocation;
    if (value != null) {
      result
        ..add('mapLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postalCode;
    if (value != null) {
      result
        ..add('postalCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.suburb;
    if (value != null) {
      result
        ..add('suburb')
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
  AddressesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'addressLine1':
          result.addressLine1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mapLocation':
          result.mapLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postalCode':
          result.postalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'suburb':
          result.suburb = serializers.deserialize(value,
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

class _$AddressesRecord extends AddressesRecord {
  @override
  final String addressLine1;
  @override
  final String city;
  @override
  final String country;
  @override
  final String id;
  @override
  final LatLng mapLocation;
  @override
  final String name;
  @override
  final String postalCode;
  @override
  final String state;
  @override
  final String suburb;
  @override
  final DocumentReference<Object> reference;

  factory _$AddressesRecord([void Function(AddressesRecordBuilder) updates]) =>
      (new AddressesRecordBuilder()..update(updates)).build();

  _$AddressesRecord._(
      {this.addressLine1,
      this.city,
      this.country,
      this.id,
      this.mapLocation,
      this.name,
      this.postalCode,
      this.state,
      this.suburb,
      this.reference})
      : super._();

  @override
  AddressesRecord rebuild(void Function(AddressesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressesRecordBuilder toBuilder() =>
      new AddressesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressesRecord &&
        addressLine1 == other.addressLine1 &&
        city == other.city &&
        country == other.country &&
        id == other.id &&
        mapLocation == other.mapLocation &&
        name == other.name &&
        postalCode == other.postalCode &&
        state == other.state &&
        suburb == other.suburb &&
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
                                    $jc($jc(0, addressLine1.hashCode),
                                        city.hashCode),
                                    country.hashCode),
                                id.hashCode),
                            mapLocation.hashCode),
                        name.hashCode),
                    postalCode.hashCode),
                state.hashCode),
            suburb.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddressesRecord')
          ..add('addressLine1', addressLine1)
          ..add('city', city)
          ..add('country', country)
          ..add('id', id)
          ..add('mapLocation', mapLocation)
          ..add('name', name)
          ..add('postalCode', postalCode)
          ..add('state', state)
          ..add('suburb', suburb)
          ..add('reference', reference))
        .toString();
  }
}

class AddressesRecordBuilder
    implements Builder<AddressesRecord, AddressesRecordBuilder> {
  _$AddressesRecord _$v;

  String _addressLine1;
  String get addressLine1 => _$this._addressLine1;
  set addressLine1(String addressLine1) => _$this._addressLine1 = addressLine1;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  LatLng _mapLocation;
  LatLng get mapLocation => _$this._mapLocation;
  set mapLocation(LatLng mapLocation) => _$this._mapLocation = mapLocation;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _postalCode;
  String get postalCode => _$this._postalCode;
  set postalCode(String postalCode) => _$this._postalCode = postalCode;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _suburb;
  String get suburb => _$this._suburb;
  set suburb(String suburb) => _$this._suburb = suburb;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AddressesRecordBuilder() {
    AddressesRecord._initializeBuilder(this);
  }

  AddressesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressLine1 = $v.addressLine1;
      _city = $v.city;
      _country = $v.country;
      _id = $v.id;
      _mapLocation = $v.mapLocation;
      _name = $v.name;
      _postalCode = $v.postalCode;
      _state = $v.state;
      _suburb = $v.suburb;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressesRecord;
  }

  @override
  void update(void Function(AddressesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddressesRecord build() {
    final _$result = _$v ??
        new _$AddressesRecord._(
            addressLine1: addressLine1,
            city: city,
            country: country,
            id: id,
            mapLocation: mapLocation,
            name: name,
            postalCode: postalCode,
            state: state,
            suburb: suburb,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
