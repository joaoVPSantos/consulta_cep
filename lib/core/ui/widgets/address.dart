import 'package:auto_size_text/auto_size_text.dart';
import 'package:consulta_cep/core/data/models/address_model.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final AddressModel address;

  const Address({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.cep,
            maxLines: 2,
          ),
        ),
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.bairro,
            maxLines: 2,
          ),
        ),
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.complemento ?? '',
            maxLines: 2,
          ),
        ),
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.bairro,
            maxLines: 2,
          ),
        ),
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.uf,
            maxLines: 2,
          ),
        ),
        Container(
          color: Colors.blue,
          width: 150,
          child: AutoSizeText(
            address.ibge,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
