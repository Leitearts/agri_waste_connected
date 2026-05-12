import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../core/services/navigation_service.dart';

// ─────────────────────────────────────────────────────────────
//  Design Tokens
// ─────────────────────────────────────────────────────────────
class _AppColors {
  static const Color deepGreen   = Color(0xFF0D3D2B);
  static const Color forestGreen = Color(0xFF1A6642);
  static const Color accentGreen = Color(0xFF3DAA6E);
  static const Color softBeige   = Color(0xFFF7F4EE);
  static const Color white       = Color(0xFFFFFFFF);
  static const Color neutral50   = Color(0xFFF8F9FA);
  static const Color neutral200  = Color(0xFFE8EAED);
  static const Color neutral400  = Color(0xFFBDC1C6);
  static const Color neutral600  = Color(0xFF80868B);
  static const Color neutral800  = Color(0xFF3C4043);
  static const Color neutral900  = Color(0xFF202124);
  static const Color errorRed    = Color(0xFFB00020);
  static const Color errorRedBg  = Color(0xFFFCE8E6);

  static const LinearGradient panelGradient = LinearGradient(
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
}

// ─────────────────────────────────────────────────────────────
//  AdminLoginScreen
// ─────────────────────────────────────────────────────────────
class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  static const double _desktopBreakpoint = 768.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.softBeige,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= _desktopBreakpoint;
          return isDesktop
              ? const _DesktopLayout()
              : const _MobileLayout();
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Desktop Layout  ─  55 / 45 split
// ─────────────────────────────────────────────────────────────
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 55, child: _LeftBrandingPanel()),
        Expanded(
          flex: 45,
          child: Container(
            color: _AppColors.softBeige,
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
//  Mobile Layout  ─  vertical stack
// ─────────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _MobileBrandingHeader(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: _LoginCard(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Left Branding Panel
// ─────────────────────────────────────────────────────────────
class _LeftBrandingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(gradient: _AppColors.panelGradient),
      child: Stack(
        children: [
          const Positioned.fill(child: CustomPaint(painter: _HexGridPainter())),
          const Positioned.fill(child: CustomPaint(painter: _EcoScenePainter())),
          // Bottom fade for text legibility
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xCC062518)],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
          ),
          Positioned(top: 40, left: 48, child: _PanelLogo()),
          const Positioned(
            top: 120,
            right: 40,
            child: _StatChip(
              icon: Icons.local_shipping_outlined,
              label: 'Active Routes',
              value: '1,284',
            ),
          ),
          const Positioned(
            top: 204,
            right: 40,
            child: _StatChip(
              icon: Icons.recycling,
              label: 'Tons Processed',
              value: '48.6K',
            ),
          ),
          Positioned(
            left: 48,
            right: 48,
            bottom: 64,
            child: _BrandingContent(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Panel Logo
// ─────────────────────────────────────────────────────────────
class _PanelLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _AppColors.accentGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.recycling, color: Colors.white, size: 20),
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
  final String   label;
  final String   value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x22FFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x20FFFFFF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _AppColors.accentGreen, size: 16),
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
//  Branding Content
// ─────────────────────────────────────────────────────────────
class _BrandingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: _AppColors.accentGreen.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: _AppColors.accentGreen.withOpacity(0.5), width: 1),
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
          'Monitor collections, manage drivers, track inventory,\n'
          'and optimize recycling operations in real time.',
          style: TextStyle(
            color: Color(0xB3FFFFFF),
            fontSize: 14,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 28),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
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
  final String   label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0x15FFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x1AFFFFFF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: _AppColors.accentGreen),
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
  const _MobileBrandingHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 36),
      decoration: const BoxDecoration(gradient: _AppColors.panelGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _AppColors.accentGreen,
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
//  Login Card
// ─────────────────────────────────────────────────────────────
class _LoginCard extends StatefulWidget {
  const _LoginCard();

  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard>
    with SingleTickerProviderStateMixin {
  final _formKey      = GlobalKey<FormState>();
  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool    _obscurePassword = true;
  bool    _isLoading       = false;
  String? _errorMessage;
  String? _selectedRole;

  late final AnimationController _animCtrl;
  late final Animation<double>   _fadeAnim;
  late final Animation<Offset>   _slideAnim;

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
    _fadeAnim  = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
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

    // ── Replace this block with your Bloc / auth call ──────────
    await Future.delayed(const Duration(seconds: 2));

    if (!_emailCtrl.text.contains('@')) {
      setState(() {
        _isLoading    = false;
        _errorMessage =
            'Unrecognized company email. Only registered partners may access this portal.';
      });
      return;
    }
    // ───────────────────────────────────────────────────────────

    setState(() => _isLoading = false);
    NavigationService.replace('/admin/dashboard');
  }

  InputDecoration _inputDecoration({
    required String   hint,
    required IconData prefixIcon,
    Widget?           suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: _AppColors.neutral400, fontSize: 14),
      filled: true,
      fillColor: _AppColors.neutral50,
      prefixIcon: Icon(prefixIcon, color: _AppColors.neutral600, size: 18),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _AppColors.neutral200, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _AppColors.neutral200, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _AppColors.forestGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _AppColors.errorRed, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _AppColors.errorRed, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
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
              color: _AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: _AppColors.deepGreen.withOpacity(0.07),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                ),
                BoxShadow(
                  color: _AppColors.deepGreen.withOpacity(0.04),
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
                  const _CardHeader(),
                  const SizedBox(height: 32),

                  // ── Error banner ──
                  if (_errorMessage != null) ...[
                    _ErrorBanner(message: _errorMessage!),
                    const SizedBox(height: 20),
                  ],

                  // ── Email ──
                  const _FieldLabel(text: 'Company Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      fontSize: 14,
                      color: _AppColors.neutral900,
                    ),
                    decoration: _inputDecoration(
                      hint: 'you@yourcompany.com',
                      prefixIcon: Icons.email_outlined,
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Email is required.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                        return 'Enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ── Password ──
                  const _FieldLabel(text: 'Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleLogin(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: _AppColors.neutral900,
                    ),
                    decoration: _inputDecoration(
                      hint: '••••••••',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: _AppColors.neutral600,
                          size: 18,
                        ),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Password is required.';
                      }
                      if (v.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ── Role ──
                  const _FieldLabel(text: 'Role (optional)'),
                  const SizedBox(height: 8),
                  _RoleDropdown(
                    roles: _roles,
                    selected: _selectedRole,
                    onChanged: (v) => setState(() => _selectedRole = v),
                  ),
                  const SizedBox(height: 12),

                  // ── Forgot password ──
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
                        'Forgot password?',
                        style: TextStyle(
                          color: _AppColors.forestGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // ── Login button ──
                  _LoginButton(
                    isLoading: _isLoading,
                    onPressed: _handleLogin,
                  ),
                  const SizedBox(height: 24),

                  // ── Security note ──
                  const _SecurityNote(),
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
  const _CardHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_AppColors.forestGreen, _AppColors.accentGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: _AppColors.forestGreen.withOpacity(0.25),
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
            color: _AppColors.deepGreen,
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
              decoration: const BoxDecoration(
                color: _AppColors.accentGreen,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Authorized personnel only',
              style: TextStyle(
                color: _AppColors.neutral600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Field Label
// ─────────────────────────────────────────────────────────────
class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: _AppColors.neutral800,
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

  final List<String>       roles;
  final String?            selected;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: _AppColors.neutral50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _AppColors.neutral200, width: 1.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: _AppColors.neutral600),
          dropdownColor: _AppColors.white,
          borderRadius: BorderRadius.circular(12),
          style: const TextStyle(
            color: _AppColors.neutral900,
            fontSize: 14,
          ),
          hint: Row(
            children: const [
              Icon(Icons.badge_outlined,
                  size: 18, color: _AppColors.neutral600),
              SizedBox(width: 10),
              Text(
                'Select your role',
                style: TextStyle(
                  color: _AppColors.neutral400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
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
//  Login Button
// ─────────────────────────────────────────────────────────────
class _LoginButton extends StatefulWidget {
  const _LoginButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool         isLoading;
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
      onExit:  (_) => setState(() => _hovered = false),
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
              : _AppColors.buttonGradient,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: _AppColors.forestGreen
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _AppColors.errorRedBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: _AppColors.errorRed.withOpacity(0.2), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline,
              color: _AppColors.errorRed, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: _AppColors.errorRed,
                fontSize: 12.5,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Security Note
// ─────────────────────────────────────────────────────────────
class _SecurityNote extends StatelessWidget {
  const _SecurityNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7F4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: _AppColors.accentGreen.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.shield_outlined,
              size: 14,
              color: _AppColors.forestGreen.withOpacity(0.7)),
          const SizedBox(width: 9),
          const Expanded(
            child: Text(
              'Access restricted to registered recycling partners.',
              style: TextStyle(
                color: _AppColors.forestGreen,
                fontSize: 11.5,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Custom Painters
// ─────────────────────────────────────────────────────────────

/// Subtle hex-grid logistics network background
class _HexGridPainter extends CustomPainter {
  const _HexGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = const Color(0x0AFFFFFF)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double r  = 48;
    const double hH = r * 1.732;
    const double hW = r * 2;

    for (double y = -hH; y < size.height + hH; y += hH) {
      for (double x = -hW; x < size.width + hW; x += hW * 0.75) {
        final dy = ((x ~/ (hW * 0.75)).isEven) ? 0.0 : hH / 2;
        _drawHex(canvas, Offset(x, y + dy), r, stroke);
      }
    }

    final line = Paint()
      ..color = const Color(0x15FFFFFF)
      ..strokeWidth = 0.8;

    final pts = [
      Offset(size.width * 0.20, size.height * 0.20),
      Offset(size.width * 0.50, size.height * 0.15),
      Offset(size.width * 0.75, size.height * 0.30),
      Offset(size.width * 0.60, size.height * 0.55),
      Offset(size.width * 0.30, size.height * 0.50),
      Offset(size.width * 0.15, size.height * 0.70),
    ];

    for (int i = 0; i < pts.length - 1; i++) {
      canvas.drawLine(pts[i], pts[i + 1], line);
    }
    for (final pt in pts) {
      canvas.drawCircle(
        pt,
        4,
        Paint()
          ..color = const Color(0x20FFFFFF)
          ..style = PaintingStyle.fill,
      );
    }
  }

  void _drawHex(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final a = (math.pi / 180) * (60 * i - 30);
      final x = c.dx + r * math.cos(a);
      final y = c.dy + r * math.sin(a);
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

/// Eco-industrial scene: facility, trucks, farm fields, trees
class _EcoScenePainter extends CustomPainter {
  const _EcoScenePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final p = Paint()..style = PaintingStyle.fill;

    // Terrain bands
    p.color = const Color(0x251A6642);
    canvas.drawPath(_wave(w, h, 0.52, 0.48, 0.50, 0.52, 0.49), p);

    p.color = const Color(0x301A6642);
    canvas.drawPath(_wave(w, h, 0.60, 0.56, 0.59, 0.62, 0.58), p);

    // Road strip
    p.color = const Color(0x182E8B57);
    canvas.drawPath(
      Path()
        ..moveTo(w * 0.30, h * 0.70)
        ..lineTo(w * 0.45, h * 0.55)
        ..lineTo(w * 0.50, h * 0.55)
        ..lineTo(w * 0.38, h * 0.70)
        ..close(),
      p,
    );

    _drawFacility(canvas, Offset(w * 0.30, h * 0.52), w * 0.30, h * 0.25);

    for (final t in [
      [0.08, 0.56, 18.0],
      [0.14, 0.54, 22.0],
      [0.78, 0.55, 20.0],
      [0.85, 0.53, 16.0],
      [0.92, 0.56, 24.0],
    ]) {
      _drawTree(canvas, Offset(w * t[0], h * t[1]), t[2]);
    }

    _drawTruck(canvas, Offset(w * 0.08, h * 0.68), w * 0.14);
    _drawTruck(canvas, Offset(w * 0.62, h * 0.66), w * 0.12);

    _drawFarmField(canvas, Offset(w * 0.70, h * 0.57), w * 0.18, h * 0.08);
  }

  Path _wave(double w, double h, double y0, double cy1, double y1,
      double cy2, double y2) {
    return Path()
      ..moveTo(0, h * y0)
      ..quadraticBezierTo(w * 0.30, h * cy1, w * 0.60, h * y1)
      ..quadraticBezierTo(w * 0.80, h * cy2, w, h * y2)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
  }

  void _drawFacility(Canvas canvas, Offset o, double fw, double fh) {
    final p = Paint()..style = PaintingStyle.fill;

    p.color = const Color(0x401A6642);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            o.dx - fw * 0.5, o.dy - fh * 0.6, fw * 0.6, fh * 0.6),
        const Radius.circular(4),
      ),
      p,
    );

    p.color = const Color(0x502E8B57);
    canvas.drawPath(
      Path()
        ..moveTo(o.dx - fw * 0.55, o.dy - fh * 0.60)
        ..lineTo(o.dx - fw * 0.20, o.dy - fh * 0.82)
        ..lineTo(o.dx + fw * 0.12, o.dy - fh * 0.60)
        ..close(),
      p,
    );

    p.color = const Color(0x353DAA6E);
    for (final s in [
      [0.10, 0.90, 0.08],
      [0.20, 0.75, 0.07],
    ]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(o.dx + fw * s[0], o.dy - fh * s[1],
              fw * s[2], fh * s[1]),
          const Radius.circular(3),
        ),
        p,
      );
    }

    p.color = const Color(0x252E8B57);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx - fw * 0.45, o.dy - fh * 0.15,
            fw * 0.15, fh * 0.15),
        const Radius.circular(2),
      ),
      p,
    );

    p.color = const Color(0x403DAA6E);
    for (int i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(o.dx - fw * 0.45 + i * fw * 0.16,
              o.dy - fh * 0.45, fw * 0.10, fh * 0.12),
          const Radius.circular(2),
        ),
        p,
      );
    }
  }

  void _drawTree(Canvas canvas, Offset base, double size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(base.dx, base.dy + size * 0.3),
            width: size * 0.2,
            height: size * 0.5),
        const Radius.circular(2),
      ),
      Paint()
        ..color = const Color(0x30D4EDDA)
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      Offset(base.dx, base.dy - size * 0.1),
      size * 0.5,
      Paint()
        ..color = const Color(0x3A3DAA6E)
        ..style = PaintingStyle.fill,
    );
  }

  void _drawTruck(Canvas canvas, Offset o, double width) {
    final th = width * 0.45;
    final p  = Paint()..style = PaintingStyle.fill;

    p.color = const Color(0x351A6642);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(o.dx, o.dy, width * 0.65, th * 0.65),
        const Radius.circular(3),
      ),
      p,
    );

    p.color = const Color(0x452E8B57);
    canvas.drawPath(
      Path()
        ..moveTo(o.dx + width * 0.65, o.dy + th * 0.65)
        ..lineTo(o.dx + width * 0.65, o.dy + th * 0.08)
        ..quadraticBezierTo(o.dx + width * 0.78, o.dy,
            o.dx + width, o.dy + th * 0.18)
        ..lineTo(o.dx + width, o.dy + th * 0.65)
        ..close(),
      p,
    );

    p.color = const Color(0x50D4EDDA);
    for (final x in [0.18, 0.50, 0.88]) {
      canvas.drawCircle(
          Offset(o.dx + width * x, o.dy + th * 0.65), th * 0.18, p);
    }
  }

  void _drawFarmField(Canvas canvas, Offset o, double fw, double fh) {
    final p = Paint()
      ..color = const Color(0x201A6642)
      ..style = PaintingStyle.fill;
    for (int i = 0; i < 4; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(o.dx, o.dy + i * fh * 0.28, fw, fh * 0.12),
          const Radius.circular(2),
        ),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
