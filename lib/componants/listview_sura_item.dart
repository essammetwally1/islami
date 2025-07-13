import 'package:flutter/material.dart';
import 'package:islami/app_image.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/models/sura_model.dart';

class ListViewSuraItem extends StatelessWidget {
  final SuraModel suraModel;
  const ListViewSuraItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    suraModel.englishName,
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    suraModel.arabicName,
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${suraModel.ayaNumber} Verses  ',
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Image.asset(AppImage.sura, fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }
}
