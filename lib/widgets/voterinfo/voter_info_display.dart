import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_voter_info_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/widgets/elections/election_screen_arguments.dart';

import '../message_display.dart';

class VoterInfoDisplay extends StatefulWidget {
  @override
  _VoterInfoDisplayState createState() => _VoterInfoDisplayState();
}

class _VoterInfoDisplayState extends State<VoterInfoDisplay> {
  // Subclasses rarely override this method because the framework always calls build after a dependency changes. Some subclasses do override this method because they need to do some expensive work (e.g., network fetches) when their dependencies change, and that work would be too expensive to do for every build.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dispatchConcrete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer(
            cubit: BlocProvider.of<GetVoterInfoBloc>(context),
            listener: (context, state) {
              if (state is Error) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              } else if (state is Refreshed) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(REFRESHED_MESSAGE),
                  ),
                );
              }
            },
            // ignore: missing_return
            builder: (context, state) {
              if (state is Refreshing) {
                return Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: CircularProgressIndicator(
                        key: Key(KEY_CIRCULAR_INDICATOR),
                      ),
                    ));
              } else if (state is Refreshed) {
                return Column(
                  children: <Widget>[
                    Text(
                      state.voterInfo.election.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(state.voterInfo.election.electionDay),
                  ],
                );
              } else if (state is Error) {
                return MessageDisplay(
                  message: "",
                );
              }
            }));
  }

  void dispatchConcrete() {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ElectionScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    BlocProvider.of<GetVoterInfoBloc>(context)
        .add(RefreshVoterInfo(addressString: args.name, electionId: args.id));
  }
}
