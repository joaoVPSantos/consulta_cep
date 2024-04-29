// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  final String cep;
  final String logradouro;
  final String? complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  AddressModel({
    required this.cep,
    required this.logradouro,
    this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      ibge: map['ibge'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as dynamic);

  @override
  String toString() {
    return 'AddressModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge)';
  }
}
