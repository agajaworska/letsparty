import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';
import 'package:letsparty/models/item_models.dart';

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
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
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
                          MaterialPageRoute(builder: (context) => QuestPage()),
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
                          MaterialPageRoute(builder: (context) => DatePage()),
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
                          MaterialPageRoute(
                              builder: ((context) => MenuPage(key))),
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

class NewBox extends StatelessWidget {
  const NewBox({Key? key, required this.child}) : super(key: key);

  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Color.fromARGB(224, 240, 234, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 205, 132, 251),
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 250, 224, 224),
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ]),
      child: Center(child: child),
    );
  }
}
