import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/new_box.dart';
import 'package:letsparty/app/attraction/attr_page.dart';
import 'package:letsparty/app/budget/budget_page.dart';
import 'package:letsparty/app/date/date_page.dart';
import 'package:letsparty/app/menu/menu_page.dart';
import 'package:letsparty/app/quest/quest_page.dart';
import 'package:letsparty/app/theme/theme_page.dart';

class MainViewPageContent extends StatelessWidget {
  MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'L E T \'S  P A R T Y ',
              style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                  color: const Color.fromARGB(255, 50, 5, 58),
                  textStyle: const TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(5.0, -5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 222, 161, 253),
                      ),
                    ],
                  )),
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
                            fontSize: 30,
                            color: Colors.grey.shade900,
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
                            color: Colors.grey.shade900,
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
                            color: Colors.grey.shade900,
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
                            color: Colors.grey.shade900,
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
                            color: Colors.grey.shade900,
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
