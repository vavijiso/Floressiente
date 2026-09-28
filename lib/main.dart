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

  void enviar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          modoRegistro
              ? 'Cuenta creada (de mentiritas): el inicio con sesión llega en la Lección 7 🌿'
              : '¡Hola de nuevo! El inicio con sesión llega en la Lección 7 🌿',
        ),
      ),
    );
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
            // 🪪 Tu firma visual: tarjeta crema encimada con el login
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

//  Tarjeta menta sobre la foto (maqueta 1)
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


