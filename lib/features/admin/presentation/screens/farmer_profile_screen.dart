import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// THEME / TOKENS
// ─────────────────────────────────────────────────────────────────────────────

class _AppColors {
  static const deepGreen = Color(0xFF1A5C38);
  static const midGreen = Color(0xFF2E7D52);
  static const lightGreen = Color(0xFFE8F5EE);
  static const accentOlive = Color(0xFF6B7C45);
  static const accentGold = Color(0xFFF5A623);
  static const pending = Color(0xFFFFF3CD);
  static const pendingText = Color(0xFF856404);
  static const warning = Color(0xFFFFE8E8);
  static const warningText = Color(0xFFB91C1C);
  static const success = Color(0xFFD1FAE5);
  static const successText = Color(0xFF065F46);
  static const surface = Color(0xFFF9FAFB);
  static const cardBg = Colors.white;
  static const border = Color(0xFFE5E7EB);
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);
  static const textMuted = Color(0xFF9CA3AF);
  static const sidebarBg = Color(0xFF0F3D25);
  static const sidebarActive = Color(0xFF1A5C38);
  static const sidebarText = Color(0xFFD1FAE5);
}

class _AppText {
  static const displayLarge = TextStyle(
    fontFamily: 'Georgia',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: _AppColors.textPrimary,
    letterSpacing: -0.5,
  );
  static const heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: _AppColors.textPrimary,
    letterSpacing: -0.2,
  );
  static const subheading = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: _AppColors.textSecondary,
    letterSpacing: 0.8,
  );
  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _AppColors.textPrimary,
    height: 1.5,
  );
  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _AppColors.textSecondary,
    height: 1.4,
  );
  static const metric = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: _AppColors.textPrimary,
    letterSpacing: -0.5,
  );
  static const label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODELS
// ─────────────────────────────────────────────────────────────────────────────

enum FarmerStatus { active, inactive, suspended }

class FarmerModel {
  final String id;
  final String name;
  final String farmName;
  final String phone;
  final String email;
  final String location;
  final String joinDate;
  final FarmerStatus status;
  final int totalPickups;
  final int completedPickups;
  final double totalEarnings;
  final double avgWasteWeight;
  final double consistencyScore;

  const FarmerModel({
    required this.id,
    required this.name,
    required this.farmName,
    required this.phone,
    required this.email,
    required this.location,
    required this.joinDate,
    required this.status,
    required this.totalPickups,
    required this.completedPickups,
    required this.totalEarnings,
    required this.avgWasteWeight,
    required this.consistencyScore,
  });
}

class CollectionRecord {
  final String wasteType;
  final double quantity;
  final String date;
  final String driver;
  final String status;

  const CollectionRecord({
    required this.wasteType,
    required this.quantity,
    required this.date,
    required this.driver,
    required this.status,
  });
}

class ActivityItem {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color color;

  const ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// MOCK DATA
// ─────────────────────────────────────────────────────────────────────────────

final _mockFarmer = FarmerModel(
  id: 'FRM-2024-0082',
  name: 'John Mwangi',
  farmName: 'Green Hill Farm',
  phone: '+254 712 345 678',
  email: 'john.mwangi@greenhill.co.ke',
  location: 'Kiambu Road, Nairobi',
  joinDate: 'January 14, 2024',
  status: FarmerStatus.active,
  totalPickups: 38,
  completedPickups: 34,
  totalEarnings: 62450,
  avgWasteWeight: 387.5,
  consistencyScore: 89.4,
);

final _mockCollections = [
  CollectionRecord(wasteType: 'Dry Stalks', quantity: 450, date: 'Apr 2, 2025', driver: 'Peter Omondi', status: 'Completed'),
  CollectionRecord(wasteType: 'Manure', quantity: 300, date: 'Mar 28, 2025', driver: 'Alice Wanjiku', status: 'Completed'),
  CollectionRecord(wasteType: 'Crop Residue', quantity: 520, date: 'Mar 15, 2025', driver: 'Peter Omondi', status: 'Completed'),
  CollectionRecord(wasteType: 'Dry Stalks', quantity: 380, date: 'Mar 3, 2025', driver: 'David Kiprop', status: 'Missed'),
  CollectionRecord(wasteType: 'Organic Mix', quantity: 410, date: 'Feb 20, 2025', driver: 'Alice Wanjiku', status: 'Pending'),
  CollectionRecord(wasteType: 'Manure', quantity: 275, date: 'Feb 8, 2025', driver: 'David Kiprop', status: 'Completed'),
];

final _mockActivities = [
  ActivityItem(
    icon: Icons.inventory_2_outlined,
    title: 'New Waste Listing',
    description: '420 kg of dry stalks listed for pickup',
    time: '2 hours ago',
    color: _AppColors.midGreen,
  ),
  ActivityItem(
    icon: Icons.check_circle_outline,
    title: 'Pickup Completed',
    description: 'Driver Peter Omondi completed collection',
    time: 'Apr 2 · 10:34 AM',
    color: _AppColors.successText,
  ),
  ActivityItem(
    icon: Icons.person_outline,
    title: 'Driver Assigned',
    description: 'Alice Wanjiku assigned to next pickup',
    time: 'Apr 1 · 3:12 PM',
    color: _AppColors.accentOlive,
  ),
  ActivityItem(
    icon: Icons.payments_outlined,
    title: 'Payment Received',
    description: 'KSh 2,250 disbursed via M-Pesa',
    time: 'Apr 2 · 11:05 AM',
    color: _AppColors.accentGold,
  ),
  ActivityItem(
    icon: Icons.warning_amber_outlined,
    title: 'Missed Pickup',
    description: 'Farmer unavailable — Mar 3 collection skipped',
    time: 'Mar 3 · 9:00 AM',
    color: _AppColors.warningText,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// MAIN SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class FarmerProfileScreen extends StatefulWidget {
  final String farmerId;
  const FarmerProfileScreen({super.key, required this.farmerId});

  @override
  State<FarmerProfileScreen> createState() => _FarmerProfileScreenState();
}

class _FarmerProfileScreenState extends State<FarmerProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  String _searchQuery = '';
  String _statusFilter = 'All';
  bool _farmerActive = true;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final isTablet = w >= 600 && w < 1024;

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _AppColors.deepGreen,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: _AppColors.surface,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: _AppColors.surface,
        drawer: isDesktop ? null : _SidebarDrawer(),
        body: FadeTransition(
          opacity: _fadeAnim,
          child: Row(
            children: [
              if (isDesktop) _Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    _TopBar(
                      isDesktop: isDesktop,
                      scaffoldKey: _scaffoldKey,
                    ),
                    Expanded(
                      child: _buildBody(isDesktop, isTablet),
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

  Widget _buildBody(bool isDesktop, bool isTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isDesktop ? 32 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Breadcrumb(),
          const SizedBox(height: 24),
          if (isDesktop)
            _buildDesktopLayout()
          else
            _buildMobileLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1: Profile + Analytics
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 340,
              child: _FarmerProfileCard(
                farmer: _mockFarmer,
                isActive: _farmerActive,
                onToggleActive: (v) => setState(() => _farmerActive = v),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  _AnalyticsGrid(farmer: _mockFarmer, crossAxisCount: 3),
                  const SizedBox(height: 24),
                  _PerformanceInsightsRow(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Row 2: Collection History + Timeline
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: _CollectionHistorySection(
                collections: _mockCollections,
                isDesktop: true,
                searchQuery: _searchQuery,
                statusFilter: _statusFilter,
                onSearch: (q) => setState(() => _searchQuery = q),
                onFilter: (f) => setState(() => _statusFilter = f),
              ),
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  _ActivityTimeline(activities: _mockActivities),
                  const SizedBox(height: 24),
                  _AlertsSection(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FarmerProfileCard(
          farmer: _mockFarmer,
          isActive: _farmerActive,
          onToggleActive: (v) => setState(() => _farmerActive = v),
        ),
        const SizedBox(height: 20),
        _AnalyticsGrid(farmer: _mockFarmer, crossAxisCount: 2),
        const SizedBox(height: 20),
        _PerformanceInsightsMobile(),
        const SizedBox(height: 20),
        _CollectionHistorySection(
          collections: _mockCollections,
          isDesktop: false,
          searchQuery: _searchQuery,
          statusFilter: _statusFilter,
          onSearch: (q) => setState(() => _searchQuery = q),
          onFilter: (f) => setState(() => _statusFilter = f),
        ),
        const SizedBox(height: 20),
        _ActivityTimeline(activities: _mockActivities),
        const SizedBox(height: 20),
        _AlertsSection(),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SIDEBAR
// ─────────────────────────────────────────────────────────────────────────────

class _Sidebar extends StatelessWidget {
  final List<_NavItem> _items = const [
    _NavItem(Icons.dashboard_outlined, 'Dashboard', false),
    _NavItem(Icons.people_outline, 'Farmers', true),
    _NavItem(Icons.local_shipping_outlined, 'Pickups', false),
    _NavItem(Icons.inventory_outlined, 'Inventory', false),
    _NavItem(Icons.bar_chart_outlined, 'Analytics', false),
    _NavItem(Icons.route_outlined, 'Routes', false),
    _NavItem(Icons.payments_outlined, 'Payments', false),
    _NavItem(Icons.settings_outlined, 'Settings', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: _AppColors.sidebarBg,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _AppColors.midGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.eco, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                const Text(
                  'AgriWaste',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ...(_items.map((item) => _SidebarNavItem(item: item))),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: _AppColors.midGreen,
                  child: const Text('AD', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Admin', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                    Text('Operations', style: TextStyle(color: _AppColors.sidebarText, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: _Sidebar());
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final bool active;
  const _NavItem(this.icon, this.label, this.active);
}

class _SidebarNavItem extends StatelessWidget {
  final _NavItem item;
  const _SidebarNavItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: item.active ? _AppColors.sidebarActive : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(item.icon,
            color: item.active ? Colors.white : _AppColors.sidebarText, size: 18),
        title: Text(
          item.label,
          style: TextStyle(
            color: item.active ? Colors.white : _AppColors.sidebarText,
            fontSize: 13,
            fontWeight: item.active ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TOP BAR
// ─────────────────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  final bool isDesktop;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _TopBar({required this.isDesktop, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: _AppColors.cardBg,
        border: Border(bottom: BorderSide(color: _AppColors.border)),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu, color: _AppColors.textSecondary),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
          if (!isDesktop) const SizedBox(width: 8),
          Expanded(
            child: isDesktop
                ? Container(
                    height: 36,
                    constraints: const BoxConstraints(maxWidth: 320),
                    decoration: BoxDecoration(
                      color: _AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _AppColors.border),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search farmers, pickups...',
                        hintStyle: TextStyle(fontSize: 13, color: _AppColors.textMuted),
                        prefixIcon: Icon(Icons.search, size: 16, color: _AppColors.textMuted),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: _AppColors.textSecondary),
                onPressed: () {},
              ),
              Positioned(
                right: 8, top: 8,
                child: Container(
                  width: 8, height: 8,
                  decoration: const BoxDecoration(
                    color: _AppColors.accentGold,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 18,
            backgroundColor: _AppColors.midGreen,
            child: const Text('AD', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BREADCRUMB
// ─────────────────────────────────────────────────────────────────────────────

class _Breadcrumb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _crumb('Farmers', active: false),
        const Icon(Icons.chevron_right, size: 14, color: _AppColors.textMuted),
        _crumb('John Mwangi', active: true),
      ],
    );
  }

  Widget _crumb(String label, {required bool active}) => Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: active ? _AppColors.deepGreen : _AppColors.textMuted,
          fontWeight: active ? FontWeight.w600 : FontWeight.w400,
        ),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// FARMER PROFILE CARD
// ─────────────────────────────────────────────────────────────────────────────

class _FarmerProfileCard extends StatelessWidget {
  final FarmerModel farmer;
  final bool isActive;
  final ValueChanged<bool> onToggleActive;

  const _FarmerProfileCard({
    required this.farmer,
    required this.isActive,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: _AppColors.lightGreen,
                    child: Text(
                      farmer.name.split(' ').map((e) => e[0]).take(2).join(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _AppColors.deepGreen,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2, right: 2,
                    child: Container(
                      width: 13, height: 13,
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xFF22C55E) : _AppColors.warningText,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(farmer.name, style: _AppText.heading),
                    const SizedBox(height: 2),
                    Text(farmer.farmName, style: _AppText.body.copyWith(color: _AppColors.textSecondary)),
                    const SizedBox(height: 8),
                    _StatusBadge(status: farmer.status),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _divider(),
          const SizedBox(height: 16),
          // Info rows
          _InfoRow(Icons.badge_outlined, 'Farmer ID', farmer.id),
          _InfoRow(Icons.phone_outlined, 'Phone', farmer.phone),
          _InfoRow(Icons.email_outlined, 'Email', farmer.email),
          _InfoRow(Icons.location_on_outlined, 'Location', farmer.location),
          _InfoRow(Icons.calendar_today_outlined, 'Joined', farmer.joinDate),
          const SizedBox(height: 20),
          _divider(),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: _AppColors.deepGreen,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.phone, size: 16),
                  label: const Text('Contact', style: TextStyle(fontSize: 13)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isActive ? _AppColors.warningText : _AppColors.deepGreen,
                    side: BorderSide(
                      color: isActive ? _AppColors.warningText : _AppColors.deepGreen,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => onToggleActive(!isActive),
                  icon: Icon(isActive ? Icons.block : Icons.check_circle_outline, size: 16),
                  label: Text(
                    isActive ? 'Deactivate' : 'Activate',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider() => const Divider(color: _AppColors.border, height: 1);
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: _AppColors.textMuted),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: _AppText.bodySmall),
                Text(value, style: _AppText.body.copyWith(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final FarmerStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (status) {
      FarmerStatus.active => ('Active', _AppColors.success, _AppColors.successText),
      FarmerStatus.inactive => ('Inactive', _AppColors.warning, _AppColors.warningText),
      FarmerStatus.suspended => ('Suspended', const Color(0xFFFFE4E6), const Color(0xFF9F1239)),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: _AppText.label.copyWith(color: fg, fontSize: 11)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ANALYTICS GRID
// ─────────────────────────────────────────────────────────────────────────────

class _AnalyticsGrid extends StatelessWidget {
  final FarmerModel farmer;
  final int crossAxisCount;

  const _AnalyticsGrid({required this.farmer, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    final kpis = [
      _KpiData(Icons.local_shipping_outlined, 'Total Pickups',
          farmer.totalPickups.toString(), 'All scheduled collections', '+2 this month', true),
      _KpiData(Icons.check_circle_outline, 'Completed',
          farmer.completedPickups.toString(), 'Successful deliveries', '89% completion rate', true),
      _KpiData(Icons.payments_outlined, 'Total Earnings',
          'KSh ${_fmt(farmer.totalEarnings)}', 'Lifetime disbursed', '+KSh 2,250 Apr', true),
      _KpiData(Icons.scale_outlined, 'Avg Weight',
          '${farmer.avgWasteWeight.toStringAsFixed(0)} kg', 'Per collection', 'Trending up ↑', true),
      _KpiData(Icons.star_outline, 'Consistency',
          '${farmer.consistencyScore}%', 'Reliability score', 'Above average', true),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: crossAxisCount == 3 ? 1.6 : 1.4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: kpis.length,
      itemBuilder: (_, i) => _KpiCard(data: kpis[i]),
    );
  }

  String _fmt(double n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toStringAsFixed(0);
  }
}

class _KpiData {
  final IconData icon;
  final String label;
  final String value;
  final String description;
  final String trend;
  final bool positive;

  const _KpiData(this.icon, this.label, this.value, this.description, this.trend, this.positive);
}

class _KpiCard extends StatefulWidget {
  final _KpiData data;
  const _KpiCard({required this.data});

  @override
  State<_KpiCard> createState() => _KpiCardState();
}

class _KpiCardState extends State<_KpiCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? _AppColors.midGreen : _AppColors.border,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? _AppColors.midGreen.withOpacity(0.08)
                  : Colors.black.withOpacity(0.04),
              blurRadius: _hovered ? 12 : 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(widget.data.icon, size: 16, color: _AppColors.deepGreen),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: _AppColors.success,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.data.trend,
                    style: _AppText.label.copyWith(
                      fontSize: 10,
                      color: _AppColors.successText,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data.value, style: _AppText.metric.copyWith(fontSize: 22)),
                const SizedBox(height: 2),
                Text(widget.data.label, style: _AppText.body.copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
                Text(widget.data.description, style: _AppText.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PERFORMANCE INSIGHTS
// ─────────────────────────────────────────────────────────────────────────────

class _PerformanceInsightsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CompletionRateCard()),
        const SizedBox(width: 16),
        Expanded(child: _WasteTrendCard()),
        const SizedBox(width: 16),
        Expanded(child: _ReliabilityCard()),
      ],
    );
  }
}

class _PerformanceInsightsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CompletionRateCard(),
        const SizedBox(height: 16),
        _WasteTrendCard(),
        const SizedBox(height: 16),
        _ReliabilityCard(),
      ],
    );
  }
}

class _CompletionRateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('COMPLETION RATE', style: _AppText.subheading),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('89.4%', style: _AppText.metric),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('34 / 38 pickups',
                    style: _AppText.bodySmall.copyWith(color: _AppColors.textSecondary)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.894,
              minHeight: 8,
              backgroundColor: _AppColors.border,
              valueColor: const AlwaysStoppedAnimation(_AppColors.deepGreen),
            ),
          ),
          const SizedBox(height: 8),
          Text('Above district average (82%)', style: _AppText.bodySmall),
        ],
      ),
    );
  }
}

class _WasteTrendCard extends StatelessWidget {
  final List<double> _data = const [320, 410, 380, 450, 300, 520];
  final List<String> _months = const ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr'];

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MONTHLY WASTE (KG)', style: _AppText.subheading),
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_data.length, (i) {
                final h = (_data[i] / 520) * 60;
                return Tooltip(
                  message: '${_months[i]}: ${_data[i].toInt()} kg',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400 + i * 80),
                        width: 24,
                        height: h,
                        decoration: BoxDecoration(
                          color: i == _data.length - 1
                              ? _AppColors.deepGreen
                              : _AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _months.map((m) => Text(m, style: _AppText.bodySmall.copyWith(fontSize: 10))).toList(),
          ),
        ],
      ),
    );
  }
}

class _ReliabilityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final score = 89.4;
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RELIABILITY SCORE', style: _AppText.subheading),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 90,
              height: 90,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: score / 100,
                    strokeWidth: 8,
                    backgroundColor: _AppColors.border,
                    valueColor: const AlwaysStoppedAnimation(_AppColors.deepGreen),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${score.toInt()}',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _AppColors.deepGreen)),
                      const Text('/100', style: TextStyle(fontSize: 10, color: _AppColors.textMuted)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(child: Text('Excellent reliability', style: _AppText.bodySmall.copyWith(fontWeight: FontWeight.w600, color: _AppColors.successText))),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// COLLECTION HISTORY
// ─────────────────────────────────────────────────────────────────────────────

class _CollectionHistorySection extends StatelessWidget {
  final List<CollectionRecord> collections;
  final bool isDesktop;
  final String searchQuery;
  final String statusFilter;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onFilter;

  const _CollectionHistorySection({
    required this.collections,
    required this.isDesktop,
    required this.searchQuery,
    required this.statusFilter,
    required this.onSearch,
    required this.onFilter,
  });

  List<CollectionRecord> get _filtered {
    return collections.where((c) {
      final matchesSearch = searchQuery.isEmpty ||
          c.wasteType.toLowerCase().contains(searchQuery.toLowerCase()) ||
          c.driver.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus = statusFilter == 'All' || c.status == statusFilter;
      return matchesSearch && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Collection History', style: _AppText.heading),
              Text('${_filtered.length} records', style: _AppText.bodySmall),
            ],
          ),
          const SizedBox(height: 16),
          // Search + Filter
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    hintText: 'Search waste type, driver...',
                    hintStyle: _AppText.bodySmall,
                    prefixIcon: const Icon(Icons.search, size: 16, color: _AppColors.textMuted),
                    filled: true,
                    fillColor: _AppColors.surface,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: _AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: _AppColors.border),
                    ),
                  ),
                  style: _AppText.body.copyWith(fontSize: 13),
                ),
              ),
              const SizedBox(width: 12),
              _FilterDropdown(value: statusFilter, onChanged: onFilter),
            ],
          ),
          const SizedBox(height: 16),
          isDesktop ? _DesktopTable(records: _filtered) : _MobileCards(records: _filtered),
          const SizedBox(height: 12),
          _Pagination(),
        ],
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _FilterDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: _AppColors.border),
        borderRadius: BorderRadius.circular(8),
        color: _AppColors.surface,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          style: _AppText.body.copyWith(fontSize: 13),
          items: ['All', 'Completed', 'Pending', 'Missed']
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (v) => v != null ? onChanged(v) : null,
        ),
      ),
    );
  }
}

class _DesktopTable extends StatelessWidget {
  final List<CollectionRecord> records;
  const _DesktopTable({required this.records});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: _AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _th('WASTE TYPE', flex: 2),
              _th('QTY (KG)', flex: 1),
              _th('DATE', flex: 2),
              _th('DRIVER', flex: 2),
              _th('STATUS', flex: 1),
            ],
          ),
        ),
        const SizedBox(height: 4),
        ...records.map((r) => _TableRow(record: r)),
      ],
    );
  }

  Widget _th(String label, {int flex = 1}) => Expanded(
        flex: flex,
        child: Text(label, style: _AppText.label.copyWith(color: _AppColors.textMuted, fontSize: 11)),
      );
}

class _TableRow extends StatefulWidget {
  final CollectionRecord record;
  const _TableRow({required this.record});

  @override
  State<_TableRow> createState() => _TableRowState();
}

class _TableRowState extends State<_TableRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: _hovered ? _AppColors.lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _hovered ? _AppColors.lightGreen : Colors.transparent),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text(widget.record.wasteType, style: _AppText.body.copyWith(fontSize: 13, fontWeight: FontWeight.w500))),
            Expanded(flex: 1, child: Text('${widget.record.quantity.toInt()} kg', style: _AppText.body.copyWith(fontSize: 13))),
            Expanded(flex: 2, child: Text(widget.record.date, style: _AppText.body.copyWith(fontSize: 13, color: _AppColors.textSecondary))),
            Expanded(flex: 2, child: Text(widget.record.driver, style: _AppText.body.copyWith(fontSize: 13))),
            Expanded(flex: 1, child: _StatusChip(status: widget.record.status)),
          ],
        ),
      ),
    );
  }
}

class _MobileCards extends StatelessWidget {
  final List<CollectionRecord> records;
  const _MobileCards({required this.records});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: records.map((r) => _MobileCollectionCard(record: r)).toList(),
    );
  }
}

class _MobileCollectionCard extends StatelessWidget {
  final CollectionRecord record;
  const _MobileCollectionCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(record.wasteType, style: _AppText.body.copyWith(fontWeight: FontWeight.w600)),
              _StatusChip(status: record.status),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _pill(Icons.scale_outlined, '${record.quantity.toInt()} kg'),
              const SizedBox(width: 10),
              _pill(Icons.calendar_today_outlined, record.date),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _pill(Icons.person_outline, record.driver),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(IconData icon, String label) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: _AppColors.textMuted),
          const SizedBox(width: 4),
          Text(label, style: _AppText.bodySmall),
        ],
      );
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (status) {
      'Completed' => (_AppColors.success, _AppColors.successText),
      'Pending' => (_AppColors.pending, _AppColors.pendingText),
      'Missed' => (_AppColors.warning, _AppColors.warningText),
      _ => (_AppColors.border, _AppColors.textMuted),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(status, style: _AppText.label.copyWith(color: fg, fontSize: 10)),
    );
  }
}

class _Pagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Showing 1–6 of 38', style: _AppText.bodySmall),
        const SizedBox(width: 16),
        _pageBtn(Icons.chevron_left, false),
        const SizedBox(width: 4),
        _activePage('1'),
        const SizedBox(width: 4),
        _pageBtn(Icons.chevron_right, true),
      ],
    );
  }

  Widget _pageBtn(IconData icon, bool enabled) => Container(
        width: 30, height: 30,
        decoration: BoxDecoration(
          color: _AppColors.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: _AppColors.border),
        ),
        child: Icon(icon, size: 16, color: enabled ? _AppColors.textPrimary : _AppColors.textMuted),
      );

  Widget _activePage(String n) => Container(
        width: 30, height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _AppColors.deepGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(n, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// ACTIVITY TIMELINE
// ─────────────────────────────────────────────────────────────────────────────

class _ActivityTimeline extends StatelessWidget {
  final List<ActivityItem> activities;
  const _ActivityTimeline({required this.activities});

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Activity', style: _AppText.heading),
          const SizedBox(height: 16),
          ...List.generate(activities.length, (i) {
            final item = activities[i];
            final isLast = i == activities.length - 1;
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                          color: item.color.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon, size: 15, color: item.color),
                      ),
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 1,
                            color: _AppColors.border,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: _AppText.body.copyWith(fontSize: 13, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 2),
                          Text(item.description, style: _AppText.bodySmall),
                          const SizedBox(height: 4),
                          Text(item.time,
                              style: _AppText.bodySmall.copyWith(color: _AppColors.textMuted, fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ALERTS
// ─────────────────────────────────────────────────────────────────────────────

class _AlertsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Alerts & Warnings', style: _AppText.heading),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: _AppColors.warning,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('1 Issue', style: _AppText.label.copyWith(color: _AppColors.warningText, fontSize: 10)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _AlertCard(
            icon: Icons.warning_amber_outlined,
            title: 'Missed Pickup',
            description: 'Mar 3 collection was not completed. Driver reported unavailability.',
            color: _AppColors.warningText,
            bg: _AppColors.warning,
          ),
          const SizedBox(height: 8),
          _AlertCard(
            icon: Icons.info_outline,
            title: 'Pending Review',
            description: 'Feb 20 collection awaiting quality inspection.',
            color: _AppColors.pendingText,
            bg: _AppColors.pending,
          ),
        ],
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final Color bg;

  const _AlertCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: _AppText.body.copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
                const SizedBox(height: 2),
                Text(description, style: _AppText.bodySmall.copyWith(color: color.withOpacity(0.8))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED CARD WIDGET
// ─────────────────────────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const _Card({required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
