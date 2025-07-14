import 'package:flutter/material.dart';
import '/widgets/custom_textfield.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool showPass = false;

  void _login() {
    String email = emailCtrl.text.trim();
    String password = passCtrl.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Todos los campos son obligatorios.")));
      return;
    }

    if (!email.endsWith('@unah.hn')) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("El correo debe ser institucional (@unah.hn).")));
      return;
    }

    if (password != "20230001") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Número de cuenta incorrecto.")));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar sesión")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(controller: emailCtrl, label: "Correo", hint: "ejemplo@unah.hn", inputType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            CustomTextField(
              controller: passCtrl,
              label: "Número de cuenta",
              hint: "20230001",
              obscure: !showPass,
              suffixIcon: IconButton(
                icon: Icon(showPass ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Iniciar sesión")),
          ],
        ),
      ),
    );
  }
}
