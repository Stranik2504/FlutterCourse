import 'package:flutter/material.dart';
import '../theme/theme_toggle_action.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Данные успешно прошли проверку')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeToggleAction(), // добавили кнопку
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 100,
          bottom: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: AlignmentGeometry.bottomCenter,
                child: Text(
                  "Регистрация",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                inputType: InputFieldType.name,
                labelText: "ФИО",
                hintText: "Иванов Иван Иванович",
                prefixIcon: const Icon(Icons.person),
                controller: _nameController,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.email,
                labelText: "Email",
                hintText: "example@mail.com",
                prefixIcon: const Icon(Icons.email),
                controller: _emailController,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.password,
                labelText: "Пароль",
                hintText: "Пароль не менее 6 символов",
                prefixIcon: const Icon(Icons.security),
                controller: _passwordController,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.password,
                labelText: "Повторите пароль",
                hintText: "Пароль не менее 6 символов",
                prefixIcon: const Icon(Icons.security),
                controller: _passwordConfirmController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _submit(),
                child: Text(
                  "Зарегистрироваться",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Уже есть аккаунт? ",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  GestureDetector(
                    child: Text(
                      "Войдите",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
