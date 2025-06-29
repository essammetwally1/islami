import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';

class NavbarActiveIcon extends StatelessWidget {
  final String image;

  const NavbarActiveIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        image,
        width: 23,
        height: 25,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
