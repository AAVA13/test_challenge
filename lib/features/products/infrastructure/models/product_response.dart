///Clase que define el modelo de la respuesta obtenida por la API (lista de productos)
class ProductResponse {
  final String id;
  final String title;
  final String description;
  final double regularPrice;
  final String idMarketplaceStoreCategory;
  final List<String> imagesUrl;
  final String status;
  final String idMarketplaceStoreBrand;
  final int reviewsAverage;
  final String siteName;
  final String marketplace;
  final String store;
  final String? brand;

  ProductResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.regularPrice,
    required this.idMarketplaceStoreCategory,
    required this.imagesUrl,
    required this.status,
    required this.idMarketplaceStoreBrand,
    required this.reviewsAverage,
    required this.siteName,
    required this.marketplace,
    required this.store,
    required this.brand,
  });
  ///Mapea la respuesta de la api a un objeto de tipo ProductResponse
  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        id: json["_id"],
        title: json["title"],
        description: json["description"] ?? '',
        regularPrice: json["regular_price"]?.toDouble(),
        idMarketplaceStoreCategory: json["id_marketplace_store_category"],
        imagesUrl: List<String>.from(json["images"].map((image) => image["image"])),
        status: json["status"],
        idMarketplaceStoreBrand: json["id_marketplace_store_brand"]["\$id"],
        reviewsAverage: json["reviews_average"],
        siteName: json["site_name"],
        marketplace: json["marketplace"],
        store: json["store"],
        brand: json["brand"],
      );
}
