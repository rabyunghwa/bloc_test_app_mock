import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/get_followed_elections_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/get_saved_elections_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/refresh_elections_bloc.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/widgets/elections/followed_elections_display.dart';
import 'package:political_preparedness_flutter/widgets/elections/saved_elections_display.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart' as framework;

import '../injection_container.dart';

class ElectionsPage extends StatelessWidget {
  static const routeName = '/ElectionsPage';

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
            create: (BuildContext context) => sl<GetFollowedElectionsBloc>()
          ),
          BlocProvider(
            create: (BuildContext context) => sl<GetSavedElectionsBloc>()
          ),
          BlocProvider(
            create: (BuildContext context) => sl<RefreshElectionsBloc>()
          ),
        ],
        child: Container(
          child: new Stack(
            // equivalent to FrameLayout
            children: [
              Column(
                // equivalent to vertical LinearLayout
                children: [
                  new Flexible(
                    // equivalent to android:layout_weight
                    child: new SavedElectionsDisplay(),
                    flex: 1,
                  ),
                  new Flexible(
                    // equivalent to android:layout_weight
                    child: new FollowedElectionsDisplay(),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
