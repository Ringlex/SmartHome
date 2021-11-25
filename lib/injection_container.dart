import 'package:get_it/get_it.dart';
import 'package:home_app/features/home/data/datasources/tools_remote_data_source.dart';
import 'package:home_app/features/home/data/repositories/tools_repository_impl.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';
import 'package:home_app/features/home/domain/usecases/get_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';

import 'features/home/presentation/provider/tab_manager.dart';

final sl = GetIt.instance; // sl - service locator

void init() {
  //Features - Tools

  sl.registerFactory(() => TabManager());
  sl.registerFactory(() => ToolsManager(getTools: sl()));
  //Data Layer
  sl.registerLazySingleton<ToolRepositories>(
    () => ToolsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ToolsRemoteDataSource>(
      () => ToolsRemoteDataSourceImpl());
  //Domain Layer
  sl.registerFactory(() => GetTools(sl()));
}
