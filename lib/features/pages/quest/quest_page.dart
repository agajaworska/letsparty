import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

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
      backgroundColor: const Color.fromARGB(255, 144, 222, 212),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 222, 212),
        title: Text(
          'G u e s t  l i s t',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      bottomSheet: const BottomSheet(),
      body: BlocProvider(
        create: (context) =>
            AccountCubit(UserRepository(UserRemoteDataSource()))..start(),
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
                      child: DisplayBox(
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
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Enter your full name in the "My Account" tab to show up on the guest list.',
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
