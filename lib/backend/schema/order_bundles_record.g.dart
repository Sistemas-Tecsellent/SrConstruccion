// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bundles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderBundlesRecord> _$orderBundlesRecordSerializer =
    new _$OrderBundlesRecordSerializer();

class _$OrderBundlesRecordSerializer
    implements StructuredSerializer<OrderBundlesRecord> {
  @override
  final Iterable<Type> types = const [OrderBundlesRecord, _$OrderBundlesRecord];
  @override
  final String wireName = 'OrderBundlesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderBundlesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expressStatus;
    if (value != null) {
      result
        ..add('expressStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.normalStatus;
    if (value != null) {
      result
        ..add('normalStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleTotal;
    if (value != null) {
      result
        ..add('bundleTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleSubtotal;
    if (value != null) {
      result
        ..add('bundleSubtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleShipmentPrice;
    if (value != null) {
      result
        ..add('bundleShipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerAddress;
    if (value != null) {
      result
        ..add('customerAddress')
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
  OrderBundlesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderBundlesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expressStatus':
          result.expressStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'normalStatus':
          result.normalStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleTotal':
          result.bundleTotal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleSubtotal':
          result.bundleSubtotal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleShipmentPrice':
          result.bundleShipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerAddress':
          result.customerAddress = serializers.deserialize(value,
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

class _$OrderBundlesRecord extends OrderBundlesRecord {
  @override
  final String owner;
  @override
  final String id;
  @override
  final String status;
  @override
  final DateTime createdDate;
  @override
  final String code;
  @override
  final String expressStatus;
  @override
  final String normalStatus;
  @override
  final String bundleTotal;
  @override
  final String bundleSubtotal;
  @override
  final String bundleShipmentPrice;
  @override
  final String customerAddress;
  @override
  final DocumentReference<Object> reference;

  factory _$OrderBundlesRecord(
          [void Function(OrderBundlesRecordBuilder) updates]) =>
      (new OrderBundlesRecordBuilder()..update(updates)).build();

  _$OrderBundlesRecord._(
      {this.owner,
      this.id,
      this.status,
      this.createdDate,
      this.code,
      this.expressStatus,
      this.normalStatus,
      this.bundleTotal,
      this.bundleSubtotal,
      this.bundleShipmentPrice,
      this.customerAddress,
      this.reference})
      : super._();

  @override
  OrderBundlesRecord rebuild(
          void Function(OrderBundlesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBundlesRecordBuilder toBuilder() =>
      new OrderBundlesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderBundlesRecord &&
        owner == other.owner &&
        id == other.id &&
        status == other.status &&
        createdDate == other.createdDate &&
        code == other.code &&
        expressStatus == other.expressStatus &&
        normalStatus == other.normalStatus &&
        bundleTotal == other.bundleTotal &&
        bundleSubtotal == other.bundleSubtotal &&
        bundleShipmentPrice == other.bundleShipmentPrice &&
        customerAddress == other.customerAddress &&
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
                                            $jc($jc(0, owner.hashCode),
                                                id.hashCode),
                                            status.hashCode),
                                        createdDate.hashCode),
                                    code.hashCode),
                                expressStatus.hashCode),
                            normalStatus.hashCode),
                        bundleTotal.hashCode),
                    bundleSubtotal.hashCode),
                bundleShipmentPrice.hashCode),
            customerAddress.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderBundlesRecord')
          ..add('owner', owner)
          ..add('id', id)
          ..add('status', status)
          ..add('createdDate', createdDate)
          ..add('code', code)
          ..add('expressStatus', expressStatus)
          ..add('normalStatus', normalStatus)
          ..add('bundleTotal', bundleTotal)
          ..add('bundleSubtotal', bundleSubtotal)
          ..add('bundleShipmentPrice', bundleShipmentPrice)
          ..add('customerAddress', customerAddress)
          ..add('reference', reference))
        .toString();
  }
}

class OrderBundlesRecordBuilder
    implements Builder<OrderBundlesRecord, OrderBundlesRecordBuilder> {
  _$OrderBundlesRecord _$v;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _expressStatus;
  String get expressStatus => _$this._expressStatus;
  set expressStatus(String expressStatus) =>
      _$this._expressStatus = expressStatus;

  String _normalStatus;
  String get normalStatus => _$this._normalStatus;
  set normalStatus(String normalStatus) => _$this._normalStatus = normalStatus;

  String _bundleTotal;
  String get bundleTotal => _$this._bundleTotal;
  set bundleTotal(String bundleTotal) => _$this._bundleTotal = bundleTotal;

  String _bundleSubtotal;
  String get bundleSubtotal => _$this._bundleSubtotal;
  set bundleSubtotal(String bundleSubtotal) =>
      _$this._bundleSubtotal = bundleSubtotal;

  String _bundleShipmentPrice;
  String get bundleShipmentPrice => _$this._bundleShipmentPrice;
  set bundleShipmentPrice(String bundleShipmentPrice) =>
      _$this._bundleShipmentPrice = bundleShipmentPrice;

  String _customerAddress;
  String get customerAddress => _$this._customerAddress;
  set customerAddress(String customerAddress) =>
      _$this._customerAddress = customerAddress;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrderBundlesRecordBuilder() {
    OrderBundlesRecord._initializeBuilder(this);
  }

  OrderBundlesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _id = $v.id;
      _status = $v.status;
      _createdDate = $v.createdDate;
      _code = $v.code;
      _expressStatus = $v.expressStatus;
      _normalStatus = $v.normalStatus;
      _bundleTotal = $v.bundleTotal;
      _bundleSubtotal = $v.bundleSubtotal;
      _bundleShipmentPrice = $v.bundleShipmentPrice;
      _customerAddress = $v.customerAddress;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderBundlesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderBundlesRecord;
  }

  @override
  void update(void Function(OrderBundlesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderBundlesRecord build() {
    final _$result = _$v ??
        new _$OrderBundlesRecord._(
            owner: owner,
            id: id,
            status: status,
            createdDate: createdDate,
            code: code,
            expressStatus: expressStatus,
            normalStatus: normalStatus,
            bundleTotal: bundleTotal,
            bundleSubtotal: bundleSubtotal,
            bundleShipmentPrice: bundleShipmentPrice,
            customerAddress: customerAddress,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
