import 'package:flutter/material.dart';

import 'widgets/custom_card_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const CustomCardHeaderWidget());
  }
}
