
///Clase que define una entidad la caual se usará en diversas partes de la aplicación.
class Product {
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
  final String brand;
  final bool inStock;

  Product(
      {required this.id,
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
      required this.inStock});
}
