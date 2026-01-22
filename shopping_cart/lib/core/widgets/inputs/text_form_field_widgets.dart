import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';

class TextFormFieldWidgets extends StatefulWidget {
  final String? inputLabel;
  final String? hintText; // Novo: para a barra de pesquisa
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final bool isPassword;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final IconData? prefixIcon; // Novo: para o ícone de lupa

  const TextFormFieldWidgets({
    this.inputLabel,
    this.hintText,
    required this.controller,
    this.validator,
    required this.focusNode,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
    this.prefixIcon,
    super.key,
  });

  @override
  State<TextFormFieldWidgets> createState() => _TextFormFieldWidgetsState();
}

class _TextFormFieldWidgetsState extends State<TextFormFieldWidgets> {
  late ValueNotifier<bool> _obscureTextVN;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureTextVN = ValueNotifier<bool>(widget.isPassword);
    widget.focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() => _hasFocus = widget.focusNode.hasFocus);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    _obscureTextVN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.inputLabel != null) ...[
          Text(widget.inputLabel!, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
        ],
        ValueListenableBuilder(
          valueListenable: _obscureTextVN,
          builder: (_, isObscure, __) {
            return TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              obscureText: isObscure,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: widget.validator,
              style: TextStyle(color: _hasFocus ? Colors.black : ShoppingAppColors.greyText),
              decoration: InputDecoration(
                hintText: widget.hintText,
                filled: true,
                fillColor: _hasFocus ? Colors.white : ShoppingAppColors.backgroundColor,
                prefixIcon: widget.prefixIcon != null 
                    ? Icon(widget.prefixIcon, color: ShoppingAppColors.primaryColor) 
                    : null,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () => _obscureTextVN.value = !_obscureTextVN.value,
                        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                      )
                    : null,
                border: _buildBorder(Colors.transparent),
                enabledBorder: _buildBorder(Colors.transparent),
                focusedBorder: _buildBorder(ShoppingAppColors.primaryColor),
                errorBorder: _buildBorder(ShoppingAppColors.errorColor),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            );
          },
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }
}