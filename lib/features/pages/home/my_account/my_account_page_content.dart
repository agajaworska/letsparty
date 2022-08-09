import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';

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
                    return Column(
                      children: [
                        for (final document in documents) ...[
                          Container(
                            height: 240,
                            width: 240,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  document['photo'].toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
                                      style:
                                          GoogleFonts.montserrat(fontSize: 22),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Imię i nazwisko',
                              hintStyle: GoogleFonts.montserrat(),
                              prefixIcon: const Icon(
                                Icons.text_fields_outlined,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: imageController,
                            decoration: InputDecoration(
                              hintText: 'Url zdjęcia: http://...jpg',
                              hintStyle: GoogleFonts.montserrat(),
                              prefixIcon: const Icon(
                                Icons.add_a_photo_outlined,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 70,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: const Color.fromARGB(205, 107, 26, 213),
                              shadowColor: Colors.grey,
                              elevation: 6.0,
                              textStyle: GoogleFonts.montserrat(),
                            ),
                            onPressed: () {
                              context.read<AccountCubit>().add(
                                  name: controller.text,
                                  photo: imageController.text);

                              controller.clear();
                              imageController.clear();
                            },
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    );
                  })
                ]),
              ),
            ));
      }),
    );
  }
}
