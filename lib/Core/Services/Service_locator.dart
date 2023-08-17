import 'package:bmi_calc/Core/database/cacheHelper.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setUp() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
