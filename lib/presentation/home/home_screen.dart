import 'package:flutter/material.dart';
import 'package:protfolio/core/res/responsive.dart';
import 'package:protfolio/presentation/home/widgets/home_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeMobile(),
      desktop: HomeMobile(),
    );
  }
}
