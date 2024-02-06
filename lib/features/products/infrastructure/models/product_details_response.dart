///Clase que define el modelo de la respuesta obtenida por la API (producto individual)
class ProductDetailsResponse {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final double regularPrice;
  final String idMarketplaceStoreCategory;
  final List<String> imagesUrl;
  final String status;
  final int sales;
  final String idMarketplaceStore;
  final List<String> shipping;
  final String idMarketplaceStoreBrand;
  final int stockQuantity;
  final bool inStock;
  final int reviewsAverage;
  final String store;
  final String siteName;
  final String brand;
  final String marketplace;

  ProductDetailsResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.regularPrice,
    required this.idMarketplaceStoreCategory,
    required this.imagesUrl,
    required this.status,
    required this.sales,
    required this.idMarketplaceStore,
    required this.shipping,
    required this.idMarketplaceStoreBrand,
    required this.stockQuantity,
    required this.inStock,
    required this.store,
    required this.siteName,
    required this.brand,
    required this.reviewsAverage,
    required this.marketplace,
  });

  ///Mapea la respuesta de la api a un objeto de tipo ProductDetailsResponse
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) => ProductDetailsResponse(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        shortDescription: json["short_description"],
        regularPrice: json["regular_price"]?.toDouble(),
        idMarketplaceStoreCategory: json["id_marketplace_store_category"],
        imagesUrl: List<String>.from(json["images"].map((image) => image["image"])),
        status: json["status"],
        sales: json["sales"],
        idMarketplaceStore: json["id_marketplace_store"]["\$id"],
        shipping: List<String>.from(json["shipping"].map((image) => image["name"])),
        idMarketplaceStoreBrand: json["id_marketplace_store_brand"]["\$id"],
        stockQuantity: json["stock_quantity"],
        inStock: json["in_stock"],
        store: json["store"],
        siteName: json["site_name"],
        brand: json["brand"]["name"],
        reviewsAverage: json["reviews_average"],
        marketplace: json["marketplace"],
      );
}
