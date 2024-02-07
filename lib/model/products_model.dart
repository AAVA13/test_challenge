class Products {
  final String id;
  final String title;
  final String? description;
  final String sku;
  final dynamic priceBs;
  final dynamic priceUSD;
  final List<dynamic> images;
  final List<dynamic> smallImages;
  final List<dynamic> mediumImages;
  final List<dynamic> largeImages;
  final double stock;
  final String brand;

  const Products(
      {required this.id,
      required this.title,
      this.description,
      required this.sku,
      required this.priceBs,
      required this.priceUSD,
      required this.images,
      required this.smallImages,
      required this.mediumImages,
      required this.largeImages,
      required this.brand,
      required this.stock});

  factory Products.fromJson(Map<String, dynamic> product) {
    return Products(
        id: product['_id'],
        title: product['title'],
        description: product['description'],
        sku: product['sku'],
        priceBs: product['regular_price'],
        priceUSD: product['regular_usd'],
        images: product['images'],
        smallImages: product['small'],
        mediumImages: product['medium'],
        largeImages: product['large'],
        brand: product['brand'],
        stock: product['stock_quantity'].toDouble());
  }
}
