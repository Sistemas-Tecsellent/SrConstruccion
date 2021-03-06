// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BrandsRecord> _$brandsRecordSerializer =
    new _$BrandsRecordSerializer();

class _$BrandsRecordSerializer implements StructuredSerializer<BrandsRecord> {
  @override
  final Iterable<Type> types = const [BrandsRecord, _$BrandsRecord];
  @override
  final String wireName = 'BrandsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BrandsRecord object,
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
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isTop;
    if (value != null) {
      result
        ..add('isTop')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.subcategories;
    if (value != null) {
      result
        ..add('subcategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  BrandsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BrandsRecordBuilder();

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
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'isTop':
          result.isTop = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'subcategories':
          result.subcategories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$BrandsRecord extends BrandsRecord {
  @override
  final String id;
  @override
  final String logo;
  @override
  final BuiltList<String> categories;
  @override
  final bool isTop;
  @override
  final BuiltList<String> subcategories;
  @override
  final String banner;
  @override
  final DocumentReference<Object> reference;

  factory _$BrandsRecord([void Function(BrandsRecordBuilder) updates]) =>
      (new BrandsRecordBuilder()..update(updates)).build();

  _$BrandsRecord._(
      {this.id,
      this.logo,
      this.categories,
      this.isTop,
      this.subcategories,
      this.banner,
      this.reference})
      : super._();

  @override
  BrandsRecord rebuild(void Function(BrandsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandsRecordBuilder toBuilder() => new BrandsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandsRecord &&
        id == other.id &&
        logo == other.logo &&
        categories == other.categories &&
        isTop == other.isTop &&
        subcategories == other.subcategories &&
        banner == other.banner &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), logo.hashCode),
                        categories.hashCode),
                    isTop.hashCode),
                subcategories.hashCode),
            banner.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandsRecord')
          ..add('id', id)
          ..add('logo', logo)
          ..add('categories', categories)
          ..add('isTop', isTop)
          ..add('subcategories', subcategories)
          ..add('banner', banner)
          ..add('reference', reference))
        .toString();
  }
}

class BrandsRecordBuilder
    implements Builder<BrandsRecord, BrandsRecordBuilder> {
  _$BrandsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  ListBuilder<String> _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String> categories) =>
      _$this._categories = categories;

  bool _isTop;
  bool get isTop => _$this._isTop;
  set isTop(bool isTop) => _$this._isTop = isTop;

  ListBuilder<String> _subcategories;
  ListBuilder<String> get subcategories =>
      _$this._subcategories ??= new ListBuilder<String>();
  set subcategories(ListBuilder<String> subcategories) =>
      _$this._subcategories = subcategories;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BrandsRecordBuilder() {
    BrandsRecord._initializeBuilder(this);
  }

  BrandsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _logo = $v.logo;
      _categories = $v.categories?.toBuilder();
      _isTop = $v.isTop;
      _subcategories = $v.subcategories?.toBuilder();
      _banner = $v.banner;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BrandsRecord;
  }

  @override
  void update(void Function(BrandsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandsRecord build() {
    _$BrandsRecord _$result;
    try {
      _$result = _$v ??
          new _$BrandsRecord._(
              id: id,
              logo: logo,
              categories: _categories?.build(),
              isTop: isTop,
              subcategories: _subcategories?.build(),
              banner: banner,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'subcategories';
        _subcategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BrandsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
