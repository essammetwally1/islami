import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';

class NavbarIcon extends StatelessWidget {
  final String image;
  const NavbarIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: 28,
      height: 28,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(AppTheme.black, BlendMode.srcIn),
    );
  }
}
