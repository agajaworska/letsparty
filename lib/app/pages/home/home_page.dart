import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:letsparty/app/enums/enums.dart';
import 'package:letsparty/app/pages/home/chat/chat_page_content.dart';
import 'package:letsparty/app/pages/home/cubit/home_cubit.dart';
import 'package:letsparty/app/pages/home/main_view/main_view_page_content.dart';
import 'package:letsparty/app/pages/home/my_account/my_account_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
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
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 208, 245),
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor:
                        const Color.fromARGB(248, 227, 221, 239),
                    color: Colors.black,
                    tabs: [
                      GButton(
                        icon: Icons.person_outline,
                        text: 'Moje konto ',
                        textStyle: TextStyle(fontSize: 16.0),
                        onPressed: (index) {
                          if (index == 0) {
                            context
                                .read<HomeCubit>()
                                .onTapPressed(GNavItem.account);
                          }
                        },
                      ),
                      GButton(
                        onPressed: (index) {
                          if (index == 1) {
                            context
                                .read<HomeCubit>()
                                .onTapPressed(GNavItem.home);
                          }
                        },
                        icon: Icons.home_outlined,
                        text: 'Strona główna',
                        textStyle: TextStyle(fontSize: 16.0),
                      ),
                      GButton(
                        onPressed: (index) {
                          if (index == 2) {
                            context
                                .read<HomeCubit>()
                                .onTapPressed(GNavItem.chat);
                          }
                        },
                        icon: Icons.message_outlined,
                        text: 'Czat',
                        textStyle: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
