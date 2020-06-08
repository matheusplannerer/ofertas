import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPage extends StatefulWidget {
  final String checkoutId;
  const CheckoutPage({Key key, this.checkoutId = "Checkout"}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.checkoutId),
      ),
      body: WebView(
        initialUrl:
            "https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=${widget.checkoutId}",
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        onWebResourceError: (error) {
          print(error);
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}
