import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatefulWidget {
  final String paymentKey;
  final String iframeId;

  const PaymentView({
    super.key,
    required this.paymentKey,
    required this.iframeId,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final paymentUrl =
        "https://accept.paymob.com/api/acceptance/iframes/${widget.iframeId}?payment_token=${widget.paymentKey}";

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paymob Checkout")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
