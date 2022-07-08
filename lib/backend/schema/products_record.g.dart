// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductsRecord object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('categoryId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('mainImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.views;
    if (value != null) {
      result
        ..add('views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.satDesc;
    if (value != null) {
      result
        ..add('satDesc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highShift;
    if (value != null) {
      result
        ..add('highShift')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.brandLogo;
    if (value != null) {
      result
        ..add('brandLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellers;
    if (value != null) {
      result
        ..add('sellers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.sales;
    if (value != null) {
      result
        ..add('sales')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isInSale;
    if (value != null) {
      result
        ..add('isInSale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.saleImage;
    if (value != null) {
      result
        ..add('saleImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stores;
    if (value != null) {
      result
        ..add('stores')
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
    value = object.isMostSold;
    if (value != null) {
      result
        ..add('isMostSold')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isWeekFavorite;
    if (value != null) {
      result
        ..add('isWeekFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subcategories;
    if (value != null) {
      result
        ..add('subcategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('ownerName')
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
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mainImage':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'satDesc':
          result.satDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'highShift':
          result.highShift = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'brandLogo':
          result.brandLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sellers':
          result.sellers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'sales':
          result.sales = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isInSale':
          result.isInSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'saleImage':
          result.saleImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stores':
          result.stores.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isMostSold':
          result.isMostSold = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isWeekFavorite':
          result.isWeekFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subcategories':
          result.subcategories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'ownerName':
          result.ownerName = serializers.deserialize(value,
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

class _$ProductsRecord extends ProductsRecord {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String sku;
  @override
  final String brand;
  @override
  final String category;
  @override
  final String categoryId;
  @override
  final String mainImage;
  @override
  final BuiltList<String> images;
  @override
  final int views;
  @override
  final int likes;
  @override
  final String satDesc;
  @override
  final bool highShift;
  @override
  final String brandLogo;
  @override
  final String owner;
  @override
  final BuiltList<String> sellers;
  @override
  final int sales;
  @override
  final bool isInSale;
  @override
  final String saleImage;
  @override
  final BuiltList<String> stores;
  @override
  final DateTime createdDate;
  @override
  final bool isMostSold;
  @override
  final bool isWeekFavorite;
  @override
  final String code;
  @override
  final BuiltList<String> subcategories;
  @override
  final String ownerName;
  @override
  final DocumentReference<Object> reference;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder) updates]) =>
      (new ProductsRecordBuilder()..update(updates)).build();

  _$ProductsRecord._(
      {this.id,
      this.title,
      this.description,
      this.sku,
      this.brand,
      this.category,
      this.categoryId,
      this.mainImage,
      this.images,
      this.views,
      this.likes,
      this.satDesc,
      this.highShift,
      this.brandLogo,
      this.owner,
      this.sellers,
      this.sales,
      this.isInSale,
      this.saleImage,
      this.stores,
      this.createdDate,
      this.isMostSold,
      this.isWeekFavorite,
      this.code,
      this.subcategories,
      this.ownerName,
      this.reference})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        sku == other.sku &&
        brand == other.brand &&
        category == other.category &&
        categoryId == other.categoryId &&
        mainImage == other.mainImage &&
        images == other.images &&
        views == other.views &&
        likes == other.likes &&
        satDesc == other.satDesc &&
        highShift == other.highShift &&
        brandLogo == other.brandLogo &&
        owner == other.owner &&
        sellers == other.sellers &&
        sales == other.sales &&
        isInSale == other.isInSale &&
        saleImage == other.saleImage &&
        stores == other.stores &&
        createdDate == other.createdDate &&
        isMostSold == other.isMostSold &&
        isWeekFavorite == other.isWeekFavorite &&
        code == other.code &&
        subcategories == other.subcategories &&
        ownerName == other.ownerName &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), title.hashCode), description.hashCode), sku.hashCode), brand.hashCode), category.hashCode), categoryId.hashCode), mainImage.hashCode),
                                                                                images.hashCode),
                                                                            views.hashCode),
                                                                        likes.hashCode),
                                                                    satDesc.hashCode),
                                                                highShift.hashCode),
                                                            brandLogo.hashCode),
                                                        owner.hashCode),
                                                    sellers.hashCode),
                                                sales.hashCode),
                                            isInSale.hashCode),
                                        saleImage.hashCode),
                                    stores.hashCode),
                                createdDate.hashCode),
                            isMostSold.hashCode),
                        isWeekFavorite.hashCode),
                    code.hashCode),
                subcategories.hashCode),
            ownerName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductsRecord')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('sku', sku)
          ..add('brand', brand)
          ..add('category', category)
          ..add('categoryId', categoryId)
          ..add('mainImage', mainImage)
          ..add('images', images)
          ..add('views', views)
          ..add('likes', likes)
          ..add('satDesc', satDesc)
          ..add('highShift', highShift)
          ..add('brandLogo', brandLogo)
          ..add('owner', owner)
          ..add('sellers', sellers)
          ..add('sales', sales)
          ..add('isInSale', isInSale)
          ..add('saleImage', saleImage)
          ..add('stores', stores)
          ..add('createdDate', createdDate)
          ..add('isMostSold', isMostSold)
          ..add('isWeekFavorite', isWeekFavorite)
          ..add('code', code)
          ..add('subcategories', subcategories)
          ..add('ownerName', ownerName)
          ..add('reference', reference))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _sku;
  String get sku => _$this._sku;
  set sku(String sku) => _$this._sku = sku;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  String _mainImage;
  String get mainImage => _$this._mainImage;
  set mainImage(String mainImage) => _$this._mainImage = mainImage;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  String _satDesc;
  String get satDesc => _$this._satDesc;
  set satDesc(String satDesc) => _$this._satDesc = satDesc;

  bool _highShift;
  bool get highShift => _$this._highShift;
  set highShift(bool highShift) => _$this._highShift = highShift;

  String _brandLogo;
  String get brandLogo => _$this._brandLogo;
  set brandLogo(String brandLogo) => _$this._brandLogo = brandLogo;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  ListBuilder<String> _sellers;
  ListBuilder<String> get sellers =>
      _$this._sellers ??= new ListBuilder<String>();
  set sellers(ListBuilder<String> sellers) => _$this._sellers = sellers;

  int _sales;
  int get sales => _$this._sales;
  set sales(int sales) => _$this._sales = sales;

  bool _isInSale;
  bool get isInSale => _$this._isInSale;
  set isInSale(bool isInSale) => _$this._isInSale = isInSale;

  String _saleImage;
  String get saleImage => _$this._saleImage;
  set saleImage(String saleImage) => _$this._saleImage = saleImage;

  ListBuilder<String> _stores;
  ListBuilder<String> get stores =>
      _$this._stores ??= new ListBuilder<String>();
  set stores(ListBuilder<String> stores) => _$this._stores = stores;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  bool _isMostSold;
  bool get isMostSold => _$this._isMostSold;
  set isMostSold(bool isMostSold) => _$this._isMostSold = isMostSold;

  bool _isWeekFavorite;
  bool get isWeekFavorite => _$this._isWeekFavorite;
  set isWeekFavorite(bool isWeekFavorite) =>
      _$this._isWeekFavorite = isWeekFavorite;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  ListBuilder<String> _subcategories;
  ListBuilder<String> get subcategories =>
      _$this._subcategories ??= new ListBuilder<String>();
  set subcategories(ListBuilder<String> subcategories) =>
      _$this._subcategories = subcategories;

  String _ownerName;
  String get ownerName => _$this._ownerName;
  set ownerName(String ownerName) => _$this._ownerName = ownerName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _sku = $v.sku;
      _brand = $v.brand;
      _category = $v.category;
      _categoryId = $v.categoryId;
      _mainImage = $v.mainImage;
      _images = $v.images?.toBuilder();
      _views = $v.views;
      _likes = $v.likes;
      _satDesc = $v.satDesc;
      _highShift = $v.highShift;
      _brandLogo = $v.brandLogo;
      _owner = $v.owner;
      _sellers = $v.sellers?.toBuilder();
      _sales = $v.sales;
      _isInSale = $v.isInSale;
      _saleImage = $v.saleImage;
      _stores = $v.stores?.toBuilder();
      _createdDate = $v.createdDate;
      _isMostSold = $v.isMostSold;
      _isWeekFavorite = $v.isWeekFavorite;
      _code = $v.code;
      _subcategories = $v.subcategories?.toBuilder();
      _ownerName = $v.ownerName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductsRecord build() {
    _$ProductsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProductsRecord._(
              id: id,
              title: title,
              description: description,
              sku: sku,
              brand: brand,
              category: category,
              categoryId: categoryId,
              mainImage: mainImage,
              images: _images?.build(),
              views: views,
              likes: likes,
              satDesc: satDesc,
              highShift: highShift,
              brandLogo: brandLogo,
              owner: owner,
              sellers: _sellers?.build(),
              sales: sales,
              isInSale: isInSale,
              saleImage: saleImage,
              stores: _stores?.build(),
              createdDate: createdDate,
              isMostSold: isMostSold,
              isWeekFavorite: isWeekFavorite,
              code: code,
              subcategories: _subcategories?.build(),
              ownerName: ownerName,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'sellers';
        _sellers?.build();

        _$failedField = 'stores';
        _stores?.build();

        _$failedField = 'subcategories';
        _subcategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
