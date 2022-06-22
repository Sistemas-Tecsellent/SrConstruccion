// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variants_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VariantsRecord> _$variantsRecordSerializer =
    new _$VariantsRecordSerializer();

class _$VariantsRecordSerializer
    implements StructuredSerializer<VariantsRecord> {
  @override
  final Iterable<Type> types = const [VariantsRecord, _$VariantsRecord];
  @override
  final String wireName = 'VariantsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, VariantsRecord object,
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
    value = object.parentId;
    if (value != null) {
      result
        ..add('parentId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.box;
    if (value != null) {
      result
        ..add('box')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.coupon;
    if (value != null) {
      result
        ..add('coupon')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discount1;
    if (value != null) {
      result
        ..add('discount1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discount2;
    if (value != null) {
      result
        ..add('discount2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discount3;
    if (value != null) {
      result
        ..add('discount3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discountRange1;
    if (value != null) {
      result
        ..add('discountRange1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.discountRange2;
    if (value != null) {
      result
        ..add('discountRange2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.discountRange3;
    if (value != null) {
      result
        ..add('discountRange3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.master;
    if (value != null) {
      result
        ..add('master')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.megaWholesalePrice;
    if (value != null) {
      result
        ..add('megaWholesalePrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minimumPrice;
    if (value != null) {
      result
        ..add('minimumPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.publicPrice;
    if (value != null) {
      result
        ..add('publicPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.unit;
    if (value != null) {
      result
        ..add('unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.wholesalePrice;
    if (value != null) {
      result
        ..add('wholesalePrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  VariantsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VariantsRecordBuilder();

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
        case 'parentId':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'box':
          result.box = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'coupon':
          result.coupon.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'discount':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'discount1':
          result.discount1 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'discount2':
          result.discount2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'discount3':
          result.discount3 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'discountRange1':
          result.discountRange1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'discountRange2':
          result.discountRange2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'discountRange3':
          result.discountRange3 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'master':
          result.master = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'megaWholesalePrice':
          result.megaWholesalePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'minimumPrice':
          result.minimumPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'publicPrice':
          result.publicPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'wholesalePrice':
          result.wholesalePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$VariantsRecord extends VariantsRecord {
  @override
  final String id;
  @override
  final String parentId;
  @override
  final int box;
  @override
  final BuiltList<String> coupon;
  @override
  final String details;
  @override
  final double discount;
  @override
  final double discount1;
  @override
  final double discount2;
  @override
  final double discount3;
  @override
  final int discountRange1;
  @override
  final int discountRange2;
  @override
  final int discountRange3;
  @override
  final String location;
  @override
  final int master;
  @override
  final double megaWholesalePrice;
  @override
  final double minimumPrice;
  @override
  final double publicPrice;
  @override
  final BuiltList<String> tags;
  @override
  final String unit;
  @override
  final int weight;
  @override
  final double wholesalePrice;
  @override
  final DocumentReference<Object> reference;

  factory _$VariantsRecord([void Function(VariantsRecordBuilder) updates]) =>
      (new VariantsRecordBuilder()..update(updates)).build();

  _$VariantsRecord._(
      {this.id,
      this.parentId,
      this.box,
      this.coupon,
      this.details,
      this.discount,
      this.discount1,
      this.discount2,
      this.discount3,
      this.discountRange1,
      this.discountRange2,
      this.discountRange3,
      this.location,
      this.master,
      this.megaWholesalePrice,
      this.minimumPrice,
      this.publicPrice,
      this.tags,
      this.unit,
      this.weight,
      this.wholesalePrice,
      this.reference})
      : super._();

  @override
  VariantsRecord rebuild(void Function(VariantsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VariantsRecordBuilder toBuilder() =>
      new VariantsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VariantsRecord &&
        id == other.id &&
        parentId == other.parentId &&
        box == other.box &&
        coupon == other.coupon &&
        details == other.details &&
        discount == other.discount &&
        discount1 == other.discount1 &&
        discount2 == other.discount2 &&
        discount3 == other.discount3 &&
        discountRange1 == other.discountRange1 &&
        discountRange2 == other.discountRange2 &&
        discountRange3 == other.discountRange3 &&
        location == other.location &&
        master == other.master &&
        megaWholesalePrice == other.megaWholesalePrice &&
        minimumPrice == other.minimumPrice &&
        publicPrice == other.publicPrice &&
        tags == other.tags &&
        unit == other.unit &&
        weight == other.weight &&
        wholesalePrice == other.wholesalePrice &&
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
                                                                            $jc($jc($jc($jc(0, id.hashCode), parentId.hashCode), box.hashCode),
                                                                                coupon.hashCode),
                                                                            details.hashCode),
                                                                        discount.hashCode),
                                                                    discount1.hashCode),
                                                                discount2.hashCode),
                                                            discount3.hashCode),
                                                        discountRange1.hashCode),
                                                    discountRange2.hashCode),
                                                discountRange3.hashCode),
                                            location.hashCode),
                                        master.hashCode),
                                    megaWholesalePrice.hashCode),
                                minimumPrice.hashCode),
                            publicPrice.hashCode),
                        tags.hashCode),
                    unit.hashCode),
                weight.hashCode),
            wholesalePrice.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VariantsRecord')
          ..add('id', id)
          ..add('parentId', parentId)
          ..add('box', box)
          ..add('coupon', coupon)
          ..add('details', details)
          ..add('discount', discount)
          ..add('discount1', discount1)
          ..add('discount2', discount2)
          ..add('discount3', discount3)
          ..add('discountRange1', discountRange1)
          ..add('discountRange2', discountRange2)
          ..add('discountRange3', discountRange3)
          ..add('location', location)
          ..add('master', master)
          ..add('megaWholesalePrice', megaWholesalePrice)
          ..add('minimumPrice', minimumPrice)
          ..add('publicPrice', publicPrice)
          ..add('tags', tags)
          ..add('unit', unit)
          ..add('weight', weight)
          ..add('wholesalePrice', wholesalePrice)
          ..add('reference', reference))
        .toString();
  }
}

class VariantsRecordBuilder
    implements Builder<VariantsRecord, VariantsRecordBuilder> {
  _$VariantsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _parentId;
  String get parentId => _$this._parentId;
  set parentId(String parentId) => _$this._parentId = parentId;

  int _box;
  int get box => _$this._box;
  set box(int box) => _$this._box = box;

  ListBuilder<String> _coupon;
  ListBuilder<String> get coupon =>
      _$this._coupon ??= new ListBuilder<String>();
  set coupon(ListBuilder<String> coupon) => _$this._coupon = coupon;

  String _details;
  String get details => _$this._details;
  set details(String details) => _$this._details = details;

  double _discount;
  double get discount => _$this._discount;
  set discount(double discount) => _$this._discount = discount;

  double _discount1;
  double get discount1 => _$this._discount1;
  set discount1(double discount1) => _$this._discount1 = discount1;

  double _discount2;
  double get discount2 => _$this._discount2;
  set discount2(double discount2) => _$this._discount2 = discount2;

  double _discount3;
  double get discount3 => _$this._discount3;
  set discount3(double discount3) => _$this._discount3 = discount3;

  int _discountRange1;
  int get discountRange1 => _$this._discountRange1;
  set discountRange1(int discountRange1) =>
      _$this._discountRange1 = discountRange1;

  int _discountRange2;
  int get discountRange2 => _$this._discountRange2;
  set discountRange2(int discountRange2) =>
      _$this._discountRange2 = discountRange2;

  int _discountRange3;
  int get discountRange3 => _$this._discountRange3;
  set discountRange3(int discountRange3) =>
      _$this._discountRange3 = discountRange3;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  int _master;
  int get master => _$this._master;
  set master(int master) => _$this._master = master;

  double _megaWholesalePrice;
  double get megaWholesalePrice => _$this._megaWholesalePrice;
  set megaWholesalePrice(double megaWholesalePrice) =>
      _$this._megaWholesalePrice = megaWholesalePrice;

  double _minimumPrice;
  double get minimumPrice => _$this._minimumPrice;
  set minimumPrice(double minimumPrice) => _$this._minimumPrice = minimumPrice;

  double _publicPrice;
  double get publicPrice => _$this._publicPrice;
  set publicPrice(double publicPrice) => _$this._publicPrice = publicPrice;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  String _unit;
  String get unit => _$this._unit;
  set unit(String unit) => _$this._unit = unit;

  int _weight;
  int get weight => _$this._weight;
  set weight(int weight) => _$this._weight = weight;

  double _wholesalePrice;
  double get wholesalePrice => _$this._wholesalePrice;
  set wholesalePrice(double wholesalePrice) =>
      _$this._wholesalePrice = wholesalePrice;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  VariantsRecordBuilder() {
    VariantsRecord._initializeBuilder(this);
  }

  VariantsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _parentId = $v.parentId;
      _box = $v.box;
      _coupon = $v.coupon?.toBuilder();
      _details = $v.details;
      _discount = $v.discount;
      _discount1 = $v.discount1;
      _discount2 = $v.discount2;
      _discount3 = $v.discount3;
      _discountRange1 = $v.discountRange1;
      _discountRange2 = $v.discountRange2;
      _discountRange3 = $v.discountRange3;
      _location = $v.location;
      _master = $v.master;
      _megaWholesalePrice = $v.megaWholesalePrice;
      _minimumPrice = $v.minimumPrice;
      _publicPrice = $v.publicPrice;
      _tags = $v.tags?.toBuilder();
      _unit = $v.unit;
      _weight = $v.weight;
      _wholesalePrice = $v.wholesalePrice;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VariantsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VariantsRecord;
  }

  @override
  void update(void Function(VariantsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VariantsRecord build() {
    _$VariantsRecord _$result;
    try {
      _$result = _$v ??
          new _$VariantsRecord._(
              id: id,
              parentId: parentId,
              box: box,
              coupon: _coupon?.build(),
              details: details,
              discount: discount,
              discount1: discount1,
              discount2: discount2,
              discount3: discount3,
              discountRange1: discountRange1,
              discountRange2: discountRange2,
              discountRange3: discountRange3,
              location: location,
              master: master,
              megaWholesalePrice: megaWholesalePrice,
              minimumPrice: minimumPrice,
              publicPrice: publicPrice,
              tags: _tags?.build(),
              unit: unit,
              weight: weight,
              wholesalePrice: wholesalePrice,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'coupon';
        _coupon?.build();

        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VariantsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
