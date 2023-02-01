import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class MyAccountPageContent extends StatefulWidget {
  MyAccountPageContent({
    Key? key,
  }) : super(key: key);
  final controller = TextEditingController();

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  String? name;
  String? photo;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              AccountCubit(UserRepository(UserRemoteDataSource()))..start(),
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              final userModels = state.documents;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 144, 222, 212),
                  title: Text(
                    'M Y  A C C O U N T',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<RootCubit>().signOut();
                      },
                      icon: const Icon(
                        Icons.logout_outlined,
                        size: 32,
                        color: Colors.black87,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 249, 193, 195),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 1.0)
                        ],
                      ),
                      color: Colors.grey.shade900,
                    )
                  ],
                ),
                body: _MyAccountPageBody(
                  onNameChanged: (newValue) {
                    setState(() {
                      name = newValue;
                    });
                    controller.clear();
                  },
                  onPhotoChanged: (newValue) {
                    setState(() {
                      photo = newValue;
                    });
                    controller.clear();
                  },
                  addButton: ElevatedButton(
                    onPressed: name == null || photo == null
                        ? null
                        : () {
                            context.read<AccountCubit>().add(
                                  name: name!,
                                  photo: photo!,
                                );
                          },
                    style: elevatedButtonStyle(),
                    child: const Icon(Ionicons.add),
                  ),
                  removeButton: ElevatedButton(
                    onPressed: () {
                      for (final userModel in userModels) {
                        context.read<AccountCubit>().remove(
                              documentID: userModel.id,
                            );
                      }
                    },
                    style: elevatedButtonStyle(),
                    child: const Icon(Ionicons.trash_bin_outline),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class _MyAccountPageBody extends StatelessWidget {
  const _MyAccountPageBody({
    Key? key,
    required this.addButton,
    required this.removeButton,
    required this.onNameChanged,
    required this.onPhotoChanged,
  }) : super(key: key);

  final Function(String) onNameChanged;
  final Function(String) onPhotoChanged;
  final ElevatedButton addButton;
  final ElevatedButton removeButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AccountCubit(UserRepository(UserRemoteDataSource()))..start(),
        child: Center(
            child: ListView(
          children: [
            const SizedBox(height: 20),
            BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return const Center(child: Text('Oops, we have a problem'));
              }
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
              }

              final userModels = state.documents;
              return Column(
                children: [
                  for (final userModel in userModels) ...[
                    Container(
                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            userModel.photo,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Center(
                              child: Text(
                            userModel.name,
                            style: GoogleFonts.montserrat(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        textInputAction: TextInputAction.next,
                        style: GoogleFonts.montserrat(),
                        onChanged: onNameChanged,
                        decoration: textFieldDecoration(
                            text: 'Full name',
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
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        onChanged: onPhotoChanged,
                        style: GoogleFonts.montserrat(),
                        decoration: textFieldDecoration(
                            text: 'Photo url http://...jpg',
                            icon: const Icon(
                              Ionicons.camera_outline,
                              size: 32,
                              color: Colors.black87,
                              shadows: [
                                Shadow(
                                    color: Color.fromARGB(255, 249, 193, 195),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 1.0)
                              ],
                            ))),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 44,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: addButton,
                      ),
                    ),
                    SizedBox(
                      height: 44,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: removeButton,
                      ),
                    ),
                  ]),
                ],
              );
            })
          ],
        )));
  }
}
