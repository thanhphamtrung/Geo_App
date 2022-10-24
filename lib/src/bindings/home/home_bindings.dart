import 'package:get/instance_manager.dart';

import '../../controllers/home_controllers/home_controllers.dart';
import '../../data/map/map_repository.dart';
import '../../data/map/provider/i_map_provider.dart';
import '../../data/map/provider/map_provider.dart';
import '../../domains/adapters/map_repo_adapter.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMapProvider>(() => MapProvider());
    Get.lazyPut<IMapRepository>(() => MapRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
