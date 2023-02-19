import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/group_remote_data_source.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';
import 'package:letsparty/features/pages/home/home_page.dart';
import 'package:letsparty/features/pages/join%20group/cubit/join_group_cubit.dart';
import 'package:letsparty/features/pages/join%20group/cubit/join_group_state.dart';
import 'package:letsparty/widgets/widgets.dart';

class JoinGroup extends StatelessWidget {
  JoinGroup({Key? key}) : super(key: key);

  final joinGroupController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          JoinGroupCubit(GroupRepository(GroupRemoteDataSource())),
      child: BlocBuilder<JoinGroupCubit, JoinGroupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Join the group',
                style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                    letterSpacing: 8.0),
              ),
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            ),
            backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: textFieldDecoration(
                        text: 'Name of the existing group',
                        icon: const Icon(
                          Ionicons.people_outline,
                          size: 32,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Color.fromARGB(255, 249, 193, 195),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0)
                          ],
                        ),
                      ),
                      controller: joinGroupController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: textFieldDecoration(
                        text: 'Your name',
                        icon: const Icon(
                          Ionicons.text_outline,
                          size: 32,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Color.fromARGB(255, 249, 193, 195),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0)
                          ],
                        ),
                      ),
                      controller: userNameController,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<JoinGroupCubit>()
                          .joinGroup(
                            groupId: joinGroupController.text,
                            userName: userNameController.text,
                          )
                          .then((value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage())));
                      joinGroupController.clear();
                    },
                    style: elevatedButtonStyle(),
                    child: const Text(
                      'Join',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
