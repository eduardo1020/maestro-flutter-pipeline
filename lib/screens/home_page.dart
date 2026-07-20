import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool executed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maestro + Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Estado da automação",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              executed
                  ? "🟢 Automação executada"
                  : "⚪ Aguardando clique",
              key: const Key("statusMessage"),
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 40),

            // Botão Executar (Só fica ativo/visível se ainda não foi executado)
            if (!executed)
              ElevatedButton(
                key: const Key("executeButton"),
                onPressed: () {
                  setState(() {
                    executed = true;
                  });
                },
                child: const Text("EXECUTAR"),
              ),

            // Botão Resetar (Aparece quando a automação já foi executada)
            if (executed)
              ElevatedButton(
                key: const Key("resetButton"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  foregroundColor: Colors.red.shade900,
                ),
                onPressed: () {
                  setState(() {
                    executed = false;
                  });
                },
                child: const Text("RESETAR"),
              ),
          ],
        ),
      ),
    );
  }
}