import 'package:flutter/material.dart';
import '../routes.dart';
import '../theme/theme_toggle_action.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Данные успешно прошли проверку')),
      );

      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Добро пожаловать!\nВойдите в свой аккаунт\nИли создайте новый",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        toolbarHeight: 150,
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
              CustomTextFormField(
                inputType: InputFieldType.email,
                labelText: "Email:",
                hintText: "example@mail.com",
                prefixIcon: const Icon(Icons.email),
                controller: _emailController,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                inputType: InputFieldType.password,
                labelText: "Пароль:",
                hintText: "Пароль не менее 6 символов",
                prefixIcon: const Icon(Icons.security),
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: AlignmentGeometry.topRight,
                child: Text(
                  "Забыл пароль?",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(),
                child: Text(
                  "Войти",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Нет аккаунта? ",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  GestureDetector(
                    child: Text(
                      "Зарегистрируйтесь",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.register);
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
