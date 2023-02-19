import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/group_remote_data_source.dart';
import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/domain/models/group_model.dart';
import 'package:letsparty/domain/models/user_model.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/group%20page/cubit/group_cubit.dart';
import 'package:letsparty/features/pages/home/my_account/cubit/account_cubit.dart';
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
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          return BlocProvider(
              create: (context) =>
                  GroupCubit(GroupRepository(GroupRemoteDataSource()))..start(),
              child: BlocBuilder<GroupCubit, GroupState>(
                builder: (context, state) {
                  final groupModels = state.documents;

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
                    // bottomSheet: const BottomSheet(),
                    body: Center(
                      child: ListView(children: [
                        for (final groupModel in groupModels) ...[
                          for (int i = 0; i < groupModel.userName.length; i++)
                            if (groupModel.members.contains(user!.uid))
                              DisplayBox(
                                  name: groupModel.userName[i].toString())
                        ]
                      ]),
                    ),
                  );
                },
              ));
        },
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
