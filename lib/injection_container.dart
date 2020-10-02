import 'package:political_preparedness_flutter/bloc/elections/get_followed_elections_bloc.dart';
import 'package:political_preparedness_flutter/bloc/elections/refresh_elections_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_election_by_id_bloc.dart';
import 'package:political_preparedness_flutter/bloc/voterinfo/get_voter_info_bloc.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository_impl.dart';
import 'package:political_preparedness_flutter/usecases/voterinfo/refresh_voter_info_async.dart';

import 'bloc/elections/get_saved_elections_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:political_preparedness_flutter/datasources/local/local_datasource.dart';
import 'package:political_preparedness_flutter/datasources/local/local_datasource_impl.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource_impl.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository_impl.dart';
import 'package:political_preparedness_flutter/usecases/elections/delete_election.dart';
import 'package:political_preparedness_flutter/usecases/elections/get_entire_followed_election_list.dart';
import 'package:political_preparedness_flutter/usecases/elections/get_entire_saved_election_list.dart';
import 'package:political_preparedness_flutter/usecases/elections/refresh_network_election_list_async.dart';
import 'package:political_preparedness_flutter/usecases/voterinfo/get_election_by_id.dart'
    as get_election_by_id_usecase;
import 'package:political_preparedness_flutter/usecases/voterinfo/update_election.dart'
    as update_election_usecase;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  // elections
  sl.registerFactory<GetFollowedElectionsBloc>(
    () => GetFollowedElectionsBloc(followed: sl()),
  );
  sl.registerFactory<GetSavedElectionsBloc>(
    () => GetSavedElectionsBloc(saved: sl()),
  );
  sl.registerFactory<RefreshElectionsBloc>(
    () => RefreshElectionsBloc(refresh: sl()),
  );
  // voter info
  sl.registerFactory<GetVoterInfoBloc>(
    () => GetVoterInfoBloc(voterInfo: sl()),
  );
  sl.registerFactory<GetElectionByIdBloc>(
    () => GetElectionByIdBloc(electionById: sl(), update: sl()),
  );

  // Use cases
  // elections
  sl.registerLazySingleton<GetEntireSavedElectionList>(
      () => GetEntireSavedElectionList(sl()));
  sl.registerLazySingleton<GetEntireFollowedElectionList>(
      () => GetEntireFollowedElectionList(sl()));
  sl.registerLazySingleton<RefreshNetworkElectionListAsync>(
      () => RefreshNetworkElectionListAsync(sl()));
  sl.registerLazySingleton<DeleteElection>(() => DeleteElection(sl()));
  // voter info
  sl.registerLazySingleton<get_election_by_id_usecase.GetElectionById>(
      () => get_election_by_id_usecase.GetElectionById(sl()));
  sl.registerLazySingleton<RefreshVoterInfoAsync>(
      () => RefreshVoterInfoAsync(sl()));
  sl.registerLazySingleton<update_election_usecase.UpdateElection>(
      () => update_election_usecase.UpdateElection(sl()));

  // Repository
  // elections
  sl.registerLazySingleton<ElectionsRepository>(
    () => ElectionsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  // voter info
  sl.registerLazySingleton<VoterInfoRepository>(() => VoterInfoRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

}
