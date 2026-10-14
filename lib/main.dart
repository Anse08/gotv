import 'package:flutter/material.dart';

void main() {
  runApp(const GoTvApp());
}

class GoTvApp extends StatelessWidget {
  const GoTvApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go tv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        primaryColor: const Color(0xFF1F6FEB),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1F6FEB),
          surface: Color(0xFF161B22),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['الصفحة الرئيسية', 'دراما كورية', 'أفلام', 'مسلسلات', 'رعب'];
  int _selectedCategory = 0;

  // قائمة المصادر التي ستظهر في القائمة المنسدلة
  final List<Map<String, String>> sources = [
    {'name': 'None', 'flag': '🌐'},
    {'name': 'Random', 'flag': '🔀'},
    {'name': 'Aflaam', 'flag': '🇪🇬'},
    {'name': 'Akwam', 'flag': '🇪🇬'},
    {'name': 'AlooYTv', 'flag': '🇪🇬'},
    {'name': 'Arabseed', 'flag': '🇪🇬'},
    {'name': 'Asia2Tv.Com', 'flag': '🇪🇬'},
    {'name': 'bristege', 'flag': '🇪🇬'},
    {'name': 'CimaClub', 'flag': '🇪🇬'},
    {'name': 'CimaLight', 'flag': '🇪🇬'},
    {'name': 'CimaTn', 'flag': '🇹🇳'},
    {'name': 'CimaWbas', 'flag': '🇪🇬'},
    {'name': 'Disney Plus', 'flag': '🇺🇸'},
    {'name': 'FASELHD', 'flag': '🇪🇬'},
    {'name': 'Hotstar', 'flag': '🇮🇳'},
    {'name': 'Netflix', 'flag': '🇺🇸'},
  ];

  // دالة لإظهار قائمة المصادر السفلية
  void _showSourcesModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF161B22),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          height: 450,
          child: ListView.builder(
            itemCount: sources.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  sources[index]['flag']!,
                  style: const TextStyle(fontSize: 20),
                ),
                title: Text(
                  sources[index]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // يمكنك هنا تنفيذ إجراء عند اختيار المصدر
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // شريط علوي يتمدد وينكمش عند التمرير
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF0F1117),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Doctor X',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1F6FEB), Color(0xFF0D1117)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      bottom: 50,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctor X',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'أحدث الدراما والتشويق الغامض',
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white70),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.history, color: Colors.white70),
                onPressed: () {},
              ),
            ],
          ),

          // باقي محتوى الصفحة
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // شريط التصنيفات الأفقية
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedCategory == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF1F6FEB) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white60,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      // زر CIMANAW العائم وعند الضغط عليه تفتح القائمة
      floatingActionButton: GestureDetector(
        onTap: () => _showSourcesModal(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF161B22),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white24, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.filter_list, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'CIMANAW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}