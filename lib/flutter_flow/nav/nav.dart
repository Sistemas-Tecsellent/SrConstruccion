import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  SrConstruccionFirebaseUser initialUser;
  SrConstruccionFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SrConstruccionFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeAltWidget() : HomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeAltWidget() : HomeWidget(),
          routes: [
            FFRoute(
              name: 'Notificaciones',
              path: 'notificaciones',
              requireAuth: true,
              builder: (context, params) => NotificacionesWidget(),
            ),
            FFRoute(
              name: 'Perfil',
              path: 'perfil',
              requireAuth: true,
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: 'HomeAlt',
              path: 'home-login',
              requireAuth: true,
              builder: (context, params) => HomeAltWidget(),
            ),
            FFRoute(
              name: 'CotizacionesDeEnvio',
              path: 'cotizaciones-de-envio',
              requireAuth: true,
              builder: (context, params) => CotizacionesDeEnvioWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'iniciar-sesion',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'ProductPageSeller',
              path: 'vendedor/:storeName/:productId',
              builder: (context, params) => ProductPageSellerWidget(
                storeId: params.getParam('storeId', ParamType.String),
                storeName: params.getParam('storeName', ParamType.String),
                productId: params.getParam('productId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ProductPage',
              path: 'producto/:productId',
              builder: (context, params) => ProductPageWidget(
                productId: params.getParam('productId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Carrito',
              path: 'carrito',
              requireAuth: true,
              builder: (context, params) => CarritoWidget(),
            ),
            FFRoute(
              name: 'signup',
              path: 'registro',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'NotificationesAjustes',
              path: 'notificationesAjustes',
              requireAuth: true,
              builder: (context, params) => NotificationesAjustesWidget(),
            ),
            FFRoute(
              name: 'Ajustes',
              path: 'perfil/ajustes',
              requireAuth: true,
              builder: (context, params) => AjustesWidget(),
            ),
            FFRoute(
              name: 'Categorias',
              path: 'categorias',
              builder: (context, params) => CategoriasWidget(),
            ),
            FFRoute(
              name: 'miCuenta',
              path: 'perfil/mi-cuenta',
              requireAuth: true,
              builder: (context, params) => MiCuentaWidget(),
            ),
            FFRoute(
              name: 'Direcciones',
              path: 'perfil/mis-direcciones',
              requireAuth: true,
              builder: (context, params) => DireccionesWidget(),
            ),
            FFRoute(
              name: 'EditarDireccion',
              path: 'perfil/mis-direcciones/editar-direccion',
              requireAuth: true,
              builder: (context, params) => EditarDireccionWidget(
                name: params.getParam('name', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AnadirDireccion',
              path: 'perfil/mis-direcciones/anadir-direccion',
              requireAuth: true,
              builder: (context, params) => AnadirDireccionWidget(),
            ),
            FFRoute(
              name: 'MisCotizaciones',
              path: 'perfil/mis-cotizaciones',
              requireAuth: true,
              builder: (context, params) => MisCotizacionesWidget(),
            ),
            FFRoute(
              name: 'CotizacionFormulario',
              path: 'cotizacionFormulario',
              requireAuth: true,
              builder: (context, params) => CotizacionFormularioWidget(),
            ),
            FFRoute(
              name: 'ResumenSolicitudCotizacion',
              path: 'resumenSolicitudCotizacion',
              requireAuth: true,
              builder: (context, params) => ResumenSolicitudCotizacionWidget(),
            ),
            FFRoute(
              name: 'CotizacionConSubCotizaciones',
              path: 'cotizacionConSubCotizaciones',
              requireAuth: true,
              builder: (context, params) =>
                  CotizacionConSubCotizacionesWidget(),
            ),
            FFRoute(
              name: 'PerfilPuntos',
              path: 'mi-perfil/beneficios',
              builder: (context, params) => PerfilPuntosWidget(),
            ),
            FFRoute(
              name: 'VendedoresEnMapa',
              path: 'vendedores-cercanos',
              builder: (context, params) => VendedoresEnMapaWidget(),
            ),
            FFRoute(
              name: 'search',
              path: 'buscar/productos',
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'CheckoutSeller',
              path: 'checkout/:storeName',
              requireAuth: true,
              builder: (context, params) => CheckoutSellerWidget(
                storeId: params.getParam('storeId', ParamType.String),
                storeName: params.getParam('storeName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoProgramado',
              path: 'mis-pedidos/pedidos-programados/:bundleId',
              requireAuth: true,
              builder: (context, params) => PedidoProgramadoWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PerfilDelSeller',
              path: 'vendedor/:storeName',
              builder: (context, params) => PerfilDelSellerWidget(
                storeId: params.getParam('storeId', ParamType.String),
                calledFromPage:
                    params.getParam('calledFromPage', ParamType.String),
                productId: params.getParam('productId', ParamType.String),
                variantId: params.getParam('variantId', ParamType.String),
                storeName: params.getParam('storeName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DetallePedidoProgramado',
              path: 'mis-pedidos/pedido-programado/express/:orderId',
              requireAuth: true,
              builder: (context, params) => DetallePedidoProgramadoWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Valoraciones',
              path: 'valoraciones',
              requireAuth: true,
              builder: (context, params) => ValoracionesWidget(),
            ),
            FFRoute(
              name: 'CarritoPorSellers',
              path: 'carrito/:storeName',
              requireAuth: true,
              builder: (context, params) => CarritoPorSellersWidget(
                storeId: params.getParam('storeId', ParamType.String),
                storeName: params.getParam('storeName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Onboarding1',
              path: 'bienvenido',
              builder: (context, params) => Onboarding1Widget(),
            ),
            FFRoute(
              name: 'Profesional',
              path: 'registro/profesional',
              builder: (context, params) => ProfesionalWidget(),
            ),
            FFRoute(
              name: 'PagoPendiente',
              path: 'pagoPendiente',
              requireAuth: true,
              builder: (context, params) => PagoPendienteWidget(),
            ),
            FFRoute(
              name: 'PagoAceptado',
              path: 'pago-exitoso',
              requireAuth: true,
              builder: (context, params) => PagoAceptadoWidget(
                total: params.getParam('total', ParamType.double),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PagoFailed',
              path: 'pagoFailed',
              requireAuth: true,
              builder: (context, params) => PagoFailedWidget(),
            ),
            FFRoute(
              name: 'ProductListingSrConstruccion',
              path: 'todos-los-productos',
              builder: (context, params) => ProductListingSrConstruccionWidget(
                orderByPopularity:
                    params.getParam('orderByPopularity', ParamType.bool),
                orderByPrice: params.getParam('orderByPrice', ParamType.bool),
                filterBySale: params.getParam('filterBySale', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'ReviewsPosEntregaSeller',
              path: 'reviewsPosEntregaSeller',
              requireAuth: true,
              builder: (context, params) => ReviewsPosEntregaSellerWidget(),
            ),
            FFRoute(
              name: 'ReviewsPosEntregaSR',
              path: 'reviewsPosEntregaSR',
              requireAuth: true,
              builder: (context, params) => ReviewsPosEntregaSRWidget(),
            ),
            FFRoute(
              name: 'DetallePedidoFinal',
              path: 'detallePedidoFinal',
              requireAuth: true,
              builder: (context, params) => DetallePedidoFinalWidget(),
            ),
            FFRoute(
              name: 'DetallePedidoProgramadoCheckout',
              path: 'mis-pedidos/historial/terminado',
              requireAuth: true,
              builder: (context, params) =>
                  DetallePedidoProgramadoCheckoutWidget(
                order: params.getParam('order', ParamType.String),
                checkoutId: params.getParam('checkoutId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ReviewdeProductosPosEntrega',
              path: 'reviewdeProductosPosEntrega',
              requireAuth: true,
              builder: (context, params) => ReviewdeProductosPosEntregaWidget(),
            ),
            FFRoute(
              name: 'Empresa',
              path: 'registro/empresa',
              builder: (context, params) => EmpresaWidget(),
            ),
            FFRoute(
              name: 'ListadoMarcas',
              path: 'marcas',
              builder: (context, params) => ListadoMarcasWidget(),
            ),
            FFRoute(
              name: 'listadoSellers',
              path: 'vendedores',
              builder: (context, params) => ListadoSellersWidget(),
            ),
            FFRoute(
              name: 'Devolucion',
              path: 'devolucion',
              requireAuth: true,
              builder: (context, params) => DevolucionWidget(),
            ),
            FFRoute(
              name: 'Devolucion2',
              path: 'devolucion2',
              requireAuth: true,
              builder: (context, params) => Devolucion2Widget(),
            ),
            FFRoute(
              name: 'ProductListingForSeller',
              path: 'vendedor/listado-de-productos/:storeId',
              builder: (context, params) => ProductListingForSellerWidget(
                storeId: params.getParam('storeId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SolicitudDevolucionEnviada',
              path: 'solicitudDevolucionEnviada',
              requireAuth: true,
              builder: (context, params) => SolicitudDevolucionEnviadaWidget(),
            ),
            FFRoute(
              name: 'SolicitudDevolucionAceptada',
              path: 'solicitudDevolucionAceptada',
              requireAuth: true,
              builder: (context, params) => SolicitudDevolucionAceptadaWidget(),
            ),
            FFRoute(
              name: 'MisPedidos',
              path: 'mis-pedidos',
              requireAuth: true,
              builder: (context, params) => MisPedidosWidget(),
            ),
            FFRoute(
              name: 'CategoriaSingle',
              path: 'categoria/:categoryId',
              builder: (context, params) => CategoriaSingleWidget(
                categoryId: params.getParam('categoryId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Checkout',
              path: 'checkout',
              requireAuth: true,
              builder: (context, params) => CheckoutWidget(),
            ),
            FFRoute(
              name: 'MarcaSingle',
              path: 'marca/:brandId',
              builder: (context, params) => MarcaSingleWidget(
                brandId: params.getParam('brandId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DetalleDevolucion',
              path: 'detalleDevolucion',
              requireAuth: true,
              builder: (context, params) => DetalleDevolucionWidget(),
            ),
            FFRoute(
              name: 'SolicitudDevolucionEnviado',
              path: 'solicitudDevolucionEnviado',
              requireAuth: true,
              builder: (context, params) => SolicitudDevolucionEnviadoWidget(),
            ),
            FFRoute(
              name: 'WishListProducts',
              path: 'wish/productos',
              requireAuth: true,
              builder: (context, params) => WishListProductsWidget(),
            ),
            FFRoute(
              name: 'subcategoriaSingle',
              path: 'categoria/subcategoria',
              builder: (context, params) => SubcategoriaSingleWidget(
                categoryId: params.getParam('categoryId', ParamType.String),
                subcategoryId:
                    params.getParam('subcategoryId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'InfoTransferencia',
              path: 'infoTransferencia',
              requireAuth: true,
              builder: (context, params) => InfoTransferenciaWidget(),
            ),
            FFRoute(
              name: 'ValidacionRFC',
              path: 'registro/empresa/validacion-RFC',
              builder: (context, params) => ValidacionRFCWidget(),
            ),
            FFRoute(
              name: 'WishMarcas',
              path: 'wish/marcas',
              requireAuth: true,
              builder: (context, params) => WishMarcasWidget(),
            ),
            FFRoute(
              name: 'WishListSellers',
              path: 'wish/vendedores',
              requireAuth: true,
              builder: (context, params) => WishListSellersWidget(),
            ),
            FFRoute(
              name: 'BuscarPorRFC',
              path: 'perfil/buscar-RFC',
              requireAuth: true,
              builder: (context, params) => BuscarPorRFCWidget(),
            ),
            FFRoute(
              name: 'chat',
              path: 'chat',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
              ),
            ),
            FFRoute(
              name: 'FacturacionPerfil',
              path: 'perfil/facturacion',
              requireAuth: true,
              builder: (context, params) => FacturacionPerfilWidget(),
            ),
            FFRoute(
              name: 'Cupones',
              path: 'cupones',
              builder: (context, params) => CuponesWidget(),
            ),
            FFRoute(
              name: 'ProductPageServicios',
              path: 'servicio',
              builder: (context, params) => ProductPageServiciosWidget(
                productId: params.getParam('productId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Chats',
              path: 'buzon-de-mensajes',
              requireAuth: true,
              builder: (context, params) => ChatsWidget(),
            ),
            FFRoute(
              name: 'AgendarServicio',
              path: 'servicios/servicio/agendar-servicio',
              builder: (context, params) => AgendarServicioWidget(),
            ),
            FFRoute(
              name: 'Ofertas',
              path: 'ofertas-categorias',
              builder: (context, params) => OfertasWidget(),
            ),
            FFRoute(
              name: 'MisServicios',
              path: 'mis-servicios',
              requireAuth: true,
              builder: (context, params) => MisServiciosWidget(),
            ),
            FFRoute(
              name: 'ServiciosSingle',
              path: 'servicios',
              builder: (context, params) => ServiciosSingleWidget(
                categoryId: params.getParam('categoryId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SobreSrConstruccion',
              path: 'SrConstruccion',
              requireAuth: true,
              builder: (context, params) => SobreSrConstruccionWidget(),
            ),
            FFRoute(
              name: 'ResumenSolicitudCotizacionCopy',
              path: 'resumenSolicitudCotizacionCopy',
              requireAuth: true,
              builder: (context, params) =>
                  ResumenSolicitudCotizacionCopyWidget(),
            ),
            FFRoute(
              name: 'OfertasMarcas',
              path: 'ofertas-marcas',
              builder: (context, params) => OfertasMarcasWidget(),
            ),
            FFRoute(
              name: 'DetallePedidoProgramado5DIAS',
              path: 'Pedido-Programado-5DIAS/:orderId',
              requireAuth: true,
              builder: (context, params) => DetallePedidoProgramado5DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
                bundleId: params.getParam('bundleId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OfertasTiendas',
              path: 'ofertas-tiendas',
              builder: (context, params) => OfertasTiendasWidget(),
            ),
            FFRoute(
              name: 'DetallePedidoProgramadoPickup',
              path: 'Pedido-Programado-Pickup/:orderId',
              requireAuth: true,
              builder: (context, params) => DetallePedidoProgramadoPickupWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'searchProductsSeller',
              path: 'buscar/productos-vendedor',
              requireAuth: true,
              builder: (context, params) => SearchProductsSellerWidget(),
            ),
            FFRoute(
              name: 'searchMarca',
              path: 'buscar-marca',
              requireAuth: true,
              builder: (context, params) => SearchMarcaWidget(),
            ),
            FFRoute(
              name: 'CategoriaSingleMARCA',
              path: 'marca/categoria/:brandId/:categoryId',
              builder: (context, params) => CategoriaSingleMARCAWidget(
                categoryId: params.getParam('categoryId', ParamType.String),
                brandId: params.getParam('brandId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SubcategoryProductListingMARCA',
              path: 'marca/subcategoria',
              builder: (context, params) =>
                  SubcategoryProductListingMARCAWidget(
                orderByPopularity:
                    params.getParam('orderByPopularity', ParamType.bool),
                orderByPrice: params.getParam('orderByPrice', ParamType.bool),
                filterBySale: params.getParam('filterBySale', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'CalculandoCostoDeEnvio',
              path: 'calculando',
              builder: (context, params) => CalculandoCostoDeEnvioWidget(
                checkoutId: params.getParam('checkoutId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CalculandoCostoDeEnvioPorSeller',
              path: 'calculando-por-seller',
              builder: (context, params) =>
                  CalculandoCostoDeEnvioPorSellerWidget(
                checkoutId: params.getParam('checkoutId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'MisPedidosHistorial',
              path: 'mis-pedidos-historial',
              requireAuth: true,
              builder: (context, params) => MisPedidosHistorialWidget(),
            ),
            FFRoute(
              name: 'listadoSellersCompleto',
              path: 'vendedores-todos',
              builder: (context, params) => ListadoSellersCompletoWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/home';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/Sin_ttulo_(1080__1500_px)_(1080__700_px)_(1080__500_px).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}
