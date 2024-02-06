import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String? id;
    String? title;
    String? description;
    String? sku;
    double? regularPrice;
    String? idMarketplaceStoreCategory;
    String? status;
    int? idProduct;
    int? idDepot;
    IdMarketplaceStoreBrand? idMarketplaceStoreBrand;
    bool? amenityAdd;
    bool? bookingDetail;
    bool? hasBooking;
    bool? hasDaypass;
    dynamic unit;
    bool? orderAnonymous;
    bool? featured;
    dynamic offerPercent;
    dynamic offerPrice;
    dynamic dateOnSaleFrom;
    dynamic dateOnSaleTo;
    double? stockQuantity;
    String? factor;
    double? regularUsd;
    double? taxRate;
    bool? print;
    Image? image;
    bool? variation;
    bool? size;
    bool? color1;
    bool? color2;
    bool? model;
    int? reviewsAverage;
    bool? checkPickup;
    bool? hasVariation;
    String? hash;
    String? siteName;
    String? marketplace;
    String? store;
    String? ico;
    String? flag;
    String? url;
    dynamic offerUsd;
    dynamic offerMin;
    String? brand;
    // List<Image> images;
    // List<Medium> medium;
    // List<Medium> small;
    // List<dynamic> variations;
    // List<Large> large;
    // List<dynamic> pickup;

    ProductModel({
      // required this.images,
      // required this.medium,
      // required this.small,
      // required this.variations,
      // required this.large,
      // required this.pickup,
      this.id,
      this.title,
      this.description,
      this.sku,
      this.regularPrice,
      this.idMarketplaceStoreCategory,
      this.status,
      this.idProduct,
      this.idDepot,
      this.idMarketplaceStoreBrand,
      this.amenityAdd,
      this.bookingDetail,
      this.hasBooking,
      this.hasDaypass,
      this.unit,
      this.orderAnonymous,
      this.featured,
      this.offerPercent,
      this.offerPrice,
      this.dateOnSaleFrom,
      this.dateOnSaleTo,
      this.stockQuantity,
      this.factor,
      this.regularUsd,
      this.taxRate,
      this.print,
      this.image,
      this.variation,
      this.size,
      this.color1,
      this.color2,
      this.model,
      this.reviewsAverage,
      this.checkPickup,
      this.hasVariation,
      this.hash,
      this.siteName,
      this.marketplace,
      this.store,
      this.ico,
      this.flag,
      this.url,
      this.offerUsd,
      this.offerMin,
      this.brand,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        sku: json["sku"],
        regularPrice: json["regular_price"]?.toDouble(),
        idMarketplaceStoreCategory: json["id_marketplace_store_category"],
        status: json["status"],
        idProduct: json["id_product"],
        idDepot: json["id_depot"],
        idMarketplaceStoreBrand: IdMarketplaceStoreBrand.fromJson(json["id_marketplace_store_brand"]),
        amenityAdd: json["amenity_add"],
        bookingDetail: json["booking_detail"],
        hasBooking: json["has_booking"],
        hasDaypass: json["has_daypass"],
        unit: json["unit"],
        orderAnonymous: json["order_anonymous"],
        featured: json["featured"],
        offerPercent: json["offer_percent"],
        offerPrice: json["offer_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleTo: json["date_on_sale_to"],
        stockQuantity: json["stock_quantity"]?.toDouble(),
        factor: json["factor"],
        regularUsd: json["regular_usd"]?.toDouble(),
        taxRate: json["tax_rate"]?.toDouble(),
        print: json["print"],
        image: Image.fromJson(json["image"]),
        variation: json["variation"],
        size: json["size"],
        color1: json["color1"],
        color2: json["color2"],
        model: json["model"],
        reviewsAverage: json["reviews_average"],
        checkPickup: json["check_pickup"],
        hasVariation: json["has_variation"],
        hash: json["hash"],
        siteName: json["site_name"],
        marketplace: json["marketplace"],
        store: json["store"],
        ico: json["ico"],
        flag: json["flag"],
        url: json["url"],
        offerUsd: json["offer_usd"],
        offerMin: json["offer_min"],
        brand: json["brand"],
        // images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        // medium: List<Medium>.from(json["medium"].map((x) => Medium.fromJson(x))),
        // small: List<Medium>.from(json["small"].map((x) => Medium.fromJson(x))),
        // variations: List<dynamic>.from(json["variations"].map((x) => x)),
        // large: List<Large>.from(json["large"].map((x) => Large.fromJson(x))),
        // pickup: List<dynamic>.from(json["pickup"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "sku": sku,
        "regular_price": regularPrice,
        "id_marketplace_store_category": idMarketplaceStoreCategory,
        "status": status,
        "id_product": idProduct,
        "id_depot": idDepot,
        "id_marketplace_store_brand": idMarketplaceStoreBrand?.toJson(),
        "amenity_add": amenityAdd,
        "booking_detail": bookingDetail,
        "has_booking": hasBooking,
        "has_daypass": hasDaypass,
        "unit": unit,
        "order_anonymous": orderAnonymous,
        "featured": featured,
        "offer_percent": offerPercent,
        "offer_price": offerPrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_to": dateOnSaleTo,
        "stock_quantity": stockQuantity,
        "factor": factor,
        "regular_usd": regularUsd,
        "tax_rate": taxRate,
        "print": print,
        "image": image?.toJson(),
        "variation": variation,
        "size": size,
        "color1": color1,
        "color2": color2,
        "model": model,
        "reviews_average": reviewsAverage,
        "check_pickup": checkPickup,
        "has_variation": hasVariation,
        "hash": hash,
        "site_name": siteName,
        "marketplace": marketplace,
        "store": store,
        "ico": ico,
        "flag": flag,
        "url": url,
        "offer_usd": offerUsd,
        "offer_min": offerMin,
        "brand": brand,
        // "small": List<dynamic>.from(small.map((x) => x.toJson())),
        // "images": List<dynamic>.from(images.map((x) => x.toJson())),
        // "medium": List<dynamic>.from(medium.map((x) => x.toJson())),
        // "variations": List<dynamic>.from(variations.map((x) => x)),
        // "large": List<dynamic>.from(large.map((x) => x.toJson())),
        // "pickup": List<dynamic>.from(pickup.map((x) => x)),
    };
}

class IdMarketplaceStoreBrand {
    String id;

    IdMarketplaceStoreBrand({
        required this.id,
    });

    factory IdMarketplaceStoreBrand.fromJson(Map<String, dynamic> json) => IdMarketplaceStoreBrand(
        id: json["\u0024id"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
    };
}

class Image {
    IdMarketplaceStoreBrand id;
    String name;
    String image;
    int position;
    String mime;
    int idProduct;

    Image({
        required this.id,
        required this.name,
        required this.image,
        required this.position,
        required this.mime,
        required this.idProduct,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: IdMarketplaceStoreBrand.fromJson(json["_id"]),
        name: json["name"],
        image: json["image"],
        position: json["position"],
        mime: json["mime"],
        idProduct: json["id_product"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "name": name,
        "image": image,
        "position": position,
        "mime": mime,
        "id_product": idProduct,
    };
}

class Large {
    int position;
    String image;
    String text;

    Large({
        required this.position,
        required this.image,
        required this.text,
    });

    factory Large.fromJson(Map<String, dynamic> json) => Large(
        position: json["position"],
        image: json["image"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "position": position,
        "image": image,
        "text": text,
    };
}

class Medium {
    String image;
    String text;

    Medium({
        required this.image,
        required this.text,
    });

    factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        image: json["image"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "text": text,
    };
}
