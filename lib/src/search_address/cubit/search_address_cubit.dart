import 'package:bloc/bloc.dart';
import 'package:consulta_cep/core/data/repositories/address/address_repository_impl.dart';

import '../../../core/data/models/address_model.dart';
import '../../../core/data/repositories/address/address_repository.dart';

part 'search_address_state.dart';

class SearchAddressCubit extends Cubit<SearchAddressState> {
  SearchAddressCubit({required AddressRepositoryImpl addressRepository})
      : _addressRepository = addressRepository,
        super(SearchAddressInitial());

  final AddressRepository _addressRepository;

  Future<void> searchAdress(
      {required String logradouro,
      required String cidade,
      required String uf}) async {
    try {
      emit(Loading());
      final response = await _addressRepository.searchAdress(
          cidade: cidade, logradouro: logradouro, uf: uf);
      if (response.statusCode == 200) {
        List<AddressModel> addressList = [
          for (final i in response.data) AddressModel.fromMap(i)
        ];
        emit(Success(addressList: addressList));
      } else {
        emit(Error(
            message:
                'Ocorreu um erro ao realizar a busca, tente novamente mais tarde!'));
      }
    } on Exception {
      emit(Error(message: 'Erro ao buscar dados!'));
    }
  }

  filterLit(List<AddressModel> address, String? bairro, String? logradouro) {
    emit(Success(
        addressList: address
            .where((element) =>
                element.bairro
                    .toUpperCase()
                    .contains(bairro.toString().toUpperCase()) &&
                element.logradouro
                    .toUpperCase()
                    .contains(logradouro.toString().toUpperCase()))
            .toList()));
  }

  searchAgain() {
    emit(SearchAddressInitial());
  }
}
