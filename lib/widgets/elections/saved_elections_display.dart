import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/get_saved_elections_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';

import 'package:political_preparedness_flutter/pages/voter_info_page.dart';

import '../message_display.dart';
import 'election_screen_arguments.dart';

class SavedElectionsDisplay extends StatefulWidget {
  @override
  _SavedElectionsDisplayState createState() => _SavedElectionsDisplayState();
}

class _SavedElectionsDisplayState extends State<SavedElectionsDisplay> {
  // Subclasses rarely override this method because the framework always calls build after a dependency changes. Some subclasses do override this method because they need to do some expensive work (e.g., network fetches) when their dependencies change, and that work would be too expensive to do for every build.
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
      child: BlocBuilder<GetSavedElectionsBloc, GetSavedElectionsState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is AllSavedElectionsLoaded) {
            return ListView.separated(
              key: Key(KEY_SAVED_ELECTIONS),
              itemCount: state.savedElections.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          state.savedElections[index].name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(state.savedElections[index].electionDay),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        VoterInfoPage.routeName,
                        arguments: ElectionScreenArguments(
                            id: int.parse(state.savedElections[index].id),
                            name: state.savedElections[index].name,
                            divisionId: state.savedElections[index].divisionId),
                      );
                    });
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else if (state is EmptySaved) {
            return MessageDisplay(
              message: NO_SAVED_ELECTIONS_MESSAGE,
            );
          }
        },
      ),
    );
  }

  void dispatchConcrete() {
    BlocProvider.of<GetSavedElectionsBloc>(context).add(GetAllSavedElections());
  }
}
