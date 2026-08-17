import 'package:flutter/material.dart';

void main() {
  runApp(const FloressienteApp());
}

class FloressienteApp extends StatelessWidget {
  const FloressienteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floressiente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const InicioAnonimo(),
    );
  }
}

class InicioAnonimo extends StatelessWidget {
  const InicioAnonimo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLORESSIENTE'),
        actions: [
          TextButton(
            onPressed: () {
              // Lección 3: aquí iremos a iniciar sesión
            },
            child: const Text('Inicia sesión'),
          ),
          TextButton(
            onPressed: () {
              // Lección 3: aquí iremos a registrarse
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text(
              '¿Qué planta quieres diagnosticar el día de hoy?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Descubre qué tiene tu planta con una sola foto.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Lección 4: aquí iremos al diagnóstico con foto
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Diagnosticar mi planta'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '¿Cómo funciona?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: TarjetaPaso(
                    icono: Icons.photo_camera,
                    titulo: '1. Toma una foto',
                    descripcion: 'Captura la hoja o zona afectada de tu planta.',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TarjetaPaso(
                    icono: Icons.smart_toy,
                    titulo: '2. La IA analiza',
                    descripcion: 'Detecta plagas, riego y problemas de luz.',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TarjetaPaso(
                    icono: Icons.calendar_month,
                    titulo: '3. Recibe tu plan',
                    descripcion: 'Soluciones claras y recordatorios.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaPaso extends StatelessWidget {
  const TarjetaPaso({
    super.key,
    required this.icono,
    required this.titulo,
    required this.descripcion,
  });

  final IconData icono;
  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icono, size: 40, color: Colors.green),
            const SizedBox(height: 8),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              descripcion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}