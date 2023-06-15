// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:protfolio/presentation/main/main_section.dart' as _i1;

abstract class $RoutesManager extends _i2.RootStackRouter {
  $RoutesManager({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainSectionRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainSection(),
      );
    }
  };
}

/// generated route for
/// [_i1.MainSection]
class MainSectionRoute extends _i2.PageRouteInfo<void> {
  const MainSectionRoute({List<_i2.PageRouteInfo>? children})
      : super(
          MainSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainSectionRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
