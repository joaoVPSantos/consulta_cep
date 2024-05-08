import 'package:flutter/material.dart';

import '../utils/theme_config.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: const Color(0xff303030),
      selectedIndex: 0,
      indicatorColor: ThemeConfig.corCinza,
      leading: Image.asset(
        'assets/images/logo-7pay.png',
        scale: 2.5,
      ),
      useIndicator: true,
      elevation: 10,
      labelType: NavigationRailLabelType.none,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(
            Icons.location_on_outlined,
            color: Color(0xffFF9101),
          ),
          selectedIcon: Icon(
            Icons.location_on_outlined,
            color: Color(0xffFF9101),
          ),
          label: Text('Busca CEP'),
        ),
        NavigationRailDestination(
          disabled: true,
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.transparent,
          ),
          selectedIcon: Icon(Icons.book),
          label: Text('Second'),
        ),
      ],
    );
  }
}
