import 'package:flutter/material.dart';
import '../screens/konversi_suhu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (emailController.text == "admin@gmail.com" &&
        passwordController.text == "123456") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const KonversiSuhuPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email atau Password salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf2ff),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  color: Colors.blue.withOpacity(0.15),
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ICON
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Color(0xffe3edff),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thermostat,
                    size: 55,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 20),

                /// TITLE
                const Text(
                  "Konversi Suhu",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1c2b4a),
                  ),
                ),

                const SizedBox(height: 25),

                /// EMAIL
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: const Color(0xfff5f8ff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  ),
                ),

                const SizedBox(height: 15),

                /// PASSWORD
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: const Color(0xfff5f8ff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  ),
                ),

                const SizedBox(height: 25),

                /// LOGIN BUTTON (STYLE SAMA SEPERTI RESET)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: login,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xff1565c0),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1565c0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
