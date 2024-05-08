import 'package:consulta_cep/core/ui/utils/theme_config.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Color? colorInput;
  final String? Function(String?)? validator;
  final double height;
  final double width;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.colorInput,
      this.keyboardType,
      required this.controller,
      this.validator,
      required this.height,
      required this.width});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  double finalHeight = 0;
  late MaterialStatesController materialStatesController;

  @override
  void initState() {
    finalHeight = widget.height;
    materialStatesController = MaterialStatesController();
    materialStatesController.addListener(() {
      Future.delayed(
        Duration.zero,
        () {
          if (materialStatesController.value.contains(MaterialState.error)) {
            if (finalHeight == widget.height) {
              setState(() {
                finalHeight += 20;
              });
            }
          } else {
            setState(() {
              finalHeight = widget.height;
            });
          }
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: finalHeight,
      child: TextFormField(
        statesController: materialStatesController,
        controller: widget.controller,
        cursorColor: widget.colorInput,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: TextStyle(color: Colors.grey[900], fontSize: 12),
        decoration: InputDecoration(
          isCollapsed: false,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeConfig.corCinza),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.labelText,
          hintStyle:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeConfig.corCinza),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
