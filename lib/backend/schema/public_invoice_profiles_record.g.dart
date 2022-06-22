// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_invoice_profiles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PublicInvoiceProfilesRecord>
    _$publicInvoiceProfilesRecordSerializer =
    new _$PublicInvoiceProfilesRecordSerializer();

class _$PublicInvoiceProfilesRecordSerializer
    implements StructuredSerializer<PublicInvoiceProfilesRecord> {
  @override
  final Iterable<Type> types = const [
    PublicInvoiceProfilesRecord,
    _$PublicInvoiceProfilesRecord
  ];
  @override
  final String wireName = 'PublicInvoiceProfilesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PublicInvoiceProfilesRecord object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rfc;
    if (value != null) {
      result
        ..add('rfc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
  PublicInvoiceProfilesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicInvoiceProfilesRecordBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rfc':
          result.rfc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
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

class _$PublicInvoiceProfilesRecord extends PublicInvoiceProfilesRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final String rfc;
  @override
  final String address;
  @override
  final String email;
  @override
  final DocumentReference<Object> reference;

  factory _$PublicInvoiceProfilesRecord(
          [void Function(PublicInvoiceProfilesRecordBuilder) updates]) =>
      (new PublicInvoiceProfilesRecordBuilder()..update(updates)).build();

  _$PublicInvoiceProfilesRecord._(
      {this.id, this.name, this.rfc, this.address, this.email, this.reference})
      : super._();

  @override
  PublicInvoiceProfilesRecord rebuild(
          void Function(PublicInvoiceProfilesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicInvoiceProfilesRecordBuilder toBuilder() =>
      new PublicInvoiceProfilesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicInvoiceProfilesRecord &&
        id == other.id &&
        name == other.name &&
        rfc == other.rfc &&
        address == other.address &&
        email == other.email &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), rfc.hashCode),
                address.hashCode),
            email.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PublicInvoiceProfilesRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('rfc', rfc)
          ..add('address', address)
          ..add('email', email)
          ..add('reference', reference))
        .toString();
  }
}

class PublicInvoiceProfilesRecordBuilder
    implements
        Builder<PublicInvoiceProfilesRecord,
            PublicInvoiceProfilesRecordBuilder> {
  _$PublicInvoiceProfilesRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _rfc;
  String get rfc => _$this._rfc;
  set rfc(String rfc) => _$this._rfc = rfc;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PublicInvoiceProfilesRecordBuilder() {
    PublicInvoiceProfilesRecord._initializeBuilder(this);
  }

  PublicInvoiceProfilesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _rfc = $v.rfc;
      _address = $v.address;
      _email = $v.email;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicInvoiceProfilesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicInvoiceProfilesRecord;
  }

  @override
  void update(void Function(PublicInvoiceProfilesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PublicInvoiceProfilesRecord build() {
    final _$result = _$v ??
        new _$PublicInvoiceProfilesRecord._(
            id: id,
            name: name,
            rfc: rfc,
            address: address,
            email: email,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
