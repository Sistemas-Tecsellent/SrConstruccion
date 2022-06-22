// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_days_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkDaysRecord> _$workDaysRecordSerializer =
    new _$WorkDaysRecordSerializer();

class _$WorkDaysRecordSerializer
    implements StructuredSerializer<WorkDaysRecord> {
  @override
  final Iterable<Type> types = const [WorkDaysRecord, _$WorkDaysRecord];
  @override
  final String wireName = 'WorkDaysRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, WorkDaysRecord object,
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
    value = object.closes;
    if (value != null) {
      result
        ..add('closes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.opens;
    if (value != null) {
      result
        ..add('opens')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  WorkDaysRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkDaysRecordBuilder();

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
        case 'closes':
          result.closes = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'opens':
          result.opens = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$WorkDaysRecord extends WorkDaysRecord {
  @override
  final String id;
  @override
  final DateTime closes;
  @override
  final bool enabled;
  @override
  final DateTime opens;
  @override
  final DocumentReference<Object> reference;

  factory _$WorkDaysRecord([void Function(WorkDaysRecordBuilder) updates]) =>
      (new WorkDaysRecordBuilder()..update(updates)).build();

  _$WorkDaysRecord._(
      {this.id, this.closes, this.enabled, this.opens, this.reference})
      : super._();

  @override
  WorkDaysRecord rebuild(void Function(WorkDaysRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkDaysRecordBuilder toBuilder() =>
      new WorkDaysRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkDaysRecord &&
        id == other.id &&
        closes == other.closes &&
        enabled == other.enabled &&
        opens == other.opens &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), closes.hashCode), enabled.hashCode),
            opens.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WorkDaysRecord')
          ..add('id', id)
          ..add('closes', closes)
          ..add('enabled', enabled)
          ..add('opens', opens)
          ..add('reference', reference))
        .toString();
  }
}

class WorkDaysRecordBuilder
    implements Builder<WorkDaysRecord, WorkDaysRecordBuilder> {
  _$WorkDaysRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _closes;
  DateTime get closes => _$this._closes;
  set closes(DateTime closes) => _$this._closes = closes;

  bool _enabled;
  bool get enabled => _$this._enabled;
  set enabled(bool enabled) => _$this._enabled = enabled;

  DateTime _opens;
  DateTime get opens => _$this._opens;
  set opens(DateTime opens) => _$this._opens = opens;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  WorkDaysRecordBuilder() {
    WorkDaysRecord._initializeBuilder(this);
  }

  WorkDaysRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _closes = $v.closes;
      _enabled = $v.enabled;
      _opens = $v.opens;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkDaysRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkDaysRecord;
  }

  @override
  void update(void Function(WorkDaysRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WorkDaysRecord build() {
    final _$result = _$v ??
        new _$WorkDaysRecord._(
            id: id,
            closes: closes,
            enabled: enabled,
            opens: opens,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
