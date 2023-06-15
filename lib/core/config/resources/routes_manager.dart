import 'package:auto_route/auto_route.dart';
import 'package:protfolio/core/config/resources/routes_manager.gr.dart';
import 'package:protfolio/presentation/main/main_section.dart';

class RouteName {
  static const String splash = '/';
  static const String login = '/login';
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class RoutesManager extends $RoutesManager {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(path: RouteName.splash, page: MainSectionRoute.page)];
}
