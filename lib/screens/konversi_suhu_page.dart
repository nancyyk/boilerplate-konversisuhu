import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suhu_provider.dart';

class KonversiSuhuPage extends StatefulWidget {
  const KonversiSuhuPage({super.key});

  @override
  State<KonversiSuhuPage> createState() => _KonversiSuhuPageState();
}

class _KonversiSuhuPageState extends State<KonversiSuhuPage> {
  final celciusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SuhuProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffeef3ff),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Konversi Suhu",
          style: TextStyle(
            color: Color(0xff1565c0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: 20,
          ),
          child: Column(
            children: [
              /// ================= INPUT CARD =================
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Colors.black.withOpacity(0.07),
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: celciusController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Input Suhu Celcius",
                        prefixIcon: const Icon(
                          Icons.thermostat_rounded,
                          color: Color(0xff1565c0),
                        ),
                        filled: true,
                        fillColor: const Color(0xfff5f7ff),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTON ROW
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read<SuhuProvider>()
                                  .konversi(celciusController.text);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(
                                color: Color(0xff1565c0),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              "Konversi",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff1565c0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              celciusController.clear();
                              context.read<SuhuProvider>().reset();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(
                                color: Color(0xff1565c0),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff1565c0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ================= RESULT CARD =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1565c0),
                      Color(0xff42a5f5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Hasil Konversi",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _resultItem(
                      "Fahrenheit",
                      "${provider.fahrenheit.toStringAsFixed(1)} °F",
                    ),
                    const SizedBox(height: 12),
                    _resultItem(
                      "Kelvin",
                      "${provider.kelvin.toStringAsFixed(2)} K",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// RESULT ITEM
  Widget _resultItem(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1565c0),
            ),
          ),
        ],
      ),
    );
  }
}
