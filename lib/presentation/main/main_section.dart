import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protfolio/core/apis/links.dart';
import 'package:protfolio/core/config/app_config.dart';
import 'package:protfolio/core/config/others/space.dart';
import 'package:protfolio/core/config/resources/assets.gen.dart';
import 'package:protfolio/core/config/resources/color_manager.dart';
import 'package:protfolio/core/config/resources/theme_manager.dart';
import 'package:protfolio/core/providers/drawer_provider.dart';
import 'package:protfolio/core/providers/scroll_provider.dart';
import 'package:protfolio/core/res/responsive.dart';
import 'package:protfolio/core/theme/cubit/theme_cubit.dart';
import 'package:protfolio/presentation/utils/navbar_utils.dart';
import 'package:protfolio/presentation/utils/utils.dart';
import 'package:protfolio/presentation/widgets/arrow_on_top.dart';
import 'package:protfolio/presentation/widgets/color_chage_btn.dart';
import 'package:protfolio/presentation/widgets/navbar_actions_button.dart';
import 'package:protfolio/presentation/widgets/navbar_logo.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';
part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_body.dart';

@RoutePage()
class MainSection extends StatelessWidget {
  const MainSection({super.key});
  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: _NavbarDesktop(),
          mobile: _NavBarTablet(),
          tablet: _NavBarTablet(),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: height * 0.2,
                left: -88,
                child: Container(
                  height: height / 3,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.secondaryColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -100,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 500,
                      sigmaY: 500,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              if (!state.isDarkThemeOn)
                Align(
                  alignment: Alignment.center,
                  // BG01.png
                  child: Image.asset(
                    Assets.images.a5.path,
                    opacity: const AlwaysStoppedAnimation<double>(0.2),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              _Body(),
              const ArrowOnTop()
            ],
          );
        },
      ),
    );
  }
}
