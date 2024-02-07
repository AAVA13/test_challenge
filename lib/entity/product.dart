class Image {
  final String id;
  final String name;
  final String image;
  final int position;
  final String mime;
  final int idProduct;

  Image(
      {required this.id,
      required this.name,
      required this.image,
      required this.position,
      required this.mime,
      required this.idProduct});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['_id']?['\$id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      position: json['position'] ?? 0,
      mime: json['mime'] ?? '',
      idProduct: json['id_product'] ?? 0,
    );
  }
}

class Product {
  final String id;
  final String title;
  final String? description;
  final String sku;
  double regularPrice;
  final String idMarketplaceStoreCategory;
  final List<Image> images;
  final String status;
  final int idProduct;
  final int idDepot;
  final List<Image> medium;
  final List<Image> small;
  final String idMarketplaceStoreBrand;
  final bool amenityAdd;
  final bool bookingDetail;
  final bool hasBooking;
  final bool hasDaypass;
  final String? unit;
  final bool orderAnonymous;
  final bool featured;
  double? offerPercent;
  double? offerPrice;
  final String? dateOnSaleFrom;
  final String? dateOnSaleTo;
  double stockQuantity;
  final String factor;
  double regularUsd;
  double taxRate;
  final bool print;
  final List<dynamic> variations;
  final List<Image> large;
  final Image image;
  final bool variation;
  final bool size;
  final bool color1;
  final bool color2;
  final bool model;
  double reviewsAverage;
  final List<dynamic> pickup;
  final bool checkPickup;
  final bool hasVariation;
  final String hash;
  final String siteName;
  final String marketplace;
  final String store;
  final String ico;
  final String flag;
  final String url;
  double? offerUsd;
  double? offerMin;
  final String brand;

  Product({
    required this.id,
    required this.title,
    this.description,
    required this.sku,
    required this.regularPrice,
    required this.idMarketplaceStoreCategory,
    required this.images,
    required this.status,
    required this.idProduct,
    required this.idDepot,
    required this.medium,
    required this.small,
    required this.idMarketplaceStoreBrand,
    required this.amenityAdd,
    required this.bookingDetail,
    required this.hasBooking,
    required this.hasDaypass,
    this.unit,
    required this.orderAnonymous,
    required this.featured,
    this.offerPercent,
    this.offerPrice,
    this.dateOnSaleFrom,
    this.dateOnSaleTo,
    required this.stockQuantity,
    required this.factor,
    required this.regularUsd,
    required this.taxRate,
    required this.print,
    required this.variations,
    required this.large,
    required this.image,
    required this.variation,
    required this.size,
    required this.color1,
    required this.color2,
    required this.model,
    required this.reviewsAverage,
    required this.pickup,
    required this.checkPickup,
    required this.hasVariation,
    required this.hash,
    required this.siteName,
    required this.marketplace,
    required this.store,
    required this.ico,
    required this.flag,
    required this.url,
    this.offerUsd,
    this.offerMin,
    required this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var imageList = json['images'] as List;
    List<Image> images = imageList.map((i) => Image.fromJson(i)).toList();

    var mediumList = json['medium'] as List;
    List<Image> medium = mediumList.map((i) => Image.fromJson(i)).toList();

    var smallList = json['small'] as List;
    List<Image> small = smallList.map((i) => Image.fromJson(i)).toList();

    var largeList = json['large'] as List;
    List<Image> large = largeList.map((i) => Image.fromJson(i)).toList();

    return Product(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      sku: json['sku'],
      regularPrice: (json['regular_price'] is int)
          ? json['regular_price'].toDouble()
          : json['regular_price'],
      idMarketplaceStoreCategory: json['id_marketplace_store_category'],
      images: images,
      status: json['status'],
      idProduct: json['id_product'],
      idDepot: json['id_depot'],
      medium: medium,
      small: small,
      idMarketplaceStoreBrand: json['id_marketplace_store_brand']['\$id'],
      amenityAdd: json['amenity_add'],
      bookingDetail: json['booking_detail'],
      hasBooking: json['has_booking'],
      hasDaypass: json['has_daypass'],
      unit: json['unit'],
      orderAnonymous: json['order_anonymous'],
      featured: json['featured'],
      offerPercent: (json['offer_percent'] is int)
          ? json['offer_percent'].toDouble()
          : json['offer_percent'],
      offerPrice: (json['offer_price'] is int)
          ? json['offer_price'].toDouble()
          : json['offer_price'],
      dateOnSaleFrom: json['date_on_sale_from'],
      dateOnSaleTo: json['date_on_sale_to'],
      stockQuantity: (json['stock_quantity'] is int)
          ? json['stock_quantity'].toDouble()
          : json['stock_quantity'],
      factor: json['factor'],
      regularUsd: (json['regular_usd'] is int)
          ? json['regular_usd'].toDouble()
          : json['regular_usd'],
      taxRate: (json['tax_rate'] is int)
          ? json['tax_rate'].toDouble()
          : json['tax_rate'],
      print: json['print'],
      variations: json['variations'],
      large: large,
      image: Image.fromJson(json['image']),
      variation: json['variation'],
      size: json['size'],
      color1: json['color1'],
      color2: json['color2'],
      model: json['model'],
      reviewsAverage: (json['reviews_average'] is int)
          ? json['reviews_average'].toDouble()
          : json['reviews_average'],
      pickup: json['pickup'],
      checkPickup: json['check_pickup'],
      hasVariation: json['has_variation'],
      hash: json['hash'],
      siteName: json['site_name'],
      marketplace: json['marketplace'],
      store: json['store'],
      ico: json['ico'],
      flag: json['flag'],
      url: json['url'],
      offerUsd: (json['offer_usd'] is int)
          ? json['offer_usd'].toDouble()
          : json['offer_usd'],
      offerMin: (json['offer_min'] is int)
          ? json['offer_min'].toDouble()
          : json['offer_min'],
      brand: json['brand'],
    );
  }
}
