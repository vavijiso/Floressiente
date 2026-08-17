import 'package:flutter/material.dart';

// 🎨 Paleta de marca Floressiente
class ColoresMarca {
  static const Color lima = Color.fromRGBO(177, 204, 52, 1);
  static const Color fondo = Color.fromRGBO(241, 246, 249, 1);
  static const Color menta = Color.fromRGBO(172, 217, 212, 1);
  static const Color bosque = Color.fromRGBO(38, 66, 60, 1);
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: ColoresMarca.lima),
        useMaterial3: true,
      ),
      home: const InicioAnonimo(),
    );
  }
}

class InicioAnonimo extends StatelessWidget {
  const InicioAnonimo({super.key});

  // Como no hay sesión iniciada, todo camino lleva a acceso
  void irAcceso(BuildContext context, {bool registro = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PantallaAcceso(iniciarEnRegistro: registro),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresMarca.fondo,
      appBar: AppBar(
        backgroundColor: ColoresMarca.bosque,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_florist),
            SizedBox(width: 8),
            Text('FLORESSIENTE'),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => irAcceso(context),
            child: const Text(
              'Inicia sesión',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => irAcceso(context, registro: true),
            child: const Text(
              'Registrarse',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🌿 HERO: imagen de fondo con texto encima
            SizedBox(
              height: 260,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/hero_plantas.jpg', fit: BoxFit.cover),
                  // Velo oscuro para que el texto se lea bien
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColoresMarca.bosque.withOpacity(0.45),
                          ColoresMarca.bosque.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Qué planta quieres diagnosticar el día de hoy?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Descubre qué tiene tu planta con una sola foto.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => irAcceso(context),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Diagnosticar mi planta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColoresMarca.lima,
                      foregroundColor: ColoresMarca.bosque,
                      padding: const EdgeInsets.all(16),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    '¿Cómo funciona?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColoresMarca.bosque,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
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
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: ColoresMarca.menta,
              radius: 28,
              child: Icon(icono, size: 28, color: ColoresMarca.bosque),
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColoresMarca.bosque,
              ),
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

// 🔐 Pantalla de inicio de sesión / registro
class PantallaAcceso extends StatefulWidget {
  const PantallaAcceso({super.key, this.iniciarEnRegistro = false});

  final bool iniciarEnRegistro;

  @override
  State<PantallaAcceso> createState() => _PantallaAccesoState();
}

class _PantallaAccesoState extends State<PantallaAcceso> {
  late bool modoRegistro = widget.iniciarEnRegistro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresMarca.fondo,
      appBar: AppBar(
        backgroundColor: ColoresMarca.bosque,
        foregroundColor: Colors.white,
        title: Text(modoRegistro ? 'Crear cuenta' : 'Inicia sesión'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            if (modoRegistro) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
            ],
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColoresMarca.lima,
                foregroundColor: ColoresMarca.bosque,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Bienvenida a Floressiente! (Firebase llegará en otra lección)'),
                  ),
                );
              },
              child: Text(modoRegistro ? 'Crear cuenta' : 'Entrar'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                setState(() {
                  modoRegistro = !modoRegistro;
                });
              },
              child: Text(
                modoRegistro
                    ? '¿Ya tienes cuenta? Inicia sesión'
                    : '¿No tienes cuenta? Regístrate',
              ),
            ),
          ],
        ),
      ),
    );
  }
}