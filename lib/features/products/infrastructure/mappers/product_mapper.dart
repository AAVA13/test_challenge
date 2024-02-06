import 'package:test_challenge/features/products/infrastructure/models/product_response.dart';

import '../../domain/entities/product.dart';
import '../models/product_details_response.dart';

class ProductMapper {
  ///Mapea la respuesta del modelo productResponse y retorna la entidad
  static Product productResponseToEntity(ProductResponse json) => Product(
        id: json.id,
        title: json.title,
        description: json.description,
        regularPrice: json.regularPrice,
        idMarketplaceStoreCategory: json.idMarketplaceStoreCategory,
        imagesUrl: json.imagesUrl,
        status: json.status,
        reviewsAverage: json.reviewsAverage,
        siteName: json.siteName,
        marketplace: json.marketplace,
        store: json.store,
        brand: json.brand ?? 'Unknown',
        inStock: false,
        idMarketplaceStoreBrand: json.idMarketplaceStoreBrand,
      );

  ///Mapea la respuesta del modelo productDetailResponse y retorna la entidad
  static Product productDetailResponseToEntity(ProductDetailsResponse json) => Product(
        id: json.id,
        title: json.title,
        description: json.description,
        regularPrice: json.regularPrice,
        idMarketplaceStoreCategory: json.idMarketplaceStoreCategory,
        imagesUrl: json.imagesUrl,
        status: json.status,
        idMarketplaceStoreBrand: json.idMarketplaceStoreBrand,
        reviewsAverage: json.reviewsAverage,
        siteName: json.siteName,
        marketplace: json.marketplace,
        store: json.store,
        brand: json.brand,
        inStock: json.inStock,
      );
}
