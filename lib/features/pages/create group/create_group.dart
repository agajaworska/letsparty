import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/group_remote_data_source.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';
import 'package:letsparty/features/pages/create%20group/cubit/create_group_cubit.dart';
import 'package:letsparty/features/pages/home/home_page.dart';
import 'package:letsparty/widgets/widgets.dart';

class CreateGroup extends StatelessWidget {
  CreateGroup({Key? key}) : super(key: key);

  final createGroupController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateGroupCubit(GroupRepository(GroupRemoteDataSource())),
      child: BlocBuilder<CreateGroupCubit, CreateGroupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Create the group',
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
                        text: 'Enter a group name',
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
                      controller: createGroupController,
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
                          .read<CreateGroupCubit>()
                          .createGroup(
                            groupName: createGroupController.text,
                            userName: userNameController.text,
                          )
                          .then((value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage())));
                    },
                    style: elevatedButtonStyle(),
                    child: const Text(
                      'Create',
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
