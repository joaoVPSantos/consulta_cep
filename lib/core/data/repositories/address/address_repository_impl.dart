import 'dart:convert';

import 'package:consulta_cep/core/data/models/response_model.dart';
import 'package:consulta_cep/core/data/repositories/address/address_repository.dart';
import 'package:http/http.dart' as http;

class AddressRepositoryImpl implements AddressRepository {
  var client = http.Client();

  @override
  Future<ResponseModel> searchAdress(
      {required String logradouro,
      required String cidade,
      required String uf}) async {
    try {
      final response = await client.get(
        Uri.https('viacep.com.br', '/ws/$uf/$cidade/$logradouro/json/'),
      );
      return ResponseModel(
          statusCode: response.statusCode, data: jsonDecode(response.body));
    } on Exception catch (e) {
      throw (Exception(e));
    }
  }
}
