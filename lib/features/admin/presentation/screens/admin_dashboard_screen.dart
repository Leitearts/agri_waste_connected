import 'package:flutter/material.dart';
import 'dart:math' as math;

// ─────────────────────────────────────────────
//  ENTRY POINT (remove if embedding in your app)
// ─────────────────────────────────────────────
void main() {
  runApp(const AgriWasteApp());
}

class AgriWasteApp extends StatelessWidget {
  const AgriWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriWaste Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AdminDashboardScreen(),
    );
  }
}

// ─────────────────────────────────────────────
//  THEME
// ─────────────────────────────────────────────
class AppTheme {
  // Greens
  static const Color deepGreen = Color(0xFF1A3D2B);
  static const Color forestGreen = Color(0xFF2D6A4F);
  static const Color midGreen = Color(0xFF40916C);
  static const Color lightGreen = Color(0xFF52B788);
  static const Color paleGreen = Color(0xFFD8F3DC);
  static const Color oliveAccent = Color(0xFF8B9D4E);

  // Neutrals
  static const Color background = Color(0xFFF7F8F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F2ED);
  static const Color border = Color(0xFFE2E8E0);
  static const Color textPrimary = Color(0xFF1C2B22);
  static const Color textSecondary = Color(0xFF6B7C72);
  static const Color textMuted = Color(0xFF9BAD9F);

  // Status
  static const Color statusActive = Color(0xFF2D6A4F);
  static const Color statusPending = Color(0xFFF59E0B);
  static const Color statusUrgent = Color(0xFFDC2626);
  static const Color statusInfo = Color(0xFF2563EB);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: surface,
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
      );
}

// ─────────────────────────────────────────────
//  NAV ITEMS
// ─────────────────────────────────────────────
class NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String route;

  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}

const List<NavItem> kNavItems = [
  NavItem(icon: Icons.dashboard_outlined, activeIcon: Icons.dashboard, label: 'Dashboard', route: '/dashboard'),
  NavItem(icon: Icons.local_shipping_outlined, activeIcon: Icons.local_shipping, label: 'Fleet', route: '/fleet'),
  NavItem(icon: Icons.inventory_2_outlined, activeIcon: Icons.inventory_2, label: 'Inventory', route: '/inventory'),
  NavItem(icon: Icons.sell_outlined, activeIcon: Icons.sell, label: 'Pricing', route: '/pricing'),
  NavItem(icon: Icons.route_outlined, activeIcon: Icons.route, label: 'Routines', route: '/routines'),
  NavItem(icon: Icons.people_outline, activeIcon: Icons.people, label: 'Farmers', route: '/farmers'),
  NavItem(icon: Icons.bar_chart_outlined, activeIcon: Icons.bar_chart, label: 'Reports', route: '/reports'),
  NavItem(icon: Icons.settings_outlined, activeIcon: Icons.settings, label: 'Settings', route: '/settings'),
];

// ─────────────────────────────────────────────
//  MOCK DATA
// ─────────────────────────────────────────────
class MockData {
  static const kpis = [
    _KpiData(label: 'Total Farmers', value: '1,284', trend: '+12%', icon: Icons.people_alt_rounded, trendUp: true),
    _KpiData(label: 'Active Drivers', value: '38', trend: '+3', icon: Icons.drive_eta_rounded, trendUp: true),
    _KpiData(label: 'Pending Collections', value: '217', trend: '+8%', icon: Icons.pending_actions_rounded, trendUp: false),
    _KpiData(label: "Today's Collections", value: '64', trend: '94%', icon: Icons.check_circle_rounded, trendUp: true),
  ];

  static const alerts = [
    _AlertData(severity: AlertSeverity.urgent, title: 'Green Hill Farm', subtitle: 'Dry Stalks 500 kg — Waiting 3 days', time: '2h ago', icon: Icons.warning_amber_rounded),
    _AlertData(severity: AlertSeverity.urgent, title: 'Sunrise Farm', subtitle: 'Manure 300 kg — Waiting 2 days', time: '4h ago', icon: Icons.warning_amber_rounded),
    _AlertData(severity: AlertSeverity.pending, title: 'Inventory Overflow', subtitle: 'Maize Husks bay at 92% capacity', time: '1h ago', icon: Icons.inventory_2_rounded),
    _AlertData(severity: AlertSeverity.info, title: '4 Drivers Inactive', subtitle: 'No activity recorded in 6 hours', time: '30m ago', icon: Icons.drive_eta_rounded),
  ];

  static const collections = [
    _CollectionData(farm: 'Kilimo Green Farm', type: 'Sugarcane Bagasse', weight: '1.2 t', driver: 'John Mutua', status: CollectionStatus.active),
    _CollectionData(farm: 'Riverbank Organics', type: 'Rice Husks', weight: '850 kg', driver: 'Jane Achieng', status: CollectionStatus.active),
    _CollectionData(farm: 'Highland Harvest', type: 'Wheat Straw', weight: '2.0 t', driver: 'James Otieno', status: CollectionStatus.pending),
    _CollectionData(farm: 'Valley Fresh Farm', type: 'Coffee Pulp', weight: '620 kg', driver: 'Unassigned', status: CollectionStatus.urgent),
    _CollectionData(farm: 'Savanna Agri Co.', type: 'Maize Stalks', weight: '1.5 t', driver: 'Peter Kamau', status: CollectionStatus.completed),
  ];

  static const drivers = [
    _DriverData(name: 'John Mutua', vehicle: 'KAA 123B', status: DriverStatus.onRoute, collections: 7),
    _DriverData(name: 'Jane Achieng', vehicle: 'KBC 456T', status: DriverStatus.onRoute, collections: 5),
    _DriverData(name: 'Peter Kamau', vehicle: 'KDA 789M', status: DriverStatus.available, collections: 9),
    _DriverData(name: 'Rose Wanjiku', vehicle: 'KEB 321X', status: DriverStatus.available, collections: 4),
    _DriverData(name: 'James Otieno', vehicle: 'KFC 654P', status: DriverStatus.inactive, collections: 0),
  ];

  static const List<double> weeklyTrend = [28, 42, 35, 58, 64, 71, 64];
  static const List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const List<double> monthlyRevenue = [820, 940, 880, 1100, 1250, 1180, 1320, 1400, 1280, 1500, 1620, 1750];
  static const List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
}

enum AlertSeverity { urgent, pending, info }
enum CollectionStatus { active, pending, urgent, completed }
enum DriverStatus { onRoute, available, inactive }

class _KpiData {
  final String label, value, trend;
  final IconData icon;
  final bool trendUp;
  const _KpiData({required this.label, required this.value, required this.trend, required this.icon, required this.trendUp});
}

class _AlertData {
  final AlertSeverity severity;
  final String title, subtitle, time;
  final IconData icon;
  const _AlertData({required this.severity, required this.title, required this.subtitle, required this.time, required this.icon});
}

class _CollectionData {
  final String farm, type, weight, driver;
  final CollectionStatus status;
  const _CollectionData({required this.farm, required this.type, required this.weight, required this.driver, required this.status});
}

class _DriverData {
  final String name, vehicle;
  final DriverStatus status;
  final int collections;
  const _DriverData({required this.name, required this.vehicle, required this.status, required this.collections});
}

// ─────────────────────────────────────────────
//  MAIN SCREEN
// ─────────────────────────────────────────────
class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _sidebarCollapsed = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1100;
        final isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1100;
        final isMobile = constraints.maxWidth < 700;

        if (isMobile) {
          return _MobileLayout(
            scaffoldKey: _scaffoldKey,
            selectedIndex: _selectedIndex,
            onNavChanged: (i) => setState(() => _selectedIndex = i),
            fadeAnimation: _fadeAnimation,
          );
        }

        return Scaffold(
          backgroundColor: AppTheme.background,
          body: Row(
            children: [
              // ── SIDEBAR ──
              _Sidebar(
                selectedIndex: _selectedIndex,
                collapsed: isTablet ? true : _sidebarCollapsed,
                onItemTap: (i) => setState(() => _selectedIndex = i),
                onToggle: () => setState(() => _sidebarCollapsed = !_sidebarCollapsed),
              ),
              // ── MAIN CONTENT ──
              Expanded(
                child: Column(
                  children: [
                    _TopBar(isDesktop: isDesktop),
                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _DashboardBody(isDesktop: isDesktop),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
//  SIDEBAR
// ─────────────────────────────────────────────
class _Sidebar extends StatelessWidget {
  final int selectedIndex;
  final bool collapsed;
  final ValueChanged<int> onItemTap;
  final VoidCallback onToggle;

  const _Sidebar({
    required this.selectedIndex,
    required this.collapsed,
    required this.onItemTap,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final w = collapsed ? 72.0 : 240.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: w,
      decoration: const BoxDecoration(
        color: AppTheme.deepGreen,
        boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 16, offset: Offset(2, 0))],
      ),
      child: Column(
        children: [
          // Logo area
          Container(
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.recycling, color: Colors.white, size: 22),
                ),
                if (!collapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AgriWaste', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.3)),
                        Text('Connect', style: TextStyle(color: AppTheme.lightGreen, fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggle,
                    child: Icon(Icons.chevron_left, color: AppTheme.textMuted, size: 20),
                  ),
                ],
              ],
            ),
          ),

          const Divider(color: Color(0xFF2D4F3A), height: 1),
          const SizedBox(height: 8),

          // Nav items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemCount: kNavItems.length,
              itemBuilder: (context, i) {
                final item = kNavItems[i];
                final isSelected = selectedIndex == i;
                return _SidebarItem(
                  item: item,
                  isSelected: isSelected,
                  collapsed: collapsed,
                  onTap: () => onItemTap(i),
                );
              },
            ),
          ),

          // Collapse toggle (when collapsed)
          if (collapsed)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: onToggle,
                child: const Icon(Icons.chevron_right, color: AppTheme.textMuted, size: 20),
              ),
            ),

          // Logout
          const Divider(color: Color(0xFF2D4F3A), height: 1),
          _SidebarItem(
            item: const NavItem(icon: Icons.logout_outlined, activeIcon: Icons.logout, label: 'Logout', route: '/logout'),
            isSelected: false,
            collapsed: collapsed,
            onTap: () {},
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  final NavItem item;
  final bool isSelected, collapsed;
  final VoidCallback onTap;

  const _SidebarItem({required this.item, required this.isSelected, required this.collapsed, required this.onTap});

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;
    final bg = isSelected
        ? AppTheme.forestGreen
        : _hovering
            ? const Color(0xFF234035)
            : Colors.transparent;
    final iconColor = isSelected ? Colors.white : AppTheme.textMuted;
    final textColor = isSelected ? Colors.white : AppTheme.textMuted;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: widget.collapsed ? 0 : 12, vertical: 10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: widget.collapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              if (isSelected)
                Container(
                  width: 3,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGreen,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: widget.collapsed ? EdgeInsets.zero : const EdgeInsets.only(right: 8),
                ),
              Icon(isSelected ? widget.item.activeIcon : widget.item.icon, color: iconColor, size: 20),
              if (!widget.collapsed) ...[
                const SizedBox(width: 12),
                Text(widget.item.label, style: TextStyle(color: textColor, fontSize: 14, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  TOP BAR
// ─────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  final bool isDesktop;
  const _TopBar({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.border, width: 1)),
      ),
      child: Row(
        children: [
          // Search
          Expanded(
            flex: isDesktop ? 2 : 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search, color: AppTheme.textMuted, size: 18),
                  const SizedBox(width: 8),
                  Text('Search farmers, drivers, collections…', style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Date
          if (isDesktop) ...[
            Text('Thu, 4 Apr 2024', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(width: 20),
          ],
          // Notifications
          _TopBarIcon(icon: Icons.notifications_outlined, badge: '5'),
          const SizedBox(width: 8),
          _TopBarIcon(icon: Icons.help_outline_rounded),
          const SizedBox(width: 16),
          // Avatar
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: AppTheme.forestGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text('RC', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700))),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recycle Co.', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                const Text('Admin', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TopBarIcon extends StatelessWidget {
  final IconData icon;
  final String? badge;
  const _TopBarIcon({required this.icon, this.badge});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(
            color: AppTheme.surfaceVariant,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 19, color: AppTheme.textSecondary),
        ),
        if (badge != null)
          Positioned(
            right: 2, top: 2,
            child: Container(
              width: 16, height: 16,
              decoration: const BoxDecoration(color: AppTheme.statusUrgent, shape: BoxShape.circle),
              child: Center(child: Text(badge!, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700))),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  DASHBOARD BODY
// ─────────────────────────────────────────────
class _DashboardBody extends StatelessWidget {
  final bool isDesktop;
  const _DashboardBody({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isDesktop ? 28 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Operations Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppTheme.textPrimary, letterSpacing: -0.3)),
                  const SizedBox(height: 2),
                  Text('Live overview · Updated just now', style: TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                ],
              ),
              _GreenButton(label: 'New Collection', icon: Icons.add, onTap: () {}),
            ],
          ),
          const SizedBox(height: 24),

          // ── SECTION 1: KPI Cards ──
          _KpiGrid(isDesktop: isDesktop),
          const SizedBox(height: 24),

          // ── SECTION 2: Analytics ──
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _CollectionTrendCard()),
                const SizedBox(width: 20),
                Expanded(flex: 2, child: _RevenueColumn()),
              ],
            )
          else
            Column(children: [_CollectionTrendCard(), const SizedBox(height: 20), _RevenueColumn()]),
          const SizedBox(height: 24),

          // ── SECTION 3: Live Operations ──
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _RecentCollectionsCard()),
                const SizedBox(width: 20),
                Expanded(flex: 2, child: _DriversStatusCard()),
              ],
            )
          else
            Column(children: [_RecentCollectionsCard(), const SizedBox(height: 20), _DriversStatusCard()]),
          const SizedBox(height: 24),

          // ── SECTION 4 & 5: Alerts + Quick Actions ──
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _AlertsCard()),
                const SizedBox(width: 20),
                Expanded(flex: 2, child: _QuickActionsCard()),
              ],
            )
          else
            Column(children: [_AlertsCard(), const SizedBox(height: 20), _QuickActionsCard()]),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  KPI GRID
// ─────────────────────────────────────────────
class _KpiGrid extends StatelessWidget {
  final bool isDesktop;
  const _KpiGrid({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final items = MockData.kpis;
    final colors = [
      AppTheme.forestGreen,
      AppTheme.oliveAccent,
      AppTheme.statusPending,
      AppTheme.midGreen,
    ];

    if (isDesktop) {
      return Row(
        children: List.generate(items.length, (i) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < items.length - 1 ? 16 : 0),
            child: _KpiCard(data: items[i], accentColor: colors[i]),
          ),
        )),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.5,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => _KpiCard(data: items[i], accentColor: colors[i]),
    );
  }
}

class _KpiCard extends StatefulWidget {
  final _KpiData data;
  final Color accentColor;
  const _KpiCard({required this.data, required this.accentColor});

  @override
  State<_KpiCard> createState() => _KpiCardState();
}

class _KpiCardState extends State<_KpiCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _hovering ? widget.accentColor.withOpacity(0.4) : AppTheme.border),
          boxShadow: [
            BoxShadow(
              color: _hovering ? widget.accentColor.withOpacity(0.08) : const Color(0x08000000),
              blurRadius: _hovering ? 20 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(widget.data.icon, color: widget.accentColor, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: widget.data.trendUp ? AppTheme.paleGreen : const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.data.trendUp ? Icons.trending_up : Icons.trending_down,
                        size: 12,
                        color: widget.data.trendUp ? AppTheme.statusActive : AppTheme.statusPending,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        widget.data.trend,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: widget.data.trendUp ? AppTheme.statusActive : AppTheme.statusPending,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data.value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppTheme.textPrimary, letterSpacing: -1)),
                const SizedBox(height: 2),
                Text(widget.data.label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  COLLECTION TREND CHART
// ─────────────────────────────────────────────
class _CollectionTrendCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Weekly Collection Trend',
      subtitle: 'Collections this week',
      action: 'View Report',
      child: SizedBox(
        height: 180,
        child: _BarChart(
          values: MockData.weeklyTrend,
          labels: MockData.weekDays,
          color: AppTheme.forestGreen,
          highlightIndex: 4,
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final Color color;
  final int highlightIndex;

  const _BarChart({required this.values, required this.labels, required this.color, required this.highlightIndex});

  @override
  Widget build(BuildContext context) {
    final maxVal = values.reduce(math.max);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(values.length, (i) {
        final ratio = values[i] / maxVal;
        final isHighlight = i == highlightIndex;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isHighlight)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppTheme.deepGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('${values[i].toInt()}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                  ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  height: 120 * ratio,
                  decoration: BoxDecoration(
                    color: isHighlight ? color : color.withOpacity(0.25),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                  ),
                ),
                const SizedBox(height: 6),
                Text(labels[i], style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────
//  REVENUE COLUMN
// ─────────────────────────────────────────────
class _RevenueColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RevenueCard(label: 'Monthly Revenue', value: 'KES 1.75M', trend: '+12.4%', color: AppTheme.forestGreen),
        const SizedBox(height: 16),
        _RevenueCard(label: 'Yearly Revenue', value: 'KES 14.2M', trend: '+8.7%', color: AppTheme.oliveAccent),
        const SizedBox(height: 16),
        _WasteTypeMiniCard(),
      ],
    );
  }
}

class _RevenueCard extends StatelessWidget {
  final String label, value, trend;
  final Color color;
  const _RevenueCard({required this.label, required this.value, required this.trend, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withOpacity(0.25), blurRadius: 12, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.trending_up, color: Colors.white70, size: 14),
              const SizedBox(width: 4),
              Text(trend + ' vs last period', style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

class _WasteTypeMiniCard extends StatelessWidget {
  final types = const [
    ('Sugarcane Bagasse', 0.32, AppTheme.forestGreen),
    ('Rice Husks', 0.24, AppTheme.oliveAccent),
    ('Maize Stalks', 0.20, AppTheme.lightGreen),
    ('Other', 0.24, AppTheme.border),
  ];

  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Waste by Type',
      subtitle: 'This month',
      child: Column(
        children: types.map((t) => _WasteTypeRow(label: t.$1, ratio: t.$2, color: t.$3)).toList(),
      ),
    );
  }
}

class _WasteTypeRow extends StatelessWidget {
  final String label;
  final double ratio;
  final Color color;
  const _WasteTypeRow({required this.label, required this.ratio, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              Text('${(ratio * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: ratio,
              backgroundColor: AppTheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  RECENT COLLECTIONS
// ─────────────────────────────────────────────
class _RecentCollectionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Active Collections',
      subtitle: '${MockData.collections.length} records today',
      action: 'View All',
      child: Column(
        children: MockData.collections.map((c) => _CollectionRow(data: c)).toList(),
      ),
    );
  }
}

class _CollectionRow extends StatefulWidget {
  final _CollectionData data;
  const _CollectionRow({required this.data});

  @override
  State<_CollectionRow> createState() => _CollectionRowState();
}

class _CollectionRowState extends State<_CollectionRow> {
  bool _hovering = false;

  Color get _statusColor => switch (widget.data.status) {
        CollectionStatus.active => AppTheme.statusActive,
        CollectionStatus.pending => AppTheme.statusPending,
        CollectionStatus.urgent => AppTheme.statusUrgent,
        CollectionStatus.completed => AppTheme.textMuted,
      };

  String get _statusLabel => switch (widget.data.status) {
        CollectionStatus.active => 'Active',
        CollectionStatus.pending => 'Pending',
        CollectionStatus.urgent => 'Urgent',
        CollectionStatus.completed => 'Done',
      };

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: _hovering ? AppTheme.surfaceVariant : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: AppTheme.paleGreen,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(Icons.agriculture, color: AppTheme.forestGreen, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.farm, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                  Text('${widget.data.type} · ${widget.data.weight}', style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _StatusBadge(label: _statusLabel, color: _statusColor),
                const SizedBox(height: 3),
                Text(widget.data.driver, style: const TextStyle(fontSize: 10, color: AppTheme.textMuted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  DRIVERS STATUS
// ─────────────────────────────────────────────
class _DriversStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Driver Status',
      subtitle: '${MockData.drivers.length} drivers assigned',
      action: 'Manage Fleet',
      child: Column(
        children: MockData.drivers.map((d) => _DriverRow(data: d)).toList(),
      ),
    );
  }
}

class _DriverRow extends StatelessWidget {
  final _DriverData data;
  const _DriverRow({required this.data});

  Color get _dotColor => switch (data.status) {
        DriverStatus.onRoute => AppTheme.statusActive,
        DriverStatus.available => AppTheme.statusInfo,
        DriverStatus.inactive => AppTheme.statusUrgent,
      };

  String get _statusLabel => switch (data.status) {
        DriverStatus.onRoute => 'On Route',
        DriverStatus.available => 'Available',
        DriverStatus.inactive => 'Inactive',
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppTheme.paleGreen,
                child: Text(
                  data.name.substring(0, 1),
                  style: const TextStyle(color: AppTheme.forestGreen, fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              Positioned(
                right: 0, bottom: 0,
                child: Container(
                  width: 10, height: 10,
                  decoration: BoxDecoration(
                    color: _dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                Text(data.vehicle, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_statusLabel, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: _dotColor)),
              Text('${data.collections} collections', style: const TextStyle(fontSize: 10, color: AppTheme.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  ALERTS
// ─────────────────────────────────────────────
class _AlertsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Operational Alerts',
      subtitle: '${MockData.alerts.length} active alerts',
      child: Column(
        children: MockData.alerts.map((a) => _AlertRow(data: a)).toList(),
      ),
    );
  }
}

class _AlertRow extends StatelessWidget {
  final _AlertData data;
  const _AlertRow({required this.data});

  Color get _color => switch (data.severity) {
        AlertSeverity.urgent => AppTheme.statusUrgent,
        AlertSeverity.pending => AppTheme.statusPending,
        AlertSeverity.info => AppTheme.statusInfo,
      };

  Color get _bg => switch (data.severity) {
        AlertSeverity.urgent => const Color(0xFFFEF2F2),
        AlertSeverity.pending => const Color(0xFFFFFBEB),
        AlertSeverity.info => const Color(0xFFEFF6FF),
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: _color, width: 3)),
      ),
      child: Row(
        children: [
          Icon(data.icon, color: _color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                Text(data.subtitle, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(data.time, style: const TextStyle(fontSize: 10, color: AppTheme.textMuted)),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('Act', style: TextStyle(fontSize: 11, color: _color, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  QUICK ACTIONS
// ─────────────────────────────────────────────
class _QuickActionsCard extends StatelessWidget {
  final _actions = const [
    _ActionItem(label: 'Assign Collection', icon: Icons.assignment_turned_in_outlined, color: AppTheme.forestGreen),
    _ActionItem(label: 'Add Vehicle', icon: Icons.add_circle_outline, color: AppTheme.oliveAccent),
    _ActionItem(label: 'Create Routine', icon: Icons.loop, color: AppTheme.statusInfo),
    _ActionItem(label: 'Generate Report', icon: Icons.bar_chart_outlined, color: AppTheme.statusPending),
  ];

  @override
  Widget build(BuildContext context) {
    return _DashCard(
      title: 'Quick Actions',
      subtitle: 'Common operations',
      child: Column(
        children: _actions.map((a) => _ActionButton(action: a)).toList(),
      ),
    );
  }
}

class _ActionItem {
  final String label;
  final IconData icon;
  final Color color;
  const _ActionItem({required this.label, required this.icon, required this.color});
}

class _ActionButton extends StatefulWidget {
  final _ActionItem action;
  const _ActionButton({required this.action});

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: _hovering ? widget.action.color.withOpacity(0.08) : AppTheme.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _hovering ? widget.action.color.withOpacity(0.4) : Colors.transparent),
          ),
          child: Row(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: widget.action.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(widget.action.icon, color: widget.action.color, size: 18),
              ),
              const SizedBox(width: 14),
              Expanded(child: Text(widget.action.label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary))),
              Icon(Icons.chevron_right, color: _hovering ? widget.action.color : AppTheme.textMuted, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  SHARED CARD CONTAINER
// ─────────────────────────────────────────────
class _DashCard extends StatelessWidget {
  final String title, subtitle;
  final String? action;
  final Widget child;

  const _DashCard({required this.title, required this.subtitle, this.action, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
        boxShadow: const [BoxShadow(color: Color(0x06000000), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ],
              ),
              if (action != null)
                GestureDetector(
                  onTap: () {},
                  child: Text(action!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.forestGreen)),
                ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  STATUS BADGE
// ─────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color)),
    );
  }
}

// ─────────────────────────────────────────────
//  GREEN BUTTON
// ─────────────────────────────────────────────
class _GreenButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _GreenButton({required this.label, required this.icon, required this.onTap});

  @override
  State<_GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<_GreenButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: _hovering ? AppTheme.deepGreen : AppTheme.forestGreen,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: AppTheme.forestGreen.withOpacity(_hovering ? 0.4 : 0.2), blurRadius: _hovering ? 16 : 8, offset: const Offset(0, 4))],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(widget.label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  MOBILE LAYOUT
// ─────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int selectedIndex;
  final ValueChanged<int> onNavChanged;
  final Animation<double> fadeAnimation;

  const _MobileLayout({
    required this.scaffoldKey,
    required this.selectedIndex,
    required this.onNavChanged,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.background,
      drawer: _MobileDrawer(selectedIndex: selectedIndex, onNavChanged: onNavChanged),
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: Row(
          children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(color: AppTheme.forestGreen, borderRadius: BorderRadius.circular(7)),
              child: const Icon(Icons.recycling, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('AgriWaste', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          ],
        ),
        actions: [
          _TopBarIcon(icon: Icons.notifications_outlined, badge: '5'),
          const SizedBox(width: 8),
          CircleAvatar(radius: 16, backgroundColor: AppTheme.forestGreen, child: const Text('RC', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700))),
          const SizedBox(width: 12),
        ],
        bottom: const PreferredSize(preferredSize: Size.fromHeight(1), child: Divider(height: 1, color: AppTheme.border)),
      ),
      body: FadeTransition(
        opacity: fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // KPI - 2-column grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.4),
                itemCount: MockData.kpis.length,
                itemBuilder: (_, i) {
                  final colors = [AppTheme.forestGreen, AppTheme.oliveAccent, AppTheme.statusPending, AppTheme.midGreen];
                  return _KpiCard(data: MockData.kpis[i], accentColor: colors[i]);
                },
              ),
              const SizedBox(height: 20),

              // Alerts
              _AlertsCard(),
              const SizedBox(height: 20),

              // Quick Actions
              _QuickActionsCard(),
              const SizedBox(height: 20),

              // Recent Collections
              _RecentCollectionsCard(),
              const SizedBox(height: 20),

              // Drivers
              _DriversStatusCard(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onNavChanged;

  const _MobileDrawer({required this.selectedIndex, required this.onNavChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.deepGreen,
      child: SafeArea(
        child: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(color: AppTheme.lightGreen, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.recycling, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('AgriWaste', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800)),
                      Text('Connect', style: TextStyle(color: AppTheme.lightGreen, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2D4F3A), height: 1),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemCount: kNavItems.length,
                itemBuilder: (ctx, i) => _SidebarItem(
                  item: kNavItems[i],
                  isSelected: selectedIndex == i,
                  collapsed: false,
                  onTap: () {
                    onNavChanged(i);
                    Navigator.pop(ctx);
                  },
                ),
              ),
            ),
            const Divider(color: Color(0xFF2D4F3A), height: 1),
            _SidebarItem(
              item: const NavItem(icon: Icons.logout_outlined, activeIcon: Icons.logout, label: 'Logout', route: '/logout'),
              isSelected: false,
              collapsed: false,
              onTap: () {},
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
