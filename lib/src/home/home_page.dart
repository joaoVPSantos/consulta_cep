import 'package:consulta_cep/core/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';

import '../search_address/view/search_address_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Row(
            children: [
              Navbar(),
            ],
          ),
          Expanded(child: SearchAddressPage()),
        ],
      ),
    );
  }
}
