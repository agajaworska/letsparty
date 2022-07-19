import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/UI/new_box.dart';
import 'package:letsparty/app/attraction/attr_page.dart';
import 'package:letsparty/app/budget/budget_page.dart';
import 'package:letsparty/app/date/date_page.dart';
import 'package:letsparty/app/menu/menu_page.dart';
import 'package:letsparty/app/quest/quest_page.dart';
import 'package:letsparty/app/theme/theme_page.dart';

class MainViewPageContent extends StatelessWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 5.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'L E T \'S  P A R T Y ',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 50, 5, 58),
                      textStyle: const TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 6.0,
                            color: Color.fromARGB(255, 72, 0, 111),
                          ),
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 6.0,
                            color: Color.fromARGB(255, 184, 41, 255),
                          ),
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 6.0,
                            color: Color.fromARGB(255, 227, 163, 255),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
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
                            fontSize: 30,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DatePage()),
                        );
                      },
                      child: NewBox(
                        child: Text('Gdzie i kiedy',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 30,
                              color: Colors.grey.shade900,
                            )),
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
                    InkWell(
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
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
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
                            color: Colors.grey.shade900,
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
                    InkWell(
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
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
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
                            color: Colors.grey.shade900,
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
    );
  }
}
