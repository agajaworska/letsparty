import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/app/core/config.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';
import 'package:letsparty/widgets/widgets.dart';

class MainViewPageContent extends StatefulWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<MainViewPageContent> createState() => _MainViewPageContentState();
}

class _MainViewPageContentState extends State<MainViewPageContent> {
  Box? selectedBox;
  final Color textColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 18.0, right: 8.0, left: 8.0, bottom: 18.0),
          child: Text(
            'LET\'S  PARTY ',
            style: GoogleFonts.bungeeShade(
              fontWeight: FontWeight.w600,
              fontSize: 50,
              color: textColor,
              textStyle: const TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(-1, 1),
                    blurRadius: 40,
                    color: Color.fromARGB(255, 255, 230, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(Config.helloMessage),
        Expanded(
            child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 18.0),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuestPage()),
                );
              },
              child: NewBox(
                boxDecoration: inactiveBoxDecoration(
                  iconPath: 'images/to-do.png',
                ),
                child: Text(
                  'Guest \nlist',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                    color: textColor,
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
              child: NewBox(
                boxDecoration: selectedBox == Box.where
                    ? activeBoxDecoration
                    : inactiveBoxDecoration(iconPath: 'images/party.png'),
                child: Text('Where \n& \nwhen',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: textColor,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MenuPage(widget.key),
                  ),
                );
              },
              child: NewBox(
                boxDecoration: selectedBox == Box.menu
                    ? activeBoxDecoration
                    : inactiveBoxDecoration(iconPath: 'images/food.png'),
                child: Text(
                  'Menu',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                    color: textColor,
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
              child: NewBox(
                boxDecoration:
                    inactiveBoxDecoration(iconPath: 'images/dance.png'),
                child: Text(
                  'Attractions',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                    color: textColor,
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
              child: NewBox(
                boxDecoration:
                    inactiveBoxDecoration(iconPath: 'images/camera.png'),
                child: Text(
                  'Party \ntheme',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                    color: textColor,
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
              child: NewBox(
                boxDecoration:
                    inactiveBoxDecoration(iconPath: 'images/coins.png'),
                child: Text(
                  'Budget',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                    color: textColor,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
