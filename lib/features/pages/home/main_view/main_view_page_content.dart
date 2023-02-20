import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/app/core/config.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';
import 'package:letsparty/features/pages/attraction/attr_page.dart';
import 'package:letsparty/features/pages/budget/budget_page.dart';
import 'package:letsparty/features/pages/date/date_page.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
import 'package:letsparty/features/pages/menu/menu_page.dart';
import 'package:letsparty/features/pages/quest/quest_page.dart';
import 'package:letsparty/features/pages/theme/theme_page.dart';
import 'package:letsparty/widgets/widgets.dart';

class MainViewPageContent extends StatefulWidget {
  MainViewPageContent({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<MainViewPageContent> createState() => _MainViewPageContentState();
}

class _MainViewPageContentState extends State<MainViewPageContent> {
  Box? selectedBox;

  final Color textColor = Colors.grey.shade800;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) =>
          AccountCubit(UserRepository(UserRemoteDataSource()))..start(),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          final userModels = state.documents;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 12.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text(
                      //   'L E T\' S\nP A R T Y !',
                      //   textAlign: TextAlign.start,
                      //   style: GoogleFonts.fjallaOne(
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 52,
                      //     color: const Color.fromARGB(255, 108, 188, 177),
                      //     textStyle: const TextStyle(
                      //       shadows: <Shadow>[
                      //         Shadow(
                      //           offset: Offset(4, 4),
                      //           blurRadius: 1,
                      //           color: Color.fromARGB(255, 7, 7, 6),
                      //         ),
                      //         Shadow(
                      //           offset: Offset(-3, -3),
                      //           blurRadius: 1,
                      //           color: Color.fromARGB(255, 255, 251, 199),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: 200,
                              width: 330,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/hey.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // for (final userModel in userModels) ...[
                            //   if (userModel.photo!.isNotEmpty)
                            //     Container(
                            //       alignment: Alignment.topRight,
                            //       height: 160,
                            //       width: 160,
                            //       decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         image: DecorationImage(
                            //           image: NetworkImage(userModel.photo!),
                            //           fit: BoxFit.cover,
                            //         ),
                            //       ),
                            //     )
                            // ],
                          ],
                        ),
                      ),
                    ]),
              ),
              // Text(Config.helloMessage),
              Expanded(
                  child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 18.0),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const QuestPage()),
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
                        MaterialPageRoute(
                            builder: (context) => const DatePage()),
                      );
                    },
                    child: NewBox(
                      boxDecoration:
                          inactiveBoxDecoration(iconPath: 'images/party.png'),
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
                      boxDecoration:
                          inactiveBoxDecoration(iconPath: 'images/food.png'),
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
                        MaterialPageRoute(
                            builder: (context) => AttractionPage()),
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
          );
        },
      ),
    ));
  }
}
