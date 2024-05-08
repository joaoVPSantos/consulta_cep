import 'package:auto_size_text/auto_size_text.dart';
import 'package:consulta_cep/core/data/models/address_model.dart';
import 'package:consulta_cep/core/data/repositories/address/address_repository_impl.dart';
import 'package:consulta_cep/core/ui/utils/theme_config.dart';
import 'package:consulta_cep/core/ui/widgets/appbar_custom.dart';
import 'package:consulta_cep/src/search_address/cubit/search_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/ui/widgets/button_custom.dart';
import '../../../core/ui/widgets/input_custom.dart';

class SearchAddressPage extends StatefulWidget {
  const SearchAddressPage({super.key});

  @override
  State<SearchAddressPage> createState() => _SearchAddressPageState();
}

class _SearchAddressPageState extends State<SearchAddressPage> {
  late SearchAddressCubit cubit;
  final TextEditingController _logradouro =
      TextEditingController(text: 'sebast');
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _logradouroSearch = TextEditingController();
  final TextEditingController _cidade =
      TextEditingController(text: 'rio verde');
  final TextEditingController _uf = TextEditingController(text: 'go');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final scrollController = ScrollController();
    return BlocProvider(
      create: (context) =>
          SearchAddressCubit(addressRepository: AddressRepositoryImpl()),
      child: BlocBuilder<SearchAddressCubit, SearchAddressState>(
        builder: (context, state) {
          cubit = context.read<SearchAddressCubit>();
          final addressList =
              (state is Success) ? state.addressList : <AddressModel>[];
          final error =
              (state is Error) ? state.message : 'Erro ao buscar endereços!';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarCustom(),
              Padding(
                padding: EdgeInsets.only(
                    top: screenheight * 0.05, left: screenWidth * 0.02),
                child: const AutoSizeText(
                  'Endereços',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SingleChildScrollView(
                child: switch (state.runtimeType) {
                  const (Loading) => const Center(
                      child: CircularProgressIndicator(
                        color: ThemeConfig.corPadrao,
                      ),
                    ),
                  const (Success) => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenheight * 0.04,
                              horizontal: screenWidth * 0.02),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ThemeConfig.corPadrao, width: 1)),
                            padding: EdgeInsets.symmetric(
                                vertical: screenheight * 0.03,
                                horizontal: screenWidth * 0.02),
                            child: screenWidth < 600
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomTextFormField(
                                                height: 40,
                                                width: screenWidth * .8,
                                                colorInput:
                                                    ThemeConfig.corCinza,
                                                labelText: 'Logradouro',
                                                controller: _logradouroSearch,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CustomTextFormField(
                                                height: 40,
                                                width: screenWidth * .8,
                                                colorInput:
                                                    ThemeConfig.corCinza,
                                                labelText: 'Bairro',
                                                controller: _bairro,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            ButtonCustom(
                                              height: 40,
                                              width: screenWidth * .8,
                                              label: 'Filtar',
                                              onPressed: () {
                                                cubit.filterLit(
                                                    addressList,
                                                    _bairro.text,
                                                    _logradouroSearch.text);
                                              },
                                              color: ThemeConfig.corPadrao,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ButtonCustom(
                                              height: 40,
                                              width: screenWidth * .8,
                                              label: 'Nova busca',
                                              onPressed: () {
                                                cubit.searchAgain();
                                              },
                                              color: ThemeConfig.corPadrao,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                        key: _formKey,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomTextFormField(
                                              height: 40,
                                              width: 150,
                                              colorInput: ThemeConfig.corCinza,
                                              labelText: 'Logradouro',
                                              controller: _logradouroSearch,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            CustomTextFormField(
                                              height: 40,
                                              width: 150,
                                              colorInput: ThemeConfig.corCinza,
                                              labelText: 'Bairro',
                                              controller: _bairro,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          ButtonCustom(
                                            height: 40,
                                            width: 150,
                                            label: 'Filtar',
                                            onPressed: () {
                                              cubit.filterLit(
                                                  addressList,
                                                  _bairro.text,
                                                  _logradouroSearch.text);
                                            },
                                            color: ThemeConfig.corPadrao,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          ButtonCustom(
                                            height: 40,
                                            width: 150,
                                            label: 'Nova busca',
                                            onPressed: () {
                                              cubit.searchAgain();
                                            },
                                            color: ThemeConfig.corPadrao,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenheight * 0.01,
                              horizontal: screenWidth * 0.02),
                          child: Container(
                              height: screenheight * .36,
                              width: screenWidth,
                              padding: EdgeInsets.symmetric(
                                  vertical: screenheight * 0.01,
                                  horizontal: screenWidth * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: ThemeConfig.corPadrao, width: 1)),
                              child: addressList.isEmpty
                                  ? const Center(
                                      child:
                                          Text('Nenhum endereço encontrado!'),
                                    )
                                  : Scrollbar(
                                      interactive: true,
                                      thickness: 10,
                                      thumbVisibility: true,
                                      trackVisibility: true,
                                      controller: scrollController,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: scrollController,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Center(
                                            child: DataTable(
                                              columns: const [
                                                DataColumn(
                                                  label: Text(
                                                    'CEP',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Logradouro',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Complemento',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Bairro',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Localidade',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'UF',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'IBGE',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                              rows: List.generate(
                                                addressList.length,
                                                (index) {
                                                  return DataRow.byIndex(
                                                    index: index,
                                                    cells: [
                                                      DataCell(Text(
                                                        addressList[index].cep,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        addressList[index]
                                                            .logradouro,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        addressList[index]
                                                                .complemento ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        maxLines: 2,
                                                        addressList[index]
                                                            .bairro,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        addressList[index]
                                                            .localidade,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        addressList[index].uf,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      DataCell(Text(
                                                        addressList[index].ibge,
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                    ],
                                                  );
                                                },
                                                growable: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                        ),
                      ],
                    ),
                  const (Error) => Center(
                      child: Text(error),
                    ),
                  _ => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenheight * 0.1,
                          horizontal: screenWidth * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ThemeConfig.corPadrao, width: 1)),
                        padding: EdgeInsets.symmetric(
                            vertical: screenheight * 0.03,
                            horizontal: screenWidth * 0.02),
                        child: screenWidth < 600
                            ? Center(
                                child: Column(
                                  children: [
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextFormField(
                                            height: 40,
                                            width: screenWidth * .8,
                                            validator: (p0) {
                                              if (p0 == null || p0.isEmpty) {
                                                return '*Campo obrigatório';
                                              }
                                              return null;
                                            },
                                            colorInput: ThemeConfig.corCinza,
                                            labelText: 'Logradouro',
                                            controller: _logradouro,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomTextFormField(
                                            height: 40,
                                            width: screenWidth * .8,
                                            validator: (p0) {
                                              if (p0 == null || p0.isEmpty) {
                                                return '*Campo obrigatório';
                                              }
                                              return null;
                                            },
                                            colorInput: ThemeConfig.corCinza,
                                            labelText: 'Cidade',
                                            controller: _cidade,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomTextFormField(
                                            height: 40,
                                            width: screenWidth * .8,
                                            validator: (p0) {
                                              if (p0 == null || p0.isEmpty) {
                                                return '*Campo obrigatório';
                                              }
                                              return null;
                                            },
                                            colorInput: ThemeConfig.corCinza,
                                            labelText: 'UF',
                                            controller: _uf,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ButtonCustom(
                                      height: 40,
                                      width: screenWidth * .8,
                                      label: 'Buscar',
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          cubit.searchAdress(
                                              logradouro: _logradouro.text,
                                              cidade: _cidade.text,
                                              uf: _uf.text);
                                        }
                                      },
                                      color: ThemeConfig.corPadrao,
                                    )
                                  ],
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextFormField(
                                          height: 40,
                                          width: 150,
                                          validator: (p0) {
                                            if (p0 == null || p0.isEmpty) {
                                              return '*Campo obrigatório';
                                            }
                                            return null;
                                          },
                                          colorInput: ThemeConfig.corCinza,
                                          labelText: 'Logradouro',
                                          controller: _logradouro,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomTextFormField(
                                          height: 40,
                                          width: 150,
                                          validator: (p0) {
                                            if (p0 == null || p0.isEmpty) {
                                              return '*Campo obrigatório';
                                            }
                                            return null;
                                          },
                                          colorInput: ThemeConfig.corCinza,
                                          labelText: 'Cidade',
                                          controller: _cidade,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomTextFormField(
                                          height: 40,
                                          width: 150,
                                          validator: (p0) {
                                            if (p0 == null || p0.isEmpty) {
                                              return '*Campo obrigatório';
                                            }
                                            return null;
                                          },
                                          colorInput: ThemeConfig.corCinza,
                                          labelText: 'UF',
                                          controller: _uf,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ButtonCustom(
                                    height: 40,
                                    width: 150,
                                    label: 'Buscar',
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        cubit.searchAdress(
                                            logradouro: _logradouro.text,
                                            cidade: _cidade.text,
                                            uf: _uf.text);
                                      }
                                    },
                                    color: ThemeConfig.corPadrao,
                                  )
                                ],
                              ),
                      ),
                    ),
                },
              )
            ],
          );
        },
      ),
    );
  }
}
