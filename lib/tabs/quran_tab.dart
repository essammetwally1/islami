import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_image.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/screens/quran_display_screen.dart';
import 'package:islami/services/quran_service.dart';

class QuranTab extends StatelessWidget {
  final List<SuraModel> suraModels = QuranService.suraModels;
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
        child: Column(
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
                hintStyle: textTheme.headlineSmall!.copyWith(
                  color: AppTheme.white,
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

            // Padding(
            //   padding: const EdgeInsets.only(left: 5, top: 25, bottom: 10),
            //   child: Align(
            //     alignment: Alignment.centerLeft,

            //     child: Text(
            //       'Most Recently',
            //       style: textTheme.headlineSmall!.copyWith(
            //         color: AppTheme.white,
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: 150,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return ListViewSuraItem();
            //     },
            //   ),
            // ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 25,
                      bottom: 10,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        'Suras List',
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuranDisplayScreen(sura: suraModels[index]),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  scale: .78,
                                  image: AssetImage(AppImage.frame),

                                  // fit: BoxFit.contain,
                                ),
                              ),

                              child: Text(
                                suraModels[index].number.toString(),

                                style: textTheme.headlineMedium!.copyWith(
                                  color: AppTheme.white,
                                ),
                              ),
                            ),

                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  suraModels[index].englishName,
                                  style: textTheme.headlineMedium!.copyWith(
                                    color: AppTheme.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${suraModels[index].ayaNumber} Verses',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: AppTheme.white,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              suraModels[index].arabicName,
                              style: textTheme.headlineMedium!.copyWith(
                                color: AppTheme.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      separatorBuilder: (_, _) =>
                          Divider(color: AppTheme.white, thickness: 1),
                      itemCount: suraModels.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
