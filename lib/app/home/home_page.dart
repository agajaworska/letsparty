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

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  final fontColor = const Color.fromARGB(255, 68, 64, 72);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      body: Center(
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
                    fontSize: 52, color: Color.fromARGB(255, 50, 5, 58)),
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
                                builder: (context) => QuestPage()),
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
                            MaterialPageRoute(builder: (context) => DatePage()),
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
                            MaterialPageRoute(builder: (context) => MenuPage()),
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
                                builder: (context) => AttractionPage()),
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
                                builder: (context) => ThemePage()),
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
                                builder: (context) => BudgetPage()),
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
      ),
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
              tabBackgroundColor: Color.fromARGB(248, 227, 221, 239),
              color: Colors.black,
              selectedIndex: 1,
              tabs: const [
                GButton(
                  icon: Icons.person_outline,
                  text: 'Moje konto',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Strona główna',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                GButton(
                  icon: Icons.messenger_outline_outlined,
                  text: 'Czat',
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
