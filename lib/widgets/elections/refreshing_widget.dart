import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/refresh_elections_bloc.dart';

import '../message_display.dart';

class RefreshingWidget extends StatefulWidget {
  @override
  _RefreshingWidgetState createState() => _RefreshingWidgetState();
}

class _RefreshingWidgetState extends State<RefreshingWidget> {
  // Subclasses rarely override this method because the framework always calls build after a dependency changes. Some subclasses do override this method because they need to do some expensive work (e.g., network fetches) when their dependencies change, and that work would be too expensive to do for every build.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dispatchConcrete();
  }

  // Builder is the place for rebuilding the UI and it has to be a "pure function". That is, it only returns a Widget and doesn't do anything else.
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<RefreshElectionsBloc, RefreshElectionsState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is Error) {
          return MessageDisplay(
            message: "",
          );
        } else if (state is Refreshed) {
          return MessageDisplay(
            message: "",
          );
        } else if (state is Refreshing) {
          return MessageDisplay(
            message: "",
          );
        }
      },
    ));
  }

  void dispatchConcrete() {
    BlocProvider.of<RefreshElectionsBloc>(context)
        .add(RefreshNetworkElectionList());
  }
}
