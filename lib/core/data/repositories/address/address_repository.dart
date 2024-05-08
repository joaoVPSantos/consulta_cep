import '../../models/response_model.dart';

abstract class AddressRepository {
  Future<ResponseModel> searchAdress(
      {required String logradouro, required String cidade, required String uf});
}
