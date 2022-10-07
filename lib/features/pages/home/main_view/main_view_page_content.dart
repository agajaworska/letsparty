import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/app/core/config.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';

class MainViewPageContent extends StatelessWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            'L  E  T \' S   P  A  R  T  Y ',
            style: GoogleFonts.bebasNeue(
              fontWeight: FontWeight.w600,
              fontSize: 50,
              color: Color.fromARGB(249, 64, 25, 114),
              textStyle: const TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(4, 3),
                    blurRadius: 4.0,
                    color: Color.fromARGB(255, 85, 16, 146),
                  ),
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4.0,
                    color: Color.fromARGB(255, 251, 251, 251),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(Config.helloMessage),
        Expanded(
            child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 18.0),
          children: [
            InkWell(
              onTap: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuestPage()),
                );
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewBox(
                  child: Text(
                    'Guest list',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DatePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewBox(
                  child: Text(' Where & when ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.grey.shade900,
                      )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MenuPage(key),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AttractionPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewBox(
                  child: Text(
                    'Attractions',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ThemePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewBox(
                  child: Text(
                    'Party theme',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BudgetPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewBox(
                  child: Text(
                    'Budget',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ))
      ],
    ));
  }
}

class NewBox extends StatelessWidget {
  const NewBox({Key? key, required this.child}) : super(key: key);

  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 208, 245),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 83, 80, 85),
            blurRadius: 15,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Color.fromARGB(246, 253, 250, 255),
            blurRadius: 16,
            offset: Offset(-4, -4),
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(93, 183, 178, 229),
              Color.fromARGB(255, 195, 191, 231),
            ],
            stops: [
              0.1,
              0.9
            ]),
      ),
      child: Center(child: child),
    );
  }
}
