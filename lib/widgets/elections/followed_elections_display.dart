import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/get_followed_elections_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';

import 'package:political_preparedness_flutter/pages/voter_info_page.dart';
import 'package:political_preparedness_flutter/widgets/elections/election_screen_arguments.dart';

import '../message_display.dart';

class FollowedElectionsDisplay extends StatefulWidget {
  static const routeName = '/extractArguments';

  @override
  _FollowedElectionsDisplayState createState() =>
      _FollowedElectionsDisplayState();
}

class _FollowedElectionsDisplayState extends State<FollowedElectionsDisplay> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dispatchConcrete();
  }

  @override
  Widget build(BuildContext context) {
    // app bar + status bar + bottom app bar
    double height = Scaffold.of(context).appBarMaxHeight;
    return Container(
      height: (MediaQuery.of(context).size.height - height) / 2,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<GetFollowedElectionsBloc, GetFollowedElectionsState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is AllFollowedElectionsLoaded) {
            return ListView.separated(
              key: Key(KEY_FOLLOWED_ELECTIONS),
              itemCount: state.followedElections.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          state.followedElections[index].name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(state.followedElections[index].electionDay),
                      ],
                    ),
                    onTap: () => Navigator.pushNamed(
                          context,
                          VoterInfoPage.routeName,
                          arguments: ElectionScreenArguments(
                              id: int.parse(state.followedElections[index].id),
                              name: state.followedElections[index].name,
                              divisionId:
                                  state.followedElections[index].divisionId),
                        ));
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else if (state is EmptyFollowed) {
            return MessageDisplay(
              message: NO_FOLLOWED_ELECTIONS_MESSAGE,
            );
          }
        },
      ),
    );
  }

  void dispatchConcrete() {
    BlocProvider.of<GetFollowedElectionsBloc>(context)
        .add(GetAllFollowedElections());
  }
}
