// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverers_location_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeliverersLocationRecord> _$deliverersLocationRecordSerializer =
    new _$DeliverersLocationRecordSerializer();

class _$DeliverersLocationRecordSerializer
    implements StructuredSerializer<DeliverersLocationRecord> {
  @override
  final Iterable<Type> types = const [
    DeliverersLocationRecord,
    _$DeliverersLocationRecord
  ];
  @override
  final String wireName = 'DeliverersLocationRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeliverersLocationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.orderOwner;
    if (value != null) {
      result
        ..add('orderOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.orderForClientId;
    if (value != null) {
      result
        ..add('orderForClientId')
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
  DeliverersLocationRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliverersLocationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'orderOwner':
          result.orderOwner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'orderForClientId':
          result.orderForClientId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
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

class _$DeliverersLocationRecord extends DeliverersLocationRecord {
  @override
  final String orderOwner;
  @override
  final String order;
  @override
  final LatLng location;
  @override
  final String orderForClientId;
  @override
  final String id;
  @override
  final DocumentReference<Object> reference;

  factory _$DeliverersLocationRecord(
          [void Function(DeliverersLocationRecordBuilder) updates]) =>
      (new DeliverersLocationRecordBuilder()..update(updates)).build();

  _$DeliverersLocationRecord._(
      {this.orderOwner,
      this.order,
      this.location,
      this.orderForClientId,
      this.id,
      this.reference})
      : super._();

  @override
  DeliverersLocationRecord rebuild(
          void Function(DeliverersLocationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliverersLocationRecordBuilder toBuilder() =>
      new DeliverersLocationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliverersLocationRecord &&
        orderOwner == other.orderOwner &&
        order == other.order &&
        location == other.location &&
        orderForClientId == other.orderForClientId &&
        id == other.id &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, orderOwner.hashCode), order.hashCode),
                    location.hashCode),
                orderForClientId.hashCode),
            id.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeliverersLocationRecord')
          ..add('orderOwner', orderOwner)
          ..add('order', order)
          ..add('location', location)
          ..add('orderForClientId', orderForClientId)
          ..add('id', id)
          ..add('reference', reference))
        .toString();
  }
}

class DeliverersLocationRecordBuilder
    implements
        Builder<DeliverersLocationRecord, DeliverersLocationRecordBuilder> {
  _$DeliverersLocationRecord _$v;

  String _orderOwner;
  String get orderOwner => _$this._orderOwner;
  set orderOwner(String orderOwner) => _$this._orderOwner = orderOwner;

  String _order;
  String get order => _$this._order;
  set order(String order) => _$this._order = order;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  String _orderForClientId;
  String get orderForClientId => _$this._orderForClientId;
  set orderForClientId(String orderForClientId) =>
      _$this._orderForClientId = orderForClientId;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DeliverersLocationRecordBuilder() {
    DeliverersLocationRecord._initializeBuilder(this);
  }

  DeliverersLocationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderOwner = $v.orderOwner;
      _order = $v.order;
      _location = $v.location;
      _orderForClientId = $v.orderForClientId;
      _id = $v.id;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeliverersLocationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeliverersLocationRecord;
  }

  @override
  void update(void Function(DeliverersLocationRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeliverersLocationRecord build() {
    final _$result = _$v ??
        new _$DeliverersLocationRecord._(
            orderOwner: orderOwner,
            order: order,
            location: location,
            orderForClientId: orderForClientId,
            id: id,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
