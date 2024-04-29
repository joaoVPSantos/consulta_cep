import 'package:consulta_cep/core/ui/utils/theme_config.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Material(
      elevation: 2,
      shadowColor: ThemeConfig.corCinza,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenheight * .02, horizontal: screenWidth * 0.02),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Olá João',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  'SEJA BEM VINDO AO PORTAL 7PAY',
                  style: TextStyle(color: ThemeConfig.corCinza, fontSize: 11),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline_rounded)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_outlined)),
                const CircleAvatar(
                  radius: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
