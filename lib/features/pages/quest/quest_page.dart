import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
import 'package:letsparty/domain/repositories/repository.dart';

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
          'Q u e s t  l i s t',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      bottomSheet: const BottomSheet(),
      body: BlocProvider(
        create: (context) =>
            AccountCubit(Repository(RemoteDataSource()))..start(),
        child: Center(
          child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return const Text('Oops, we have a problem :(');
            }
            if (state.isLoading) {
              return const Text('Loading...');
            }
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
                        name: userModel.name,
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

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Enter your full name in the "My Account" tab to show up on the guest list.',
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class UserBox extends StatelessWidget {
  const UserBox({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

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
        name,
        style: GoogleFonts.montserrat(
          fontSize: 18,
        ),
      ),
    );
  }
}
