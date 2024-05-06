import 'package:consulta_cep/core/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';

import '../search_address/view/search_address_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            screenWidth < 600
                ? Container()
                : const Row(
                    children: [
                      Navbar(),
                    ],
                  ),
            const Expanded(child: SearchAddressPage()),
          ],
        ),
      ),
    );
  }
}
