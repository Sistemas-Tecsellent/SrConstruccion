// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkouts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheckoutsRecord> _$checkoutsRecordSerializer =
    new _$CheckoutsRecordSerializer();

class _$CheckoutsRecordSerializer
    implements StructuredSerializer<CheckoutsRecord> {
  @override
  final Iterable<Type> types = const [CheckoutsRecord, _$CheckoutsRecord];
  @override
  final String wireName = 'CheckoutsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CheckoutsRecord object,
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
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMethod;
    if (value != null) {
      result
        ..add('paymentMethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shipmentTotal;
    if (value != null) {
      result
        ..add('shipmentTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalInCents;
    if (value != null) {
      result
        ..add('totalInCents')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ordersAmount;
    if (value != null) {
      result
        ..add('ordersAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.expressProducts;
    if (value != null) {
      result
        ..add('expressProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.normalProducts;
    if (value != null) {
      result
        ..add('normalProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pendingShipmentPrice;
    if (value != null) {
      result
        ..add('pendingShipmentPrice')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deliveryDate;
    if (value != null) {
      result
        ..add('deliveryDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hadPricingRequest;
    if (value != null) {
      result
        ..add('hadPricingRequest')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  CheckoutsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckoutsRecordBuilder();

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
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentMethod':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipmentTotal':
          result.shipmentTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'totalInCents':
          result.totalInCents = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ordersAmount':
          result.ordersAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'expressProducts':
          result.expressProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'normalProducts':
          result.normalProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pendingShipmentPrice':
          result.pendingShipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deliveryDate':
          result.deliveryDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hadPricingRequest':
          result.hadPricingRequest = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$CheckoutsRecord extends CheckoutsRecord {
  @override
  final String id;
  @override
  final String message;
  @override
  final String paymentMethod;
  @override
  final double shipmentTotal;
  @override
  final double subtotal;
  @override
  final double total;
  @override
  final int totalInCents;
  @override
  final int ordersAmount;
  @override
  final int expressProducts;
  @override
  final int normalProducts;
  @override
  final bool pendingShipmentPrice;
  @override
  final String deliveryDate;
  @override
  final bool hadPricingRequest;
  @override
  final DocumentReference<Object> reference;

  factory _$CheckoutsRecord([void Function(CheckoutsRecordBuilder) updates]) =>
      (new CheckoutsRecordBuilder()..update(updates)).build();

  _$CheckoutsRecord._(
      {this.id,
      this.message,
      this.paymentMethod,
      this.shipmentTotal,
      this.subtotal,
      this.total,
      this.totalInCents,
      this.ordersAmount,
      this.expressProducts,
      this.normalProducts,
      this.pendingShipmentPrice,
      this.deliveryDate,
      this.hadPricingRequest,
      this.reference})
      : super._();

  @override
  CheckoutsRecord rebuild(void Function(CheckoutsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutsRecordBuilder toBuilder() =>
      new CheckoutsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutsRecord &&
        id == other.id &&
        message == other.message &&
        paymentMethod == other.paymentMethod &&
        shipmentTotal == other.shipmentTotal &&
        subtotal == other.subtotal &&
        total == other.total &&
        totalInCents == other.totalInCents &&
        ordersAmount == other.ordersAmount &&
        expressProducts == other.expressProducts &&
        normalProducts == other.normalProducts &&
        pendingShipmentPrice == other.pendingShipmentPrice &&
        deliveryDate == other.deliveryDate &&
        hadPricingRequest == other.hadPricingRequest &&
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
                                                    $jc($jc(0, id.hashCode),
                                                        message.hashCode),
                                                    paymentMethod.hashCode),
                                                shipmentTotal.hashCode),
                                            subtotal.hashCode),
                                        total.hashCode),
                                    totalInCents.hashCode),
                                ordersAmount.hashCode),
                            expressProducts.hashCode),
                        normalProducts.hashCode),
                    pendingShipmentPrice.hashCode),
                deliveryDate.hashCode),
            hadPricingRequest.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CheckoutsRecord')
          ..add('id', id)
          ..add('message', message)
          ..add('paymentMethod', paymentMethod)
          ..add('shipmentTotal', shipmentTotal)
          ..add('subtotal', subtotal)
          ..add('total', total)
          ..add('totalInCents', totalInCents)
          ..add('ordersAmount', ordersAmount)
          ..add('expressProducts', expressProducts)
          ..add('normalProducts', normalProducts)
          ..add('pendingShipmentPrice', pendingShipmentPrice)
          ..add('deliveryDate', deliveryDate)
          ..add('hadPricingRequest', hadPricingRequest)
          ..add('reference', reference))
        .toString();
  }
}

class CheckoutsRecordBuilder
    implements Builder<CheckoutsRecord, CheckoutsRecordBuilder> {
  _$CheckoutsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _paymentMethod;
  String get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  double _shipmentTotal;
  double get shipmentTotal => _$this._shipmentTotal;
  set shipmentTotal(double shipmentTotal) =>
      _$this._shipmentTotal = shipmentTotal;

  double _subtotal;
  double get subtotal => _$this._subtotal;
  set subtotal(double subtotal) => _$this._subtotal = subtotal;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  int _totalInCents;
  int get totalInCents => _$this._totalInCents;
  set totalInCents(int totalInCents) => _$this._totalInCents = totalInCents;

  int _ordersAmount;
  int get ordersAmount => _$this._ordersAmount;
  set ordersAmount(int ordersAmount) => _$this._ordersAmount = ordersAmount;

  int _expressProducts;
  int get expressProducts => _$this._expressProducts;
  set expressProducts(int expressProducts) =>
      _$this._expressProducts = expressProducts;

  int _normalProducts;
  int get normalProducts => _$this._normalProducts;
  set normalProducts(int normalProducts) =>
      _$this._normalProducts = normalProducts;

  bool _pendingShipmentPrice;
  bool get pendingShipmentPrice => _$this._pendingShipmentPrice;
  set pendingShipmentPrice(bool pendingShipmentPrice) =>
      _$this._pendingShipmentPrice = pendingShipmentPrice;

  String _deliveryDate;
  String get deliveryDate => _$this._deliveryDate;
  set deliveryDate(String deliveryDate) => _$this._deliveryDate = deliveryDate;

  bool _hadPricingRequest;
  bool get hadPricingRequest => _$this._hadPricingRequest;
  set hadPricingRequest(bool hadPricingRequest) =>
      _$this._hadPricingRequest = hadPricingRequest;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CheckoutsRecordBuilder() {
    CheckoutsRecord._initializeBuilder(this);
  }

  CheckoutsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _message = $v.message;
      _paymentMethod = $v.paymentMethod;
      _shipmentTotal = $v.shipmentTotal;
      _subtotal = $v.subtotal;
      _total = $v.total;
      _totalInCents = $v.totalInCents;
      _ordersAmount = $v.ordersAmount;
      _expressProducts = $v.expressProducts;
      _normalProducts = $v.normalProducts;
      _pendingShipmentPrice = $v.pendingShipmentPrice;
      _deliveryDate = $v.deliveryDate;
      _hadPricingRequest = $v.hadPricingRequest;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckoutsRecord;
  }

  @override
  void update(void Function(CheckoutsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckoutsRecord build() {
    final _$result = _$v ??
        new _$CheckoutsRecord._(
            id: id,
            message: message,
            paymentMethod: paymentMethod,
            shipmentTotal: shipmentTotal,
            subtotal: subtotal,
            total: total,
            totalInCents: totalInCents,
            ordersAmount: ordersAmount,
            expressProducts: expressProducts,
            normalProducts: normalProducts,
            pendingShipmentPrice: pendingShipmentPrice,
            deliveryDate: deliveryDate,
            hadPricingRequest: hadPricingRequest,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
