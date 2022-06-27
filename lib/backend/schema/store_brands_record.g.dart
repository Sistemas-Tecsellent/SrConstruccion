// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_brands_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreBrandsRecord> _$storeBrandsRecordSerializer =
    new _$StoreBrandsRecordSerializer();

class _$StoreBrandsRecordSerializer
    implements StructuredSerializer<StoreBrandsRecord> {
  @override
  final Iterable<Type> types = const [StoreBrandsRecord, _$StoreBrandsRecord];
  @override
  final String wireName = 'StoreBrandsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreBrandsRecord object,
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
  StoreBrandsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreBrandsRecordBuilder();

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

class _$StoreBrandsRecord extends StoreBrandsRecord {
  @override
  final String id;
  @override
  final DocumentReference<Object> reference;

  factory _$StoreBrandsRecord(
          [void Function(StoreBrandsRecordBuilder) updates]) =>
      (new StoreBrandsRecordBuilder()..update(updates)).build();

  _$StoreBrandsRecord._({this.id, this.reference}) : super._();

  @override
  StoreBrandsRecord rebuild(void Function(StoreBrandsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreBrandsRecordBuilder toBuilder() =>
      new StoreBrandsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreBrandsRecord &&
        id == other.id &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StoreBrandsRecord')
          ..add('id', id)
          ..add('reference', reference))
        .toString();
  }
}

class StoreBrandsRecordBuilder
    implements Builder<StoreBrandsRecord, StoreBrandsRecordBuilder> {
  _$StoreBrandsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StoreBrandsRecordBuilder() {
    StoreBrandsRecord._initializeBuilder(this);
  }

  StoreBrandsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreBrandsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoreBrandsRecord;
  }

  @override
  void update(void Function(StoreBrandsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreBrandsRecord build() {
    final _$result =
        _$v ?? new _$StoreBrandsRecord._(id: id, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
