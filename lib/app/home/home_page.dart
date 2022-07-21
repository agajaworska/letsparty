import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:letsparty/app/home/chat/chat_page_content.dart';
import 'package:letsparty/app/home/main_view/main_view_page_content.dart';
import 'package:letsparty/app/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final fontColor = const Color.fromARGB(255, 68, 64, 72);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      body: Builder(builder: (context) {
        if (_selectedIndex == 0) {
          return MyAccountPageContent();
        }
        if (_selectedIndex == 1) {
          return const MainViewPageContent();
        }

        return const ChatPageContent();
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 212, 208, 245),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(248, 227, 221, 239),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.person_outline,
                  text: 'Moje konto ',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Strona główna',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                GButton(
                  icon: Icons.message_outlined,
                  text: 'Czat',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (newIndex) {
                setState(() {
                  _selectedIndex = newIndex;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
