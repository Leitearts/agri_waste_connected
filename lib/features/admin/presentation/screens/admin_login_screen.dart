import 'package:flutter/material.dart';
import '../../../../../core/services/navigation_service.dart';

//class AdminLoginScreen extends StatelessWidget {
  //const AdminLoginScreen({super.key});

  //@override
  //Widget build(BuildContext context) {
    //return Scaffold(
      //body: Padding(
        //padding: const EdgeInsets.all(16.0),
        //child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            //const Text('Recycle Farm Manager Login'),
            //const SizedBox(height: 32),
            //TextField(
              //decoration: const InputDecoration(
                //labelText: 'Email',
                //border: OutlineInputBorder(),
              //),
            //),
            //const SizedBox(height: 16),
            //TextField(
              //obscureText: true,
              //decoration: const InputDecoration(
               // labelText: 'Password',
                //border: OutlineInputBorder(),
              //),
            //),
            //const SizedBox(height: 16),
           // SizedBox(
             // width: double.infinity,
              //child: ElevatedButton(
                //onPressed: () {
                  //NavigationService.replace('/admin/dashboard');
                //},
                //child: const Text('LOG IN'),
              //),
            //),
            //TextButton(
             // onPressed: () {},
              //child: const Text('Forgot password?'),
            //),
          //],
        //),
      //),
    //);
 // }
//}

// agriwaste_login.dart
// AgriWaste Connect — Company Portal Login Screen
// Premium Flutter Material 3 UI | Desktop + Mobile Responsive
// Ready for Bloc integration

import 'dart:math' as math;
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────
//  Entry Point
// ─────────────────────────────────────────────────────────────
void main() {
  runApp(const AgriWasteApp());
}

class AgriWasteApp extends StatelessWidget {
  const AgriWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriWaste Connect — Company Portal',
      debugShowCheckedModeBanner: false,
      theme: AgriWasteTheme.themeData,
      home: const LoginScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Design Tokens
// ─────────────────────────────────────────────────────────────
class AgriWasteTheme {
  // Core Palette
  static const Color deepGreen = Color(0xFF0D3D2B);
  static const Color forestGreen = Color(0xFF1A6642);
  static const Color midGreen = Color(0xFF2E8B57);
  static const Color accentGreen = Color(0xFF3DAA6E);
  static const Color lightGreen = Color(0xFFD4EDDA);
  static const Color softBeige = Color(0xFFF7F4EE);
  static const Color warmBeige = Color(0xFFEDE8DF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF8F9FA);
  static const Color neutral100 = Color(0xFFF1F3F4);
  static const Color neutral200 = Color(0xFFE8EAED);
  static const Color neutral400 = Color(0xFFBDC1C6);
  static const Color neutral600 = Color(0xFF80868B);
  static const Color neutral800 = Color(0xFF3C4043);
  static const Color neutral900 = Color(0xFF202124);
  static const Color errorRed = Color(0xFFB00020);
  static const Color errorRedLight = Color(0xFFFCE8E6);

  // Gradients
  static const LinearGradient leftPanelGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF062518), Color(0xFF0D3D2B), Color(0xFF1A5C3A)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF1A6642), Color(0xFF2E8B57)],
  );

  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          brightness: Brightness.light,
          primary: forestGreen,
          secondary: accentGreen,
          surface: white,
          error: errorRed,
        ),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: white,
            letterSpacing: -0.5,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: deepGreen,
            letterSpacing: -0.3,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: deepGreen,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 15,
            color: neutral800,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 13,
            color: neutral600,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: neutral50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: neutral200, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: neutral200, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: forestGreen, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: errorRed, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: errorRed, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          labelStyle: const TextStyle(color: neutral600, fontSize: 14),
          floatingLabelStyle: const TextStyle(color: forestGreen, fontSize: 12),
          hintStyle: const TextStyle(color: neutral400, fontSize: 14),
        ),
      );
}

// ─────────────────────────────────────────────────────────────
//  Login Screen (Root)
// ─────────────────────────────────────────────────────────────
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const double _mobileBreakpoint = 768.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AgriWasteTheme.softBeige,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= _mobileBreakpoint;
          return isDesktop
              ? const _DesktopLayout()
              : const _MobileLayout();
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Desktop Layout — Split Screen
// ─────────────────────────────────────────────────────────────
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // LEFT — illustration + branding (55%)
        Expanded(
          flex: 55,
          child: _LeftBrandingPanel(),
        ),
        // RIGHT — login card (45%)
        Expanded(
          flex: 45,
          child: Container(
            color: AgriWasteTheme.softBeige,
            child: const Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 40),
                child: _LoginCard(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Mobile Layout — Vertical Stack
// ─────────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Mobile branding header
          _MobileBrandingHeader(),
          // Login card
          const Padding(
            padding: EdgeInsets.all(20),
            child: _LoginCard(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Left Branding Panel (Desktop)
// ─────────────────────────────────────────────────────────────
class _LeftBrandingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AgriWasteTheme.leftPanelGradient,
      ),
      child: Stack(
        children: [
          // Background geometric pattern
          const Positioned.fill(child: _EcoPatternBackground()),
          // SVG-style industrial eco illustration
          const Positioned.fill(child: _EcoIllustration()),
          // Gradient overlay (bottom fade for text readability)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xCC062518),
                  ],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
          ),
          // Content overlay
          Positioned(
            left: 48,
            right: 48,
            bottom: 64,
            child: _BrandingContent(),
          ),
          // Top logo bar
          Positioned(
            top: 40,
            left: 48,
            child: _PanelLogoMark(),
          ),
          // Floating stat chips
          Positioned(
            top: 120,
            right: 40,
            child: _StatChip(
              icon: Icons.local_shipping_outlined,
              label: 'Active Routes',
              value: '1,284',
            ),
          ),
          Positioned(
            top: 200,
            right: 40,
            child: _StatChip(
              icon: Icons.recycling,
              label: 'Tons Processed',
              value: '48.6K',
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Eco Pattern Background (subtle geometric nodes)
// ─────────────────────────────────────────────────────────────
class _EcoPatternBackground extends StatelessWidget {
  const _EcoPatternBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HexGridPainter(),
    );
  }
}

class _HexGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x0AFFFFFF)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double hexSize = 48;
    const double hexHeight = hexSize * 1.732;
    const double hexWidth = hexSize * 2;

    for (double y = -hexHeight;
        y < size.height + hexHeight;
        y += hexHeight) {
      for (double x = -hexWidth;
          x < size.width + hexWidth;
          x += hexWidth * 0.75) {
        final offset = (x ~/ (hexWidth * 0.75)).isEven ? 0.0 : hexHeight / 2;
        _drawHex(canvas, Offset(x, y + offset), hexSize, paint);
      }
    }

    // Connection lines (logistics network feel)
    final linePaint = Paint()
      ..color = const Color(0x15FFFFFF)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(size.width * 0.2, size.height * 0.2),
      Offset(size.width * 0.5, size.height * 0.15),
      Offset(size.width * 0.75, size.height * 0.3),
      Offset(size.width * 0.6, size.height * 0.55),
      Offset(size.width * 0.3, size.height * 0.5),
      Offset(size.width * 0.15, size.height * 0.7),
    ];

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], linePaint);
    }
    for (final pt in points) {
      canvas.drawCircle(
          pt,
          4,
          Paint()
            ..color = const Color(0x20FFFFFF)
            ..style = PaintingStyle.fill);
    }
  }

  void _drawHex(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (math.pi / 180) * (60 * i - 30);
      final x = center.dx + size * math.cos(angle);
      final y = center.dy + size * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────
//  Eco Industrial Illustration (SVG-style Flutter canvas)
// ─────────────────────────────────────────────────────────────
class _EcoIllustration extends StatelessWidget {
  const _EcoIllustration();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EcoScenePainter(),
    );
  }
}

class _EcoScenePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // ── Ground / terrain bands ──
    final groundPaint = Paint()..style = PaintingStyle.fill;

    // Far field (lightest green)
    groundPaint.color = const Color(0x251A6642);
    final farField = Path()
      ..moveTo(0, h * 0.52)
      ..quadraticBezierTo(w * 0.3, h * 0.48, w * 0.6, h * 0.5)
      ..quadraticBezierTo(w * 0.8, h * 0.52, w, h * 0.49)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(farField, groundPaint);

    // Mid ground
    groundPaint.color = const Color(0x301A6642);
    final midGround = Path()
      ..moveTo(0, h * 0.6)
      ..quadraticBezierTo(w * 0.25, h * 0.56, w * 0.55, h * 0.59)
      ..quadraticBezierTo(w * 0.75, h * 0.62, w, h * 0.58)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(midGround, groundPaint);

    // Foreground road / path
    groundPaint.color = const Color(0x182E8B57);
    final road = Path()
      ..moveTo(w * 0.3, h * 0.7)
      ..lineTo(w * 0.45, h * 0.55)
      ..lineTo(w * 0.5, h * 0.55)
      ..lineTo(w * 0.38, h * 0.7)
      ..close();
    canvas.drawPath(road, groundPaint);

    // ── Factory / Recycling Facility ──
    _drawFacility(canvas, Offset(w * 0.3, h * 0.52), w * 0.3, h * 0.25);

    // ── Trees / Farmland ──
    _drawTree(canvas, Offset(w * 0.08, h * 0.56), 18);
    _drawTree(canvas, Offset(w * 0.14, h * 0.54), 22);
    _drawTree(canvas, Offset(w * 0.78, h * 0.55), 20);
    _drawTree(canvas, Offset(w * 0.85, h * 0.53), 16);
    _drawTree(canvas, Offset(w * 0.92, h * 0.56), 24);

    // ── Trucks ──
    _drawTruck(canvas, Offset(w * 0.08, h * 0.68), w * 0.14);
    _drawTruck(canvas, Offset(w * 0.62, h * 0.66), w * 0.12);

    // ── Farm fields ──
    _drawFarmField(canvas, Offset(w * 0.7, h * 0.57), w * 0.18, h * 0.08);
  }

  void _drawFacility(Canvas canvas, Offset origin, double width, double height) {
    final p = Paint()..style = PaintingStyle.fill;
    final o = origin;
    final w = width;
    final h = height;

    // Main building body
    p.color = const Color(0x401A6642);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx - w * 0.5, o.dy - h * 0.6, w * 0.6, h * 0.6),
        const Radius.circular(4),
      ),
      p,
    );

    // Roof
    p.color = const Color(0x502E8B57);
    final roofPath = Path()
      ..moveTo(o.dx - w * 0.55, o.dy - h * 0.6)
      ..lineTo(o.dx - w * 0.2, o.dy - h * 0.82)
      ..lineTo(o.dx + w * 0.12, o.dy - h * 0.6)
      ..close();
    canvas.drawPath(roofPath, p);

    // Smokestack / processing tower
    p.color = const Color(0x353DAA6E);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx + w * 0.1, o.dy - h * 0.9, w * 0.08, h * 0.9),
        const Radius.circular(3),
      ),
      p,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx + w * 0.2, o.dy - h * 0.75, w * 0.07, h * 0.75),
        const Radius.circular(3),
      ),
      p,
    );

    // Conveyor/loading dock
    p.color = const Color(0x252E8B57);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx - w * 0.45, o.dy - h * 0.15, w * 0.15, h * 0.15),
        const Radius.circular(2),
      ),
      p,
    );

    // Windows row
    p.color = const Color(0x403DAA6E);
    for (int i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              o.dx - w * 0.45 + i * w * 0.16, o.dy - h * 0.45, w * 0.1, h * 0.12),
          const Radius.circular(2),
        ),
        p,
      );
    }

    // Recycling symbol (simplified arc)
    final symPaint = Paint()
      ..color = const Color(0x403DAA6E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(o.dx - w * 0.22, o.dy - h * 0.28),
          width: w * 0.14,
          height: w * 0.14),
      0,
      math.pi * 1.5,
      false,
      symPaint,
    );
  }

  void _drawTree(Canvas canvas, Offset base, double size) {
    final trunk = Paint()
      ..color = const Color(0x30D4EDDA)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(base.dx, base.dy + size * 0.3),
            width: size * 0.2,
            height: size * 0.5),
        const Radius.circular(2),
      ),
      trunk,
    );
    final canopy = Paint()
      ..color = const Color(0x3A3DAA6E)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(base.dx, base.dy - size * 0.1), size * 0.5, canopy);
  }

  void _drawTruck(Canvas canvas, Offset origin, double width) {
    final p = Paint()..style = PaintingStyle.fill;
    final h = width * 0.45;

    // Cargo trailer
    p.color = const Color(0x351A6642);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(origin.dx, origin.dy, width * 0.65, h * 0.65),
        const Radius.circular(3),
      ),
      p,
    );

    // Cab
    p.color = const Color(0x452E8B57);
    final cabPath = Path()
      ..moveTo(origin.dx + width * 0.65, origin.dy + h * 0.65)
      ..lineTo(origin.dx + width * 0.65, origin.dy + h * 0.08)
      ..quadraticBezierTo(
          origin.dx + width * 0.78, origin.dy,
          origin.dx + width, origin.dy + h * 0.18)
      ..lineTo(origin.dx + width, origin.dy + h * 0.65)
      ..close();
    canvas.drawPath(cabPath, p);

    // Wheels
    p.color = const Color(0x50D4EDDA);
    canvas.drawCircle(Offset(origin.dx + width * 0.18, origin.dy + h * 0.65), h * 0.18, p);
    canvas.drawCircle(Offset(origin.dx + width * 0.5, origin.dy + h * 0.65), h * 0.18, p);
    canvas.drawCircle(Offset(origin.dx + width * 0.88, origin.dy + h * 0.65), h * 0.18, p);

    // Recycling stripe
    p.color = const Color(0x303DAA6E);
    canvas.drawRect(
      Rect.fromLTWH(origin.dx + width * 0.05, origin.dy + h * 0.22, width * 0.56, h * 0.12),
      p,
    );
  }

  void _drawFarmField(Canvas canvas, Offset origin, double width, double height) {
    final p = Paint()
      ..color = const Color(0x201A6642)
      ..style = PaintingStyle.fill;

    // Field rows
    for (int i = 0; i < 4; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              origin.dx, origin.dy + i * height * 0.28, width, height * 0.12),
          const Radius.circular(2),
        ),
        p,
      );
    }

    // Field border
    final border = Paint()
      ..color = const Color(0x152E8B57)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRect(Rect.fromLTWH(origin.dx, origin.dy, width, height), border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────
//  Panel Logo Mark (top-left of left panel)
// ─────────────────────────────────────────────────────────────
class _PanelLogoMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AgriWasteTheme.accentGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.recycling,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'AgriWaste Connect',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Floating Stat Chip
// ─────────────────────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x22FFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x20FFFFFF), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AgriWasteTheme.accentGreen, size: 16),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontSize: 10,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Branding Content (bottom of left panel)
// ─────────────────────────────────────────────────────────────
class _BrandingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AgriWasteTheme.accentGreen.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AgriWasteTheme.accentGreen.withOpacity(0.5), width: 1),
          ),
          child: const Text(
            'ENTERPRISE PLATFORM',
            style: TextStyle(
              color: Color(0xCCFFFFFF),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Smart Waste Collection\n& Recycling Management',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.25,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Monitor collections, manage drivers, track inventory,\nand optimize recycling operations in real time.',
          style: TextStyle(
            color: Color(0xB3FFFFFF),
            fontSize: 14,
            height: 1.65,
            letterSpacing: 0.1,
          ),
        ),
        const SizedBox(height: 32),
        // Feature pills row
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _FeaturePill(icon: Icons.route, label: 'Route Optimization'),
            _FeaturePill(icon: Icons.inventory_2_outlined, label: 'Inventory'),
            _FeaturePill(icon: Icons.analytics_outlined, label: 'Analytics'),
          ],
        ),
      ],
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0x15FFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AgriWasteTheme.accentGreen),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xDDFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Mobile Branding Header
// ─────────────────────────────────────────────────────────────
class _MobileBrandingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 36),
      decoration: const BoxDecoration(
        gradient: AgriWasteTheme.leftPanelGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AgriWasteTheme.accentGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.recycling, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AgriWaste Connect',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Enterprise Platform',
                    style: TextStyle(
                      color: Color(0x99FFFFFF),
                      fontSize: 11,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Smart Waste Collection\n& Recycling Management',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Monitor collections, manage drivers, and optimize operations.',
            style: TextStyle(
              color: Color(0xAAFFFFFF),
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Login Card (shared between desktop + mobile)
// ─────────────────────────────────────────────────────────────
class _LoginCard extends StatefulWidget {
  const _LoginCard();

  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard>
    with SingleTickerProviderStateMixin {
  // Controllers
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  // State
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _errorMessage;
  String? _selectedRole;

  // Animation
  late final AnimationController _animCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  static const List<String> _roles = [
    'Manager',
    'Analyst',
    'Finance Officer',
    'Operations',
  ];

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOutCubic));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() => _errorMessage = null);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);
    // Simulate async auth call (replace with Bloc event)
    await Future.delayed(const Duration(seconds: 2));

    // Demo: show error if email does not contain '@'
    if (!_emailCtrl.text.contains('@company.com')) {
      setState(() {
        _isLoading = false;
        _errorMessage =
            'Unrecognized company email. Only registered partners may access this portal.';
      });
      return;
    }

    setState(() => _isLoading = false);
    // On success → navigate to dashboard
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AgriWasteTheme.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AgriWasteTheme.deepGreen.withOpacity(0.07),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: AgriWasteTheme.deepGreen.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Header ──
                  _CardHeader(),
                  const SizedBox(height: 32),

                  // ── Error Banner ──
                  if (_errorMessage != null) ...[
                    _ErrorBanner(message: _errorMessage!),
                    const SizedBox(height: 20),
                  ],

                  // ── Company Email ──
                  _SectionLabel(text: 'Company Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AgriWasteTheme.neutral900,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'you@yourcompany.com',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AgriWasteTheme.neutral600,
                        size: 18,
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Email is required.';
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ── Password ──
                  _SectionLabel(text: 'Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleLogin(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AgriWasteTheme.neutral900,
                    ),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: AgriWasteTheme.neutral600,
                        size: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AgriWasteTheme.neutral600,
                          size: 18,
                        ),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                        tooltip: _obscurePassword
                            ? 'Show password'
                            : 'Hide password',
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Password is required.';
                      if (v.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ── Role Dropdown ──
                  _SectionLabel(text: 'Role (optional)'),
                  const SizedBox(height: 8),
                  _RoleDropdown(
                    roles: _roles,
                    selected: _selectedRole,
                    onChanged: (v) => setState(() => _selectedRole = v),
                  ),
                  const SizedBox(height: 12),

                  // ── Forgot Password ──
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AgriWasteTheme.forestGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // ── Login Button ──
                  _LoginButton(
                    isLoading: _isLoading,
                    onPressed: _handleLogin,
                  ),
                  const SizedBox(height: 24),

                  // ── Security Note ──
                  _SecurityNote(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Card Header
// ─────────────────────────────────────────────────────────────
class _CardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon badge
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AgriWasteTheme.forestGreen, AgriWasteTheme.accentGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AgriWasteTheme.forestGreen.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.business_center_outlined,
              color: Colors.white, size: 22),
        ),
        const SizedBox(height: 20),
        const Text(
          'Company Portal',
          style: TextStyle(
            color: AgriWasteTheme.deepGreen,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AgriWasteTheme.accentGreen,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Authorized personnel only',
              style: TextStyle(
                color: AgriWasteTheme.neutral600,
                fontSize: 13,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Section Label
// ─────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AgriWasteTheme.neutral800,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Role Dropdown
// ─────────────────────────────────────────────────────────────
class _RoleDropdown extends StatelessWidget {
  const _RoleDropdown({
    required this.roles,
    required this.selected,
    required this.onChanged,
  });

  final List<String> roles;
  final String? selected;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AgriWasteTheme.neutral50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AgriWasteTheme.neutral200, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          hint: Row(
            children: const [
              Icon(Icons.badge_outlined,
                  size: 18, color: AgriWasteTheme.neutral600),
              SizedBox(width: 10),
              Text(
                'Select your role',
                style: TextStyle(
                  color: AgriWasteTheme.neutral400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: AgriWasteTheme.neutral600),
          isExpanded: true,
          style: const TextStyle(
            color: AgriWasteTheme.neutral900,
            fontSize: 14,
          ),
          dropdownColor: AgriWasteTheme.white,
          borderRadius: BorderRadius.circular(12),
          items: roles
              .map((r) => DropdownMenuItem(value: r, child: Text(r)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Login Button (with hover + loading states)
// ─────────────────────────────────────────────────────────────
class _LoginButton extends StatefulWidget {
  const _LoginButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  State<_LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 52,
        decoration: BoxDecoration(
          gradient: _hovered && !widget.isLoading
              ? const LinearGradient(
                  colors: [Color(0xFF0D3D2B), Color(0xFF1A6642)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : AgriWasteTheme.buttonGradient,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: AgriWasteTheme.forestGreen
                  .withOpacity(_hovered ? 0.35 : 0.22),
              blurRadius: _hovered ? 20 : 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            onTap: widget.isLoading ? null : widget.onPressed,
            child: Center(
              child: widget.isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.8,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Error Banner
// ─────────────────────────────────────────────────────────────
class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AgriWasteTheme.errorRedLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AgriWasteTheme.errorRed.withOpacity(0.2), width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.error_outline,
                color: AgriWasteTheme.errorRed, size: 16),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: AgriWasteTheme.errorRed,
                  fontSize: 12.5,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Security Note
// ─────────────────────────────────────────────────────────────
class _SecurityNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7F4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: AgriWasteTheme.accentGreen.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.shield_outlined,
              size: 14, color: AgriWasteTheme.forestGreen.withOpacity(0.7)),
          const SizedBox(width: 9),
          const Expanded(
            child: Text(
              'Access restricted to registered recycling partners.',
              style: TextStyle(
                color: AgriWasteTheme.forestGreen,
                fontSize: 11.5,
                letterSpacing: 0.1,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
