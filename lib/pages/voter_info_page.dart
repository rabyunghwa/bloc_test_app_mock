import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_election_by_id_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_voter_info_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart' as framework;
import 'package:political_preparedness_flutter/widgets/voterinfo/follow_unfollow_election_display.dart';
import 'package:political_preparedness_flutter/widgets/voterinfo/voter_info_display.dart';

import '../injection_container.dart';

class VoterInfoPage extends StatelessWidget {
  static const routeName = '/extractArgumentsVoterInfoPage';

  @override
  Widget build(framework.BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
      ),
      // body: buildBody(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return sl<GetVoterInfoBloc>();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return sl<GetElectionByIdBloc>();
            },
          ),
        ],
        child: Container(
            child: Column(
          // equivalent to vertical LinearLayout
          children: [
            Expanded(child: VoterInfoDisplay()),
            FollowUnfollowElectionDisplay(),
          ],
        )),
      ),
    );
  }
}
