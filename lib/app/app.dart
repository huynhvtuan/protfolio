import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protfolio/core/config/resources/routes_manager.dart';
import 'package:protfolio/core/config/resources/theme_manager.dart';
import 'package:protfolio/core/providers/drawer_provider.dart';
import 'package:protfolio/core/providers/scroll_provider.dart';
import 'package:protfolio/core/theme/cubit/theme_cubit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _routesManager = RoutesManager();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: _routesManager.config(),
              localizationsDelegates: context.localizationDelegates,
              theme: AppTheme.themeData(state.isDarkThemeOn, context),
              themeMode: ThemeMode.light,
            );
          });
        }),
      ),
    );
  }
}
