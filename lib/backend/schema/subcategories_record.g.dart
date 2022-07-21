// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubcategoriesRecord> _$subcategoriesRecordSerializer =
    new _$SubcategoriesRecordSerializer();

class _$SubcategoriesRecordSerializer
    implements StructuredSerializer<SubcategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    SubcategoriesRecord,
    _$SubcategoriesRecord
  ];
  @override
  final String wireName = 'SubcategoriesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SubcategoriesRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentCategory;
    if (value != null) {
      result
        ..add('parentCategory')
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
  SubcategoriesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubcategoriesRecordBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parentCategory':
          result.parentCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
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

class _$SubcategoriesRecord extends SubcategoriesRecord {
  @override
  final String id;
  @override
  final String image;
  @override
  final String parentCategory;
  @override
  final String banner;
  @override
  final DocumentReference<Object> reference;

  factory _$SubcategoriesRecord(
          [void Function(SubcategoriesRecordBuilder) updates]) =>
      (new SubcategoriesRecordBuilder()..update(updates)).build();

  _$SubcategoriesRecord._(
      {this.id, this.image, this.parentCategory, this.banner, this.reference})
      : super._();

  @override
  SubcategoriesRecord rebuild(
          void Function(SubcategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubcategoriesRecordBuilder toBuilder() =>
      new SubcategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubcategoriesRecord &&
        id == other.id &&
        image == other.image &&
        parentCategory == other.parentCategory &&
        banner == other.banner &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), image.hashCode),
                parentCategory.hashCode),
            banner.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubcategoriesRecord')
          ..add('id', id)
          ..add('image', image)
          ..add('parentCategory', parentCategory)
          ..add('banner', banner)
          ..add('reference', reference))
        .toString();
  }
}

class SubcategoriesRecordBuilder
    implements Builder<SubcategoriesRecord, SubcategoriesRecordBuilder> {
  _$SubcategoriesRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _parentCategory;
  String get parentCategory => _$this._parentCategory;
  set parentCategory(String parentCategory) =>
      _$this._parentCategory = parentCategory;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SubcategoriesRecordBuilder() {
    SubcategoriesRecord._initializeBuilder(this);
  }

  SubcategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _parentCategory = $v.parentCategory;
      _banner = $v.banner;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubcategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubcategoriesRecord;
  }

  @override
  void update(void Function(SubcategoriesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubcategoriesRecord build() {
    final _$result = _$v ??
        new _$SubcategoriesRecord._(
            id: id,
            image: image,
            parentCategory: parentCategory,
            banner: banner,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
