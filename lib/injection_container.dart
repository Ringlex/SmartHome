import 'package:get_it/get_it.dart';
import 'package:home_app/features/home/data/repositories/tools_repository_impl.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

import 'features/home/presentation/provider/tab_manager.dart';

final sl = GetIt.instance; // sl - service locator

void init() {
  //Features - Tools

  sl.registerFactory(() => TabManager());

  sl.registerLazySingleton<ToolRepositories>(
    () => ToolsRepositoryImpl(sl()),
  );
}
