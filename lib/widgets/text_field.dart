import 'package:flutter/material.dart';
enum InputFieldType { name, email, password }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Поле не может быть пустым";
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-я\s]+$'); // только буквы и пробелы

        if (!reg.hasMatch(value)) {
          return "Имя должно содержать только буквы и пробелы";
        }

      case InputFieldType.email:
        final reg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Email

        if (!reg.hasMatch(value)) {
          return "Не правильно указана почта. Проверте и повторите попытку";
        }

      case InputFieldType.password:
        final reg = RegExp(r'^(?=.*[A-Za-zА-Яа-я])(?=.*\d)(?=.*[+_-])[A-Za-zА-Яа-я\d+_-]{6,}$');

        if (!reg.hasMatch(value)) {
          return "Пароль не менее 6 символов, обязательно содержит буквы, цифры и символы (+, _, -)";
        }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputFieldType.password;

    return TextFormField(
      controller: widget.controller,
      obscureText: isPassword && _hidePassword,
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: const TextStyle(
        color: Color(0xFF192252),
        fontWeight: FontWeight.w400,
        fontFamily: 'CascadiaCode'
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Color(0xFF424F7B), fontSize: 16),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _hidePassword = !_hidePassword);
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF424F7B), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF424F7B), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: _validator,
    );
  }
}
