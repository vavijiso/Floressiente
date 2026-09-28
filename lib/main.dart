import 'package:flutter/material.dart';

// 🎨 Paleta de marca Floressiente
class ColoresMarca {
  static const Color lima = Color.fromRGBO(177, 204, 52, 1);
  static const Color fondo = Color.fromRGBO(241, 246, 249, 1);
  static const Color menta = Color.fromRGBO(172, 217, 212, 1);
  static const Color bosque = Color.fromRGBO(38, 66, 60, 1);
  static const Color petroleo = Color.fromRGBO(45, 110, 126, 1);
  static const Color crema = Color.fromRGBO(239, 233, 224, 1);
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

// 🏠 INICIO ANÓNIMO v2 (maqueta 1): foto completa + login embebido
class InicioAnonimo extends StatefulWidget {
  const InicioAnonimo({super.key});

  @override
  State<InicioAnonimo> createState() => _InicioAnonimoState();
}

class _InicioAnonimoState extends State<InicioAnonimo> {
  bool modoRegistro = false;

  // 🧠 Controladores para leer lo que escribe la persona
  final _nombreCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  void enviar() {
    // Si se registró y escribió un nombre, úsalo. Si no, "Annie".
    final nombre = (modoRegistro && _nombreCtrl.text.trim().isNotEmpty)
        ? _nombreCtrl.text.trim()
        : 'Annie';

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => InicioConSesion(nombre: nombre),
      ),
    );
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresMarca.crema,
      appBar: AppBar(
        backgroundColor: ColoresMarca.petroleo,
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
            onPressed: () => setState(() => modoRegistro = false),
            child: const Text(
              'Inicia sesión',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => setState(() => modoRegistro = true),
            child: const Text(
              'Regístrate',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('El menú ☰ llega en una lección futura')),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🌿 Foto a sangre con velo y tarjetas encima
            SizedBox(
              height: 430,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/hero_plantas.png', fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColoresMarca.bosque.withOpacity(0.55),
                          ColoresMarca.bosque.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        const Text(
                          '¿CÓMO FUNCIONA?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TarjetaComoFunciona(
                          icono: Icons.photo_camera,
                          titulo: 'Toma una foto',
                          descripcion: 'CAPTURA LA HOJA O ZONA AFECTADA',
                        ),
                        const SizedBox(height: 12),
                        const TarjetaComoFunciona(
                          icono: Icons.smart_toy,
                          titulo: 'La IA analiza',
                          descripcion: 'DETECTA PLAGAS, RIEGO Y OTROS',
                        ),
                        const SizedBox(height: 12),
                        const TarjetaComoFunciona(
                          icono: Icons.calendar_month,
                          titulo: 'Recibe tu diagnóstico',
                          descripcion: 'SOLUCIONES CLARAS + RECORDATORIOS',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 🪪 Tarjeta crema encimada con el login
            Container(
              decoration: const BoxDecoration(
                color: ColoresMarca.crema,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    modoRegistro ? '¡Únete a Floressiente!' : 'Hola de nuevo!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColoresMarca.petroleo,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (modoRegistro) ...[
                    TextField(
                      controller: _nombreCtrl,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        filled: true,
                        fillColor: const Color.fromRGBO(213, 224, 230, 1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  TextField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: const Color.fromRGBO(213, 224, 230, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: const Color.fromRGBO(213, 224, 230, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColoresMarca.petroleo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: enviar,
                    child: Text(modoRegistro ? 'Crear cuenta' : 'Iniciar sesión'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: ColoresMarca.petroleo),
                    ),
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

// 🟩 Tarjeta menta sobre la foto (maqueta 1)
class TarjetaComoFunciona extends StatelessWidget {
  const TarjetaComoFunciona({
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColoresMarca.menta,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icono, color: ColoresMarca.petroleo),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColoresMarca.petroleo,
                  ),
                ),
                Text(
                  descripcion,
                  style: const TextStyle(fontSize: 11, color: ColoresMarca.bosque),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🏡 INICIO CON SESIÓN (maqueta 2): cámara + Mis plantas interior/exterior
class InicioConSesion extends StatelessWidget {
  const InicioConSesion({super.key, required this.nombre});

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresMarca.fondo,
      appBar: AppBar(
        backgroundColor: ColoresMarca.petroleo,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_florist),
            const SizedBox(width: 8),
            Text('¡Buen día, $nombre!'),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: ColoresMarca.lima,
            radius: 16,
            child: Text(
              nombre.isNotEmpty ? nombre[0].toUpperCase() : '?',
              style: const TextStyle(
                color: ColoresMarca.bosque,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('El menú ☰ llega en una lección futura')),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sección superior: pregunta + tarjeta de cámara
            Container(
              color: ColoresMarca.fondo,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    '¿Qué plantas quieres diagnosticar el día de hoy?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColoresMarca.petroleo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Descubre qué tienen tus plantas con una sola foto',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('La pantalla de diagnóstico llega en la Lección 8 📷'),
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(173, 216, 250, 1),
                            Color.fromRGBO(200, 235, 255, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // Nubes decorativas
                          const Positioned(
                            top: 20,
                            left: 30,
                            child: Icon(Icons.cloud, color: Colors.white, size: 40),
                          ),
                          const Positioned(
                            top: 35,
                            right: 50,
                            child: Icon(Icons.cloud, color: Colors.white, size: 30),
                          ),
                          // Colinas verdes abajo
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                color: ColoresMarca.lima,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              ),
                            ),
                          ),
                          // Cámara al centro
                          const Center(
                            child: Icon(Icons.camera_alt, size: 48, color: ColoresMarca.petroleo),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tarjeta crema encimada: Mis plantas
            Container(
              decoration: const BoxDecoration(
                color: ColoresMarca.crema,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Mis plantas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColoresMarca.petroleo,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: GrupoPlantas(
                          titulo: 'Plantas interior',
                          cantidad: '5 plantas',
                          icono: Icons.park,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: GrupoPlantas(
                          titulo: 'Plantas exterior',
                          cantidad: '8 plantas',
                          icono: Icons.local_florist,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Sección menta: problema común
            Container(
              color: ColoresMarca.menta,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Problema común en tus plantas registradas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColoresMarca.bosque,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tus plantas de interior muestran signos de exceso de riego. '
                    'Reduce la frecuencia y verifica el drenaje de las macetas.',
                    style: TextStyle(fontSize: 13, color: ColoresMarca.bosque.withOpacity(0.8)),
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

// 🪴 Grupo de plantas (interior / exterior)
class GrupoPlantas extends StatelessWidget {
  const GrupoPlantas({
    super.key,
    required this.titulo,
    required this.cantidad,
    required this.icono,
  });

  final String titulo;
  final String cantidad;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: ColoresMarca.menta.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(icono, size: 48, color: ColoresMarca.bosque),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColoresMarca.petroleo,
          ),
        ),
        Text(
          cantidad,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}git add .
