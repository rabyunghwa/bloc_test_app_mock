import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_election_by_id_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/widgets/elections/election_screen_arguments.dart';

import '../message_display.dart';

class FollowUnfollowElectionDisplay extends StatefulWidget {
  @override
  _FollowUnfollowElectionDisplayState createState() =>
      _FollowUnfollowElectionDisplayState();
}

class _FollowUnfollowElectionDisplayState
    extends State<FollowUnfollowElectionDisplay> {
  GetElectionByIdBloc _getElectionByIdBloc;

  // Subclasses rarely override this method because the framework always calls build after a dependency changes. Some subclasses do override this method because they need to do some expensive work (e.g., network fetches) when their dependencies change, and that work would be too expensive to do for every build.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getElectionByIdBloc = BlocProvider.of<GetElectionByIdBloc>(context);
    dispatchConcrete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: BlocBuilder<GetElectionByIdBloc, GetElectionByIdState>(
        // ignore: missing_return
        builder: (_, state) {
          if (state is ElectionByIdLoaded) {
            if (state.retrievedElection.followed == FOLLOWED) {
              return SizedBox.expand(
                child: RaisedButton(
                  child: new Text("UNFOLLOW ELECTION"),
                  onPressed: () {
                    _getElectionByIdBloc.add(
                        UpdateElection(
                            election: Election(
                                id: state.retrievedElection.id,
                                name: state.retrievedElection.name,
                                electionDay:
                                    state.retrievedElection.electionDay,
                                divisionId: state.retrievedElection.divisionId,
                                followed: UNFOLLOWED)));
                  },
                ),
              );
            } else if (state.retrievedElection.followed == UNFOLLOWED) {
              return SizedBox.expand(
                child: RaisedButton(
                  child: new Text("FOLLOW ELECTION"),
                  onPressed: () {
                    _getElectionByIdBloc.add(
                        UpdateElection(
                            election: Election(
                                id: state.retrievedElection.id,
                                name: state.retrievedElection.name,
                                electionDay:
                                    state.retrievedElection.electionDay,
                                divisionId: state.retrievedElection.divisionId,
                                followed: FOLLOWED)));
                  },
                ),
              );
            }
          } else if (state is ElectionUpdated) {
            return MessageDisplay(
              message: "Election Updated",
            );
          } else if (state is EmptyRetrieval) {
            return MessageDisplay(
              message: "Empty Retrieval",
            );
          }
        },
      ),
    );
  }

  void dispatchConcrete() {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ElectionScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    _getElectionByIdBloc.add(GetElectionById(electionId: args.id));
  }

}
