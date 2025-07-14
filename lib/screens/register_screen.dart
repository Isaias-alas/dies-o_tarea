import 'package:flutter/material.dart';
import '/widgets/custom_textfield.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool showPass = false;

  void _register() {
    String name = nameCtrl.text.trim();
    String email = emailCtrl.text.trim();
    String phone = phoneCtrl.text.trim();
    String password = passCtrl.text;

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      _showError("Todos los campos son obligatorios.");
      return;
    }

    if (!email.endsWith('@unah.hn')) {
      _showError("El correo debe ser institucional (@unah.hn).");
      return;
    }

    if (password.length < 6 || !_hasSpecialChar(password)) {
      _showError("La contraseña debe tener al menos 6 caracteres y un caracter especial.");
      return;
    }

    // Simula éxito
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("¡Registro exitoso!")),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  bool _hasSpecialChar(String text) {
    return text.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
  }

  void _showError(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(controller: nameCtrl, label: "Nombre", hint: "Tu nombre completo"),
            const SizedBox(height: 12),
            CustomTextField(controller: emailCtrl, label: "Correo", hint: "ejemplo@unah.hn", inputType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            CustomTextField(controller: phoneCtrl, label: "Teléfono", hint: "Tu número", inputType: TextInputType.phone),
            const SizedBox(height: 12),
            CustomTextField(
              controller: passCtrl,
              label: "Contraseña",
              hint: "Mínimo 6 caracteres + especial",
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
            ElevatedButton(onPressed: _register, child: const Text("Registrarse")),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
              child: const Text("¿Ya tienes cuenta? Inicia sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
