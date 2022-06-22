// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_for_clients_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersForClientsRecord> _$ordersForClientsRecordSerializer =
    new _$OrdersForClientsRecordSerializer();

class _$OrdersForClientsRecordSerializer
    implements StructuredSerializer<OrdersForClientsRecord> {
  @override
  final Iterable<Type> types = const [
    OrdersForClientsRecord,
    _$OrdersForClientsRecord
  ];
  @override
  final String wireName = 'OrdersForClientsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrdersForClientsRecord object,
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
    value = object.bundleId;
    if (value != null) {
      result
        ..add('bundleId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerId;
    if (value != null) {
      result
        ..add('customerId')
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
    value = object.amountOfProducts;
    if (value != null) {
      result
        ..add('amountOfProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shipmentDistance;
    if (value != null) {
      result
        ..add('shipmentDistance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shipmentTimeText;
    if (value != null) {
      result
        ..add('shipmentTimeText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shipmentPrice;
    if (value != null) {
      result
        ..add('shipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.deliverDate;
    if (value != null) {
      result
        ..add('deliverDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusForClient;
    if (value != null) {
      result
        ..add('statusForClient')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalSuppliersIds;
    if (value != null) {
      result
        ..add('totalSuppliersIds')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.parcelName;
    if (value != null) {
      result
        ..add('parcelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelGuide;
    if (value != null) {
      result
        ..add('parcelGuide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelLink;
    if (value != null) {
      result
        ..add('parcelLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelLogo;
    if (value != null) {
      result
        ..add('parcelLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.distanceText;
    if (value != null) {
      result
        ..add('distanceText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.store;
    if (value != null) {
      result
        ..add('store')
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
  OrdersForClientsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersForClientsRecordBuilder();

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
        case 'bundleId':
          result.bundleId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerId':
          result.customerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amountOfProducts':
          result.amountOfProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipmentDistance':
          result.shipmentDistance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'shipmentTimeText':
          result.shipmentTimeText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipmentPrice':
          result.shipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'deliverDate':
          result.deliverDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusForClient':
          result.statusForClient = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalSuppliersIds':
          result.totalSuppliersIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'discount':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'parcelName':
          result.parcelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelGuide':
          result.parcelGuide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelLink':
          result.parcelLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelLogo':
          result.parcelLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'distanceText':
          result.distanceText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
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

class _$OrdersForClientsRecord extends OrdersForClientsRecord {
  @override
  final String id;
  @override
  final String bundleId;
  @override
  final String customerId;
  @override
  final String status;
  @override
  final int amountOfProducts;
  @override
  final double shipmentDistance;
  @override
  final String shipmentTimeText;
  @override
  final double subtotal;
  @override
  final double total;
  @override
  final String type;
  @override
  final double shipmentPrice;
  @override
  final String deliverDate;
  @override
  final String statusForClient;
  @override
  final String code;
  @override
  final BuiltList<String> totalSuppliersIds;
  @override
  final DateTime createdDate;
  @override
  final double discount;
  @override
  final String parcelName;
  @override
  final String parcelGuide;
  @override
  final String parcelLink;
  @override
  final String parcelLogo;
  @override
  final String distanceText;
  @override
  final String store;
  @override
  final DocumentReference<Object> reference;

  factory _$OrdersForClientsRecord(
          [void Function(OrdersForClientsRecordBuilder) updates]) =>
      (new OrdersForClientsRecordBuilder()..update(updates)).build();

  _$OrdersForClientsRecord._(
      {this.id,
      this.bundleId,
      this.customerId,
      this.status,
      this.amountOfProducts,
      this.shipmentDistance,
      this.shipmentTimeText,
      this.subtotal,
      this.total,
      this.type,
      this.shipmentPrice,
      this.deliverDate,
      this.statusForClient,
      this.code,
      this.totalSuppliersIds,
      this.createdDate,
      this.discount,
      this.parcelName,
      this.parcelGuide,
      this.parcelLink,
      this.parcelLogo,
      this.distanceText,
      this.store,
      this.reference})
      : super._();

  @override
  OrdersForClientsRecord rebuild(
          void Function(OrdersForClientsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersForClientsRecordBuilder toBuilder() =>
      new OrdersForClientsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersForClientsRecord &&
        id == other.id &&
        bundleId == other.bundleId &&
        customerId == other.customerId &&
        status == other.status &&
        amountOfProducts == other.amountOfProducts &&
        shipmentDistance == other.shipmentDistance &&
        shipmentTimeText == other.shipmentTimeText &&
        subtotal == other.subtotal &&
        total == other.total &&
        type == other.type &&
        shipmentPrice == other.shipmentPrice &&
        deliverDate == other.deliverDate &&
        statusForClient == other.statusForClient &&
        code == other.code &&
        totalSuppliersIds == other.totalSuppliersIds &&
        createdDate == other.createdDate &&
        discount == other.discount &&
        parcelName == other.parcelName &&
        parcelGuide == other.parcelGuide &&
        parcelLink == other.parcelLink &&
        parcelLogo == other.parcelLogo &&
        distanceText == other.distanceText &&
        store == other.store &&
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
                                                                            $jc($jc($jc($jc($jc($jc(0, id.hashCode), bundleId.hashCode), customerId.hashCode), status.hashCode), amountOfProducts.hashCode),
                                                                                shipmentDistance.hashCode),
                                                                            shipmentTimeText.hashCode),
                                                                        subtotal.hashCode),
                                                                    total.hashCode),
                                                                type.hashCode),
                                                            shipmentPrice.hashCode),
                                                        deliverDate.hashCode),
                                                    statusForClient.hashCode),
                                                code.hashCode),
                                            totalSuppliersIds.hashCode),
                                        createdDate.hashCode),
                                    discount.hashCode),
                                parcelName.hashCode),
                            parcelGuide.hashCode),
                        parcelLink.hashCode),
                    parcelLogo.hashCode),
                distanceText.hashCode),
            store.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersForClientsRecord')
          ..add('id', id)
          ..add('bundleId', bundleId)
          ..add('customerId', customerId)
          ..add('status', status)
          ..add('amountOfProducts', amountOfProducts)
          ..add('shipmentDistance', shipmentDistance)
          ..add('shipmentTimeText', shipmentTimeText)
          ..add('subtotal', subtotal)
          ..add('total', total)
          ..add('type', type)
          ..add('shipmentPrice', shipmentPrice)
          ..add('deliverDate', deliverDate)
          ..add('statusForClient', statusForClient)
          ..add('code', code)
          ..add('totalSuppliersIds', totalSuppliersIds)
          ..add('createdDate', createdDate)
          ..add('discount', discount)
          ..add('parcelName', parcelName)
          ..add('parcelGuide', parcelGuide)
          ..add('parcelLink', parcelLink)
          ..add('parcelLogo', parcelLogo)
          ..add('distanceText', distanceText)
          ..add('store', store)
          ..add('reference', reference))
        .toString();
  }
}

class OrdersForClientsRecordBuilder
    implements Builder<OrdersForClientsRecord, OrdersForClientsRecordBuilder> {
  _$OrdersForClientsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _bundleId;
  String get bundleId => _$this._bundleId;
  set bundleId(String bundleId) => _$this._bundleId = bundleId;

  String _customerId;
  String get customerId => _$this._customerId;
  set customerId(String customerId) => _$this._customerId = customerId;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  int _amountOfProducts;
  int get amountOfProducts => _$this._amountOfProducts;
  set amountOfProducts(int amountOfProducts) =>
      _$this._amountOfProducts = amountOfProducts;

  double _shipmentDistance;
  double get shipmentDistance => _$this._shipmentDistance;
  set shipmentDistance(double shipmentDistance) =>
      _$this._shipmentDistance = shipmentDistance;

  String _shipmentTimeText;
  String get shipmentTimeText => _$this._shipmentTimeText;
  set shipmentTimeText(String shipmentTimeText) =>
      _$this._shipmentTimeText = shipmentTimeText;

  double _subtotal;
  double get subtotal => _$this._subtotal;
  set subtotal(double subtotal) => _$this._subtotal = subtotal;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  double _shipmentPrice;
  double get shipmentPrice => _$this._shipmentPrice;
  set shipmentPrice(double shipmentPrice) =>
      _$this._shipmentPrice = shipmentPrice;

  String _deliverDate;
  String get deliverDate => _$this._deliverDate;
  set deliverDate(String deliverDate) => _$this._deliverDate = deliverDate;

  String _statusForClient;
  String get statusForClient => _$this._statusForClient;
  set statusForClient(String statusForClient) =>
      _$this._statusForClient = statusForClient;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  ListBuilder<String> _totalSuppliersIds;
  ListBuilder<String> get totalSuppliersIds =>
      _$this._totalSuppliersIds ??= new ListBuilder<String>();
  set totalSuppliersIds(ListBuilder<String> totalSuppliersIds) =>
      _$this._totalSuppliersIds = totalSuppliersIds;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  double _discount;
  double get discount => _$this._discount;
  set discount(double discount) => _$this._discount = discount;

  String _parcelName;
  String get parcelName => _$this._parcelName;
  set parcelName(String parcelName) => _$this._parcelName = parcelName;

  String _parcelGuide;
  String get parcelGuide => _$this._parcelGuide;
  set parcelGuide(String parcelGuide) => _$this._parcelGuide = parcelGuide;

  String _parcelLink;
  String get parcelLink => _$this._parcelLink;
  set parcelLink(String parcelLink) => _$this._parcelLink = parcelLink;

  String _parcelLogo;
  String get parcelLogo => _$this._parcelLogo;
  set parcelLogo(String parcelLogo) => _$this._parcelLogo = parcelLogo;

  String _distanceText;
  String get distanceText => _$this._distanceText;
  set distanceText(String distanceText) => _$this._distanceText = distanceText;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrdersForClientsRecordBuilder() {
    OrdersForClientsRecord._initializeBuilder(this);
  }

  OrdersForClientsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _bundleId = $v.bundleId;
      _customerId = $v.customerId;
      _status = $v.status;
      _amountOfProducts = $v.amountOfProducts;
      _shipmentDistance = $v.shipmentDistance;
      _shipmentTimeText = $v.shipmentTimeText;
      _subtotal = $v.subtotal;
      _total = $v.total;
      _type = $v.type;
      _shipmentPrice = $v.shipmentPrice;
      _deliverDate = $v.deliverDate;
      _statusForClient = $v.statusForClient;
      _code = $v.code;
      _totalSuppliersIds = $v.totalSuppliersIds?.toBuilder();
      _createdDate = $v.createdDate;
      _discount = $v.discount;
      _parcelName = $v.parcelName;
      _parcelGuide = $v.parcelGuide;
      _parcelLink = $v.parcelLink;
      _parcelLogo = $v.parcelLogo;
      _distanceText = $v.distanceText;
      _store = $v.store;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersForClientsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersForClientsRecord;
  }

  @override
  void update(void Function(OrdersForClientsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersForClientsRecord build() {
    _$OrdersForClientsRecord _$result;
    try {
      _$result = _$v ??
          new _$OrdersForClientsRecord._(
              id: id,
              bundleId: bundleId,
              customerId: customerId,
              status: status,
              amountOfProducts: amountOfProducts,
              shipmentDistance: shipmentDistance,
              shipmentTimeText: shipmentTimeText,
              subtotal: subtotal,
              total: total,
              type: type,
              shipmentPrice: shipmentPrice,
              deliverDate: deliverDate,
              statusForClient: statusForClient,
              code: code,
              totalSuppliersIds: _totalSuppliersIds?.build(),
              createdDate: createdDate,
              discount: discount,
              parcelName: parcelName,
              parcelGuide: parcelGuide,
              parcelLink: parcelLink,
              parcelLogo: parcelLogo,
              distanceText: distanceText,
              store: store,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'totalSuppliersIds';
        _totalSuppliersIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrdersForClientsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
