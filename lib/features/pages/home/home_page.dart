import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/features/pages/home/chat/chat_page_content.dart';
import 'package:letsparty/features/pages/home/cubit/home_cubit.dart';
import 'package:letsparty/features/pages/home/main_view/main_view_page_content.dart';
import 'package:letsparty/features/pages/home/my_account/my_account_page_content.dart';

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
            body: Builder(builder: (context) {
              if (state.gNavItem == GNavItem.account) {
                return MyAccountPageContent();
              }
              if (state.gNavItem == GNavItem.home) {
                return const MainViewPageContent();
              }

              return ChatPageContent();
            }),
            bottomNavigationBar: CurvedNavigationBar(
              color: const Color.fromARGB(255, 245, 232, 206),
              buttonBackgroundColor: const Color.fromARGB(255, 144, 222, 212),
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
              height: 46,
              animationCurve: Curves.easeOutCubic,
              animationDuration: const Duration(milliseconds: 900),
              index: state.index,
              items: const [
                Icon(
                  Ionicons.person_outline,
                  size: 32,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 249, 108, 113),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0)
                  ],
                ),
                Icon(
                  Ionicons.home_outline,
                  size: 32,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 249, 108, 113),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0)
                  ],
                ),
                Icon(
                  Ionicons.chatbox_outline,
                  size: 32,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 249, 108, 113),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0)
                  ],
                )
              ],
              onTap: (index) {
                if (index == 0) {
                  context.read<HomeCubit>().onTapPressed(GNavItem.account);
                } else if (index == 1) {
                  context.read<HomeCubit>().onTapPressed(GNavItem.home);
                } else if (index == 2) {
                  context.read<HomeCubit>().onTapPressed(GNavItem.chat);
                }
              },
            ),
          );
        }));
  }
}
