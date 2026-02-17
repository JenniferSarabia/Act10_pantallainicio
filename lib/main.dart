import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos un tema base para la aplicación
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Urba y Flow',
      debugShowCheckedModeBanner: false, // Esta línea quita la etiqueta de debug
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF002B80),
        scaffoldBackgroundColor: const Color(0xFFE6F0FF),
        textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
          displayLarge: GoogleFonts.bebasNeue(
            textStyle: textTheme.displayLarge,
            fontSize: 36,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.bebasNeue(
            textStyle: textTheme.headlineMedium,
            fontSize: 32,
            color: const Color(0xFF002B80),
          ),
          titleLarge: GoogleFonts.bebasNeue(
            textStyle: textTheme.titleLarge,
            fontSize: 28,
            letterSpacing: 2,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.bebasNeue(
            textStyle: textTheme.titleMedium,
            fontSize: 18,
            color: const Color(0xFF003366),
          ),
          bodySmall: GoogleFonts.montserrat(
            textStyle: textTheme.bodySmall,
            fontSize: 10,
            color: const Color(0xFFD9E6FF),
          ),
          bodyLarge: GoogleFonts.montserrat(
            textStyle: textTheme.bodyLarge,
            fontSize: 16,
            color: Colors.white,
          ),
          labelLarge: GoogleFonts.montserrat(
            textStyle: textTheme.labelLarge,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF004D99),
            fontSize: 16,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002B80),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF002B80),
          secondary: const Color(0xFF0059B3),
          background: const Color(0xFFE6F0FF),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroSection(context),
                  const SizedBox(height: 30),
                  _buildSectionTitle(context, "Recién agregados"),
                  _buildProductGrid(dummyProductsNuevos),
                  const SizedBox(height: 40),
                  _buildSectionTitle(context, "Destacados del mes"),
                  _buildProductGrid(dummyProductsDestacados),
                  const SizedBox(height: 60), // Espacio para el footer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Header con el estilo de Urba y Flow
  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      expandedHeight: 80,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
          ),
        ),
        child: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(left: 20, bottom: 12),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("URBA Y FLOW",
                  style: Theme.of(context).textTheme.titleLarge),
              Text("Tu estilo, tu esencia",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () {}),
      ],
    );
  }

  // Sección Hero (Azul con degradado)
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            const Color(0xFF66A3FF)
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 15,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu estilo, tu flow",
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 8),
          Text("Ropa urbana creada para destacar en cada movimiento.",
              style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  // Galería de productos (Grid adaptable)
  Widget _buildProductGrid(List<Map<String, dynamic>> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return _buildProductCard(context, item);
      },
    );
  }

  // La "Tarjeta" del CSS
  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                product['imagen'],
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['nombre'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                if (product['precio_anterior'] != null)
                  Text(
                    "\$${product['precio_anterior']}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                Text(
                  "\$${product['precio']}",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Datos de prueba actualizados con imágenes exclusivas de ropa
final dummyProductsNuevos = [
  {
    'nombre': 'Oversize Tee',
    'precio': '29.99',
    'imagen':
        'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Urban Hoodie',
    'precio': '45.00',
    'imagen':
        'https://images.pexels.com/photos/544966/pexels-photo-544966.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Flannel Shirt',
    'precio': '38.50',
    'imagen':
        'https://images.pexels.com/photos/769749/pexels-photo-769749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Tech Joggers',
    'precio': '42.00',
    'imagen':
        'https://images.pexels.com/photos/7023793/pexels-photo-7023793.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
];

final dummyProductsDestacados = [
  {
    'nombre': 'Cargo Pants',
    'precio': '35.00',
    'precio_anterior': '50.00',
    'imagen':
        'https://images.pexels.com/photos/8261824/pexels-photo-8261824.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Bomber Jacket',
    'precio': '65.00',
    'imagen':
        'https://images.pexels.com/photos/1124468/pexels-photo-1124468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Printed Denim Jacket',
    'precio': '89.99',
    'precio_anterior': '110.00',
    'imagen':
        'https://images.pexels.com/photos/20364402/pexels-photo-20364402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
  {
    'nombre': 'Distressed Denim Jeans',
    'precio': '49.99',
    'imagen':
        'https://images.pexels.com/photos/1082528/pexels-photo-1082528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  },
];
