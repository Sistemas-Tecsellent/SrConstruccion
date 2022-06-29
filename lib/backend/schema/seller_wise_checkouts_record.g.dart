// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_wise_checkouts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SellerWiseCheckoutsRecord> _$sellerWiseCheckoutsRecordSerializer =
    new _$SellerWiseCheckoutsRecordSerializer();

class _$SellerWiseCheckoutsRecordSerializer
    implements StructuredSerializer<SellerWiseCheckoutsRecord> {
  @override
  final Iterable<Type> types = const [
    SellerWiseCheckoutsRecord,
    _$SellerWiseCheckoutsRecord
  ];
  @override
  final String wireName = 'SellerWiseCheckoutsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SellerWiseCheckoutsRecord object,
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
    value = object.ordersAmount;
    if (value != null) {
      result
        ..add('ordersAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.pickupInStoreProducts;
    if (value != null) {
      result
        ..add('pickupInStoreProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pendingShipmentPrice;
    if (value != null) {
      result
        ..add('pendingShipmentPrice')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deliverDate;
    if (value != null) {
      result
        ..add('deliverDate')
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
  SellerWiseCheckoutsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SellerWiseCheckoutsRecordBuilder();

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
        case 'ordersAmount':
          result.ordersAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'expressProducts':
          result.expressProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'normalProducts':
          result.normalProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pickupInStoreProducts':
          result.pickupInStoreProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pendingShipmentPrice':
          result.pendingShipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deliverDate':
          result.deliverDate = serializers.deserialize(value,
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

class _$SellerWiseCheckoutsRecord extends SellerWiseCheckoutsRecord {
  @override
  final String id;
  @override
  final String message;
  @override
  final int ordersAmount;
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
  final int expressProducts;
  @override
  final int normalProducts;
  @override
  final int pickupInStoreProducts;
  @override
  final bool pendingShipmentPrice;
  @override
  final String deliverDate;
  @override
  final DocumentReference<Object> reference;

  factory _$SellerWiseCheckoutsRecord(
          [void Function(SellerWiseCheckoutsRecordBuilder) updates]) =>
      (new SellerWiseCheckoutsRecordBuilder()..update(updates)).build();

  _$SellerWiseCheckoutsRecord._(
      {this.id,
      this.message,
      this.ordersAmount,
      this.paymentMethod,
      this.shipmentTotal,
      this.subtotal,
      this.total,
      this.totalInCents,
      this.expressProducts,
      this.normalProducts,
      this.pickupInStoreProducts,
      this.pendingShipmentPrice,
      this.deliverDate,
      this.reference})
      : super._();

  @override
  SellerWiseCheckoutsRecord rebuild(
          void Function(SellerWiseCheckoutsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SellerWiseCheckoutsRecordBuilder toBuilder() =>
      new SellerWiseCheckoutsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SellerWiseCheckoutsRecord &&
        id == other.id &&
        message == other.message &&
        ordersAmount == other.ordersAmount &&
        paymentMethod == other.paymentMethod &&
        shipmentTotal == other.shipmentTotal &&
        subtotal == other.subtotal &&
        total == other.total &&
        totalInCents == other.totalInCents &&
        expressProducts == other.expressProducts &&
        normalProducts == other.normalProducts &&
        pickupInStoreProducts == other.pickupInStoreProducts &&
        pendingShipmentPrice == other.pendingShipmentPrice &&
        deliverDate == other.deliverDate &&
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
                                                    ordersAmount.hashCode),
                                                paymentMethod.hashCode),
                                            shipmentTotal.hashCode),
                                        subtotal.hashCode),
                                    total.hashCode),
                                totalInCents.hashCode),
                            expressProducts.hashCode),
                        normalProducts.hashCode),
                    pickupInStoreProducts.hashCode),
                pendingShipmentPrice.hashCode),
            deliverDate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SellerWiseCheckoutsRecord')
          ..add('id', id)
          ..add('message', message)
          ..add('ordersAmount', ordersAmount)
          ..add('paymentMethod', paymentMethod)
          ..add('shipmentTotal', shipmentTotal)
          ..add('subtotal', subtotal)
          ..add('total', total)
          ..add('totalInCents', totalInCents)
          ..add('expressProducts', expressProducts)
          ..add('normalProducts', normalProducts)
          ..add('pickupInStoreProducts', pickupInStoreProducts)
          ..add('pendingShipmentPrice', pendingShipmentPrice)
          ..add('deliverDate', deliverDate)
          ..add('reference', reference))
        .toString();
  }
}

class SellerWiseCheckoutsRecordBuilder
    implements
        Builder<SellerWiseCheckoutsRecord, SellerWiseCheckoutsRecordBuilder> {
  _$SellerWiseCheckoutsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _ordersAmount;
  int get ordersAmount => _$this._ordersAmount;
  set ordersAmount(int ordersAmount) => _$this._ordersAmount = ordersAmount;

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

  int _expressProducts;
  int get expressProducts => _$this._expressProducts;
  set expressProducts(int expressProducts) =>
      _$this._expressProducts = expressProducts;

  int _normalProducts;
  int get normalProducts => _$this._normalProducts;
  set normalProducts(int normalProducts) =>
      _$this._normalProducts = normalProducts;

  int _pickupInStoreProducts;
  int get pickupInStoreProducts => _$this._pickupInStoreProducts;
  set pickupInStoreProducts(int pickupInStoreProducts) =>
      _$this._pickupInStoreProducts = pickupInStoreProducts;

  bool _pendingShipmentPrice;
  bool get pendingShipmentPrice => _$this._pendingShipmentPrice;
  set pendingShipmentPrice(bool pendingShipmentPrice) =>
      _$this._pendingShipmentPrice = pendingShipmentPrice;

  String _deliverDate;
  String get deliverDate => _$this._deliverDate;
  set deliverDate(String deliverDate) => _$this._deliverDate = deliverDate;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SellerWiseCheckoutsRecordBuilder() {
    SellerWiseCheckoutsRecord._initializeBuilder(this);
  }

  SellerWiseCheckoutsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _message = $v.message;
      _ordersAmount = $v.ordersAmount;
      _paymentMethod = $v.paymentMethod;
      _shipmentTotal = $v.shipmentTotal;
      _subtotal = $v.subtotal;
      _total = $v.total;
      _totalInCents = $v.totalInCents;
      _expressProducts = $v.expressProducts;
      _normalProducts = $v.normalProducts;
      _pickupInStoreProducts = $v.pickupInStoreProducts;
      _pendingShipmentPrice = $v.pendingShipmentPrice;
      _deliverDate = $v.deliverDate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SellerWiseCheckoutsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SellerWiseCheckoutsRecord;
  }

  @override
  void update(void Function(SellerWiseCheckoutsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SellerWiseCheckoutsRecord build() {
    final _$result = _$v ??
        new _$SellerWiseCheckoutsRecord._(
            id: id,
            message: message,
            ordersAmount: ordersAmount,
            paymentMethod: paymentMethod,
            shipmentTotal: shipmentTotal,
            subtotal: subtotal,
            total: total,
            totalInCents: totalInCents,
            expressProducts: expressProducts,
            normalProducts: normalProducts,
            pickupInStoreProducts: pickupInStoreProducts,
            pendingShipmentPrice: pendingShipmentPrice,
            deliverDate: deliverDate,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
