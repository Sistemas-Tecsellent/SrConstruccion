import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get title;

  @nullable
  String get description;

  @nullable
  String get sku;

  @nullable
  String get brand;

  @nullable
  String get category;

  @nullable
  String get categoryId;

  @nullable
  String get mainImage;

  @nullable
  BuiltList<String> get images;

  @nullable
  int get views;

  @nullable
  int get likes;

  @nullable
  String get satDesc;

  @nullable
  bool get highShift;

  @nullable
  String get brandLogo;

  @nullable
  String get owner;

  @nullable
  BuiltList<String> get sellers;

  @nullable
  int get sales;

  @nullable
  bool get isInSale;

  @nullable
  String get saleImage;

  @nullable
  BuiltList<String> get stores;

  @nullable
  DateTime get createdDate;

  @nullable
  bool get isMostSold;

  @nullable
  bool get isWeekFavorite;

  @nullable
  String get code;

  @nullable
  BuiltList<String> get subcategories;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..id = ''
    ..title = ''
    ..description = ''
    ..sku = ''
    ..brand = ''
    ..category = ''
    ..categoryId = ''
    ..mainImage = ''
    ..images = ListBuilder()
    ..views = 0
    ..likes = 0
    ..satDesc = ''
    ..highShift = false
    ..brandLogo = ''
    ..owner = ''
    ..sellers = ListBuilder()
    ..sales = 0
    ..isInSale = false
    ..saleImage = ''
    ..stores = ListBuilder()
    ..isMostSold = false
    ..isWeekFavorite = false
    ..code = ''
    ..subcategories = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord(
        (c) => c
          ..id = snapshot.data['id']
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..sku = snapshot.data['sku']
          ..brand = snapshot.data['brand']
          ..category = snapshot.data['category']
          ..categoryId = snapshot.data['categoryId']
          ..mainImage = snapshot.data['mainImage']
          ..images = safeGet(() => ListBuilder(snapshot.data['images']))
          ..views = snapshot.data['views']?.round()
          ..likes = snapshot.data['likes']?.round()
          ..satDesc = snapshot.data['satDesc']
          ..highShift = snapshot.data['highShift']
          ..brandLogo = snapshot.data['brandLogo']
          ..owner = snapshot.data['owner']
          ..sellers = safeGet(() => ListBuilder(snapshot.data['sellers']))
          ..sales = snapshot.data['sales']?.round()
          ..isInSale = snapshot.data['isInSale']
          ..saleImage = snapshot.data['saleImage']
          ..stores = safeGet(() => ListBuilder(snapshot.data['stores']))
          ..createdDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['createdDate']))
          ..isMostSold = snapshot.data['isMostSold']
          ..isWeekFavorite = snapshot.data['isWeekFavorite']
          ..code = snapshot.data['code']
          ..subcategories =
              safeGet(() => ListBuilder(snapshot.data['subcategories']))
          ..reference = ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String id,
  String title,
  String description,
  String sku,
  String brand,
  String category,
  String categoryId,
  String mainImage,
  int views,
  int likes,
  String satDesc,
  bool highShift,
  String brandLogo,
  String owner,
  int sales,
  bool isInSale,
  String saleImage,
  DateTime createdDate,
  bool isMostSold,
  bool isWeekFavorite,
  String code,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..id = id
          ..title = title
          ..description = description
          ..sku = sku
          ..brand = brand
          ..category = category
          ..categoryId = categoryId
          ..mainImage = mainImage
          ..images = null
          ..views = views
          ..likes = likes
          ..satDesc = satDesc
          ..highShift = highShift
          ..brandLogo = brandLogo
          ..owner = owner
          ..sellers = null
          ..sales = sales
          ..isInSale = isInSale
          ..saleImage = saleImage
          ..stores = null
          ..createdDate = createdDate
          ..isMostSold = isMostSold
          ..isWeekFavorite = isWeekFavorite
          ..code = code
          ..subcategories = null));
