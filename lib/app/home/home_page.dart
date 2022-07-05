import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:letsparty/features/new_box.dart';
import 'package:letsparty/app/attraction/attr_page.dart';
import 'package:letsparty/app/budget/budget_page.dart';
import 'package:letsparty/app/date/date_page.dart';
import 'package:letsparty/app/menu/menu_page.dart';
import 'package:letsparty/app/quest/quest_page.dart';
import 'package:letsparty/app/theme/theme_page.dart';
import 'package:letsparty/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  final fontColor = const Color.fromARGB(255, 68, 64, 72);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      body: Builder(builder: (context) {
        if (_selectedIndex == 0) {
          return MyAccountPageContent(user: widget.user);
        }
        if (_selectedIndex == 1) {
          return const ChatPageContent();
        }

        return MainViewPageContent(fontColor: fontColor);
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
                  icon: Icons.messenger_outline_outlined,
                  text: 'Czat',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Strona główna',
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

class MainViewPageContent extends StatelessWidget {
  const MainViewPageContent({
    Key? key,
    required this.fontColor,
  }) : super(key: key);

  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'L E T \'S  P A R T Y ',
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
                color: const Color.fromARGB(255, 50, 5, 58),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const QuestPage()),
                        );
                      }),
                      child: NewBox(
                        child: Text(
                          'Lista gości',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 30, color: fontColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DatePage()),
                        );
                      },
                      child: NewBox(
                        child: Text('Gdzie i kiedy',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: fontColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MenuPage()),
                        );
                      },
                      child: NewBox(
                        child: Text(
                          'Menu',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                            color: fontColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AttractionPage()),
                        );
                      },
                      child: NewBox(
                        child: Text(
                          'Atrakcje',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                            color: fontColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ThemePage()),
                        );
                      },
                      child: NewBox(
                        child: Text(
                          'Motyw imprezy',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                            color: fontColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const BudgetPage()),
                        );
                      },
                      child: NewBox(
                        child: Text(
                          'Finanse',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                            color: fontColor,
                          ),
                        ),
                      ),
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

class ChatPageContent extends StatelessWidget {
  const ChatPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dwa'),
    );
  }
}

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Konto ${user.email}'),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Wyloguj'))
        ],
      ),
    );
  }
}
