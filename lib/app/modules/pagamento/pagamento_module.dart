import 'package:ofertas/app/modules/pagamento/pages/checkout/checkout_controller.dart';
import 'package:ofertas/app/modules/pagamento/pagamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/pagamento/pagamento_page.dart';
import 'package:ofertas/app/modules/pagamento/pages/checkout/checkout_page.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CheckoutController()),
        Bind((i) => PagamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PagamentoPage()),
        Router('/checkout',
            child: (_, args) => CheckoutPage(
                  checkoutId: args.data,
                ))
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
