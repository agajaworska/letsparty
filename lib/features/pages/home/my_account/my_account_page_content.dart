import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';

class MyAccountPageContent extends StatefulWidget {
  MyAccountPageContent({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              title: Text(
                'M o j e  k o n t o',
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
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add_a_photo_outlined,
              ),
              backgroundColor: const Color.fromARGB(205, 107, 26, 213),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'jpeg', 'webp']);

                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nie wybrano zdjęcia'),
                    ),
                  );
                }
                // FirebaseFirestore.instance
                //     .collection('image')
                //     .add({'image_url': result!.files.single.path.toString()});
              },
            ),
            body: BlocProvider(
              create: (context) => AccountCubit()..start(),
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 20),
                  BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                    if (state.errorMessage.isNotEmpty) {
                      return const Text('Wystąpił nieoczekiwany problem');
                    }
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                        ),
                      );
                    }

                    final documents = state.documents;
                    return Expanded(
                      child: Column(
                        children: [
                          for (final document in documents) ...[
                            Dismissible(
                              key: ValueKey(document.id),
                              onDismissed: (_) {
                                context
                                    .read<AccountCubit>()
                                    .remove(documentID: document.id);
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Center(
                                          child: Text(
                                        document['name'],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 24),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextField(
                              controller: widget.controller,
                              decoration: InputDecoration(
                                hintText: 'Imię i nazwisko',
                                hintStyle: GoogleFonts.montserrat(),
                                prefixIcon: const Icon(
                                  Icons.text_fields_outlined,
                                  color: Color.fromARGB(183, 119, 77, 175),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<AccountCubit>()
                                        .add(name: widget.controller.text);
                                    widget.controller.clear();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color.fromARGB(205, 107, 26, 213),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    );
                  })
                ]),
              ),
            ));
      }),
    );
  }
}
