import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
import 'package:letsparty/domain/models/user_model.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class MyAccountPageContent extends StatelessWidget {
  MyAccountPageContent({
    Key? key,
  }) : super(key: key);
  final controller = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
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
                  icon: const Icon(Icons.logout_outlined),
                  color: Colors.grey.shade900,
                )
              ],
            ),
            body: _MyAccountPageBody(
              userModel: UserModel(
                  name: controller.text,
                  photo: imageController.text,
                  id: state.user.toString()),
            ));
      }),
    );
  }
}

class _MyAccountPageBody extends StatefulWidget {
  _MyAccountPageBody({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel? userModel;

  @override
  State<_MyAccountPageBody> createState() => _MyAccountPageBodyState();
}

class _MyAccountPageBodyState extends State<_MyAccountPageBody> {
  late TextEditingController controller;

  late TextEditingController imageController;
  bool isButtonActive = true;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    imageController = TextEditingController();
    controller.addListener(
      () {
        final isButtonActive = controller.text.isNotEmpty;

        setState(() {
          this.isButtonActive = isButtonActive;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountCubit(UserRepository(UserRemoteDataSource()))..start(),
      child: Center(
        child: ListView(children: [
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
                            fontSize: 22,
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: controller,
                      decoration: textFieldDecoration(
                          text: 'Full name',
                          icon: const Icon(Ionicons.text_outline))),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: imageController,
                      decoration: textFieldDecoration(
                          text: 'Photo url http://...jpg',
                          icon: const Icon(Ionicons.camera_outline))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 42,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: elevatedButtonStyle(),
                          onPressed: isButtonActive
                              ? () {
                                  setState(() {
                                    isButtonActive = false;
                                  });
                                  context.read<AccountCubit>().add(
                                        name: controller.text,
                                        photo: imageController.text,
                                      );

                                  controller.clear();
                                  imageController.clear();
                                }
                              : null,
                          child: const Text('OK'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 42,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: elevatedButtonStyle(),
                          onPressed: () {
                            for (final userModel in userModels) {
                              context
                                  .read<AccountCubit>()
                                  .remove(documentID: userModel.id);
                            }
                          },
                          child: const Icon(Ionicons.trash_outline),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          })
        ]),
      ),
    );
  }
}
