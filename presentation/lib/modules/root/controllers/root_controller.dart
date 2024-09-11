import 'package:domain/modules/current_user_session/entities/index.dart';
import 'package:domain/modules/current_user_session/usecases/get_current_user_session_use_case.dart';
import 'package:domain/modules/websocket/usecases/close_websocket_usecase.dart';
import 'package:get/get.dart';
import 'package:domain/modules/current_user_session/usecases/remove_current_user_session_use_case.dart';
import 'package:domain/di/domain_injection_container.dart' as domain_injection;
import '../../../routes/app_pages.dart';

class RootController extends GetxController {
  final GetCurrentUserSessionUseCase getCurrentUserUseCase;
  final RemoveCurrentUserSessionUseCase removeCurrentUserSessionUseCase;

  RootController(this.getCurrentUserUseCase, {required this.removeCurrentUserSessionUseCase});

  Rxn<CurrentUserEntity> currentUserEntity = Rxn();

  Future<void> getCurrentSession() async {
    var response = await getCurrentUserUseCase.call();
    response.fold((l) {}, (r) => currentUserEntity.value = r);
  }

  Future<void> logout() async {
    domain_injection.sl<CloseWebSocketUseCase>().call();
    await removeCurrentUserSessionUseCase.call();
    Get.offAllNamed(Routes.LOGIN);
  }
}
