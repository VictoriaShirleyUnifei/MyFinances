import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/features/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Statistics')),
    Center(child: Text('Wallet')),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: _selectedIndex == index ? AppColors.primary : Colors.grey,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

     floatingActionButton: FloatingActionButton(
     onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Ação do botão +'),
          ),
        );
      },
      backgroundColor: AppColors.primary,
      shape: const CircleBorder(), // deixa o botão 100% redondo
      child: const Icon(Icons.add, color: Colors.white), 
    ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.bar_chart, 1),
              const SizedBox(width: 48), // espaço para o botão flutuante
              _buildNavItem(Icons.account_balance_wallet_outlined, 2),
              _buildNavItem(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
    );
  }
}
