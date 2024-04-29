part of 'search_address_cubit.dart';

sealed class SearchAddressState {}

final class SearchAddressInitial extends SearchAddressState {}

final class Loading extends SearchAddressState {}

final class Success extends SearchAddressState {
  final List<AddressModel> addressList;

  Success({required this.addressList});
}

final class Error extends SearchAddressState {
  final String message;

  Error({required this.message});
}
