import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';

import 'package:letsparty/repositories/repository.dart';

class QuestPage extends StatefulWidget {
  const QuestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'L i s t a  g o ś c i',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      bottomSheet: const _bottomSheet(),
      body: BlocProvider(
        create: (context) => AccountCubit(Repository())..start(),
        child: Center(
          child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
            final userModels = state.documents;
            return ListView(
              children: [
                for (final userModel in userModels) ...[
                  Dismissible(
                      key: ValueKey(userModel.id),
                      onDismissed: (_) {
                        context
                            .read<AccountCubit>()
                            .remove(documentID: userModel.id);
                      },
                      child: UserBox(
                        userModel.name,
                      )),
                ],
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  const _bottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Wpisz swoje imię i nazwisko w zakładce Moje konto, aby znaleźć się na liście gości.',
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class UserBox extends StatelessWidget {
  const UserBox(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 234, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 6.0,
            color: Colors.grey.shade600,
          ),
          const BoxShadow(
            offset: Offset(-5, -5),
            blurRadius: 6.0,
            color: Color.fromARGB(255, 232, 222, 240),
          ),
        ],
      ),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
        ),
      ),
    );
  }
}
