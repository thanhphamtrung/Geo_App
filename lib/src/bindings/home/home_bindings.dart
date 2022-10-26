import 'package:get/instance_manager.dart';

import '../../controllers/home_controllers/map_app_controller.dart';
import '../../domains/adapters/map/map_repository.dart';
import '../../data/map/provider/i_map_provider.dart';
import '../../data/map/provider/map_provider.dart';
import '../../domains/adapters/map/map_repo_adapter.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMapProvider>(() => MapProvider());
    Get.lazyPut<IMapRepository>(() => MapRepository(provider: Get.find()));
    Get.lazyPut(() => MapAppController(repository: Get.find()));
  }
}
