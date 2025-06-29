import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_image.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/componants/listview_sura_item.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,

          image: AssetImage(AppImage.backgroundImage),
        ),
      ),

      child: SafeArea(
        left: false,
        right: false,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Image.asset(AppImage.islamiLogo, fit: BoxFit.fill),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: AppTheme.white,
              style: TextStyle(color: AppTheme.white),

              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.black.withValues(alpha: .7),

                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImage.navbarQuran,
                    colorFilter: ColorFilter.mode(
                      AppTheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                hintText: 'Sura Name',
                hintStyle: TextStyle(
                  color: AppTheme.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppTheme.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 25, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  'Most Recently',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListViewSuraItem();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 25, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  'Suras List',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
