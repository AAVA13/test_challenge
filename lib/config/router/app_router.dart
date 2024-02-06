import 'package:go_router/go_router.dart';
import '../../features/products/presentation/screens/screens.dart';

///Configuración de las rutas de la aplicación utilizando el paquete de Go_Router
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductScreen(
        productId: state.pathParameters['id'] ?? 'no-id',
      ),
    ),
    GoRoute(
      path: '/shopping/cart',
      builder: (context, state) => const ShoppingCartScreen(),
    ),
  ],
);
