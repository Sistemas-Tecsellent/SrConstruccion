// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoresRecord> _$storesRecordSerializer =
    new _$StoresRecordSerializer();

class _$StoresRecordSerializer implements StructuredSerializer<StoresRecord> {
  @override
  final Iterable<Type> types = const [StoresRecord, _$StoresRecord];
  @override
  final String wireName = 'StoresRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StoresRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationCity;
    if (value != null) {
      result
        ..add('locationCity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.mapLocation;
    if (value != null) {
      result
        ..add('mapLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transports;
    if (value != null) {
      result
        ..add('transports')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  StoresRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoresRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locationCity':
          result.locationCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'mapLocation':
          result.mapLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transports':
          result.transports.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$StoresRecord extends StoresRecord {
  @override
  final String id;
  @override
  final String logo;
  @override
  final String banner;
  @override
  final String owner;
  @override
  final String name;
  @override
  final String location;
  @override
  final String locationCity;
  @override
  final BuiltList<String> categories;
  @override
  final LatLng mapLocation;
  @override
  final String address;
  @override
  final BuiltList<String> transports;
  @override
  final DocumentReference<Object> reference;

  factory _$StoresRecord([void Function(StoresRecordBuilder) updates]) =>
      (new StoresRecordBuilder()..update(updates)).build();

  _$StoresRecord._(
      {this.id,
      this.logo,
      this.banner,
      this.owner,
      this.name,
      this.location,
      this.locationCity,
      this.categories,
      this.mapLocation,
      this.address,
      this.transports,
      this.reference})
      : super._();

  @override
  StoresRecord rebuild(void Function(StoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoresRecordBuilder toBuilder() => new StoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoresRecord &&
        id == other.id &&
        logo == other.logo &&
        banner == other.banner &&
        owner == other.owner &&
        name == other.name &&
        location == other.location &&
        locationCity == other.locationCity &&
        categories == other.categories &&
        mapLocation == other.mapLocation &&
        address == other.address &&
        transports == other.transports &&
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
                                            $jc($jc(0, id.hashCode),
                                                logo.hashCode),
                                            banner.hashCode),
                                        owner.hashCode),
                                    name.hashCode),
                                location.hashCode),
                            locationCity.hashCode),
                        categories.hashCode),
                    mapLocation.hashCode),
                address.hashCode),
            transports.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StoresRecord')
          ..add('id', id)
          ..add('logo', logo)
          ..add('banner', banner)
          ..add('owner', owner)
          ..add('name', name)
          ..add('location', location)
          ..add('locationCity', locationCity)
          ..add('categories', categories)
          ..add('mapLocation', mapLocation)
          ..add('address', address)
          ..add('transports', transports)
          ..add('reference', reference))
        .toString();
  }
}

class StoresRecordBuilder
    implements Builder<StoresRecord, StoresRecordBuilder> {
  _$StoresRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _locationCity;
  String get locationCity => _$this._locationCity;
  set locationCity(String locationCity) => _$this._locationCity = locationCity;

  ListBuilder<String> _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String> categories) =>
      _$this._categories = categories;

  LatLng _mapLocation;
  LatLng get mapLocation => _$this._mapLocation;
  set mapLocation(LatLng mapLocation) => _$this._mapLocation = mapLocation;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  ListBuilder<String> _transports;
  ListBuilder<String> get transports =>
      _$this._transports ??= new ListBuilder<String>();
  set transports(ListBuilder<String> transports) =>
      _$this._transports = transports;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StoresRecordBuilder() {
    StoresRecord._initializeBuilder(this);
  }

  StoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _logo = $v.logo;
      _banner = $v.banner;
      _owner = $v.owner;
      _name = $v.name;
      _location = $v.location;
      _locationCity = $v.locationCity;
      _categories = $v.categories?.toBuilder();
      _mapLocation = $v.mapLocation;
      _address = $v.address;
      _transports = $v.transports?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoresRecord;
  }

  @override
  void update(void Function(StoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoresRecord build() {
    _$StoresRecord _$result;
    try {
      _$result = _$v ??
          new _$StoresRecord._(
              id: id,
              logo: logo,
              banner: banner,
              owner: owner,
              name: name,
              location: location,
              locationCity: locationCity,
              categories: _categories?.build(),
              mapLocation: mapLocation,
              address: address,
              transports: _transports?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'transports';
        _transports?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoresRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
