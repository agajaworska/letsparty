import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/app/core/config.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';
import 'package:letsparty/widgets/widgets.dart';

enum Tab {
  guest,
  where,
  menu,
  attractions,
  theme,
  budget,
}

class MainViewPageContent extends StatefulWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MainViewPageContent> createState() => _MainViewPageContentState();
}

class _MainViewPageContentState extends State<MainViewPageContent> {
  Tab? selectedTab;
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
              color: const Color.fromARGB(255, 29, 21, 83),
              textStyle: const TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(4, 3),
                    blurRadius: 4.0,
                    color: Color(0xFF332A6F),
                  ),
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4.0,
                    color: Color.fromARGB(255, 173, 166, 252),
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
                setState(() {
                  selectedTab = Tab.guest;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuestPage()),
                );
              }),
              child: NewBox(
                boxDecoration: selectedTab == Tab.guest
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
                child: Text(
                  'Guest list',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedTab = Tab.where;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DatePage()),
                );
              },
              child: NewBox(
                boxDecoration: selectedTab == Tab.where
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
                child: Text(' Where & when ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedTab = Tab.menu;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MenuPage(widget.key),
                  ),
                );
              },
              child: NewBox(
                boxDecoration: selectedTab == Tab.menu
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
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
                setState(() {
                  selectedTab = Tab.attractions;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AttractionPage()),
                );
              },
              child: NewBox(
                boxDecoration: selectedTab == Tab.attractions
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
                child: Text(
                  'Attractions',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedTab = Tab.theme;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ThemePage()),
                );
              },
              child: NewBox(
                boxDecoration: selectedTab == Tab.theme
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
                child: Text(
                  'Party theme',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedTab = Tab.budget;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BudgetPage()),
                );
              },
              child: NewBox(
                boxDecoration: selectedTab == Tab.budget
                    ? activeBoxDecoration
                    : inactiveBoxDecoration,
                child: Text(
                  'Budget',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.grey.shade900,
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
  const NewBox({
    Key? key,
    required this.child,
    required this.boxDecoration,
  }) : super(key: key);

  final Widget child;
  final BoxDecoration boxDecoration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: boxDecoration,
        child: Center(child: child),
      ),
    );
  }
}
