import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ionicons/ionicons.dart';
import 'package:letsparty/app/core/enums/enums.dart';

import 'package:letsparty/features/pages/home/chat/chat_page_content.dart';
import 'package:letsparty/features/pages/home/cubit/home_cubit.dart';
import 'package:letsparty/features/pages/home/main_view/main_view_page_content.dart';
import 'package:letsparty/features/pages/home/my_account/my_account_page_content.dart';
import 'package:letsparty/models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            body: Builder(builder: (context) {
              if (state.gNavItem == GNavItem.account) {
                return MyAccountPageContent();
              }
              if (state.gNavItem == GNavItem.home) {
                return const MainViewPageContent();
              }

              return const ChatPageContent();
            }),
            bottomNavigationBar: CurvedNavigationBar(
              color: const Color.fromARGB(255, 194, 188, 227),
              buttonBackgroundColor: const Color.fromARGB(255, 212, 208, 245),
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              height: 46,
              animationCurve: Curves.easeOutCubic,
              animationDuration: const Duration(milliseconds: 900),
              index: state.index,
              items: const [
                Icon(
                  Ionicons.person_outline,
                  size: 26,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 123, 24, 209),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0)
                  ],
                ),
                Icon(
                  Ionicons.home_outline,
                  size: 26,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 123, 24, 209),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0)
                  ],
                )
              ],
              onTap: (index) {
                if (index == 0) {
                  context.read<HomeCubit>().onTapPressed(GNavItem.account);
                } else if (index == 1) {
                  context.read<HomeCubit>().onTapPressed(GNavItem.home);
                  // } else if (index == 2) {
                  // context.read<HomeCubit>().onTapPressed(GNavItem.chat);
                }
              },
            ),

            // bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            //   iconSize: 22,
            //   selectedItemColor: Colors.grey.shade900,
            //   currentIndex: state.index,
            //   selectedLabelStyle: GoogleFonts.montserrat(),
            //   unselectedLabelStyle: GoogleFonts.montserrat(),
            //   onTap: (index) {
            //     if (index == 0) {
            //       context.read<HomeCubit>().onTapPressed(GNavItem.account);
            //     } else if (index == 1) {
            //       context.read<HomeCubit>().onTapPressed(GNavItem.home);
            //       // } else if (index == 2) {
            //       // context.read<HomeCubit>().onTapPressed(GNavItem.chat);
            //     }
            //   },
            //   items: const [
            //     BottomNavigationBarItem(
            //       icon: Icon(
            //         Ionicons.person_outline,
            //       ),
            //       label: 'Moje konto',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(
            //         Ionicons.home_outline,
            //       ),
            //       label: 'Strona główna',
            //     ),
            //     // BottomNavigationBarItem(
            //     // icon: Icon(
            //     // Ionicons.chatbox_outline,
            //     // ),
            //     // label: 'Czat',
            //     // ),
            //   ],
            // ),
            //Container(
            //   decoration: const BoxDecoration(
            //     color: Color.fromARGB(255, 212, 208, 245),
            //   ),
            //   child: SafeArea(
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            //       child: GNav(
            //         rippleColor: Colors.grey[300]!,
            //         hoverColor: Colors.grey[100]!,
            //         gap: 8,
            //         activeColor: Colors.black,
            //         iconSize: 24,
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20, vertical: 12),
            //         duration: const Duration(milliseconds: 400),
            //         tabBackgroundColor:
            //             const Color.fromARGB(248, 227, 221, 239),
            //         color: Colors.black,
            //         tabs: [
            //           GButton(
            //             icon: Icons.person_outline,
            //             text: 'Moje konto ',
            //             textStyle: TextStyle(fontSize: 16.0),
            //             onPressed: (index) {
            //               if (state.index == 0) {
            //                 context
            //                     .read<HomeCubit>()
            //                     .onTapPressed(GNavItem.account);
            //               }
            //             },
            //           ),
            //           GButton(
            //             onPressed: (index) {
            //               if (state.index == 1) {
            //                 context
            //                     .read<HomeCubit>()
            //                     .onTapPressed(GNavItem.home);
            //               }
            //             },
            //             icon: Icons.home_outlined,
            //             text: 'Strona główna',
            //             textStyle: TextStyle(fontSize: 16.0),
            //           ),
            //           GButton(
            //             onPressed: (index) {
            //               if (state.index == 2) {
            //                 context
            //                     .read<HomeCubit>()
            //                     .onTapPressed(GNavItem.chat);
            //               }
            //             },
            //             icon: Icons.message_outlined,
            //             text: 'Czat',
            //             textStyle: TextStyle(fontSize: 16.0),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
          );
        }));
  }
}
