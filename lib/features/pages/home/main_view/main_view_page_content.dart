import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';
import 'package:letsparty/models/item_model.dart';

class MainViewPageContent extends StatelessWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'L  E  T \' S   P  A  R  T  Y ',
              style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.w600,
                fontSize: 50,
                color: const Color.fromARGB(255, 50, 5, 58),
                textStyle: const TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                      color: Color.fromARGB(255, 123, 24, 209),
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
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 18.0),
            children: [
              InkWell(
                onTap: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QuestPage()),
                  );
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DatePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: NewBox(
                    child: Text('Gdzie i kiedy',
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
                      'Atrakcje',
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
          ))
        ],
      ),
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
        color: Color.fromARGB(255, 212, 208, 245),
        borderRadius: BorderRadius.circular(8),
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
              Color.fromARGB(246, 245, 239, 249),
              Color.fromARGB(255, 183, 178, 229),
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
