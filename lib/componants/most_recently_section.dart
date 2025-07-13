import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/componants/listview_sura_item.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/screens/quran_display_screen.dart';
import 'package:islami/services/quran_service.dart';

class MostRecentlySection extends StatelessWidget {
  final List<SuraModel> suraModels = QuranService.mostRecentlyList;
  MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Visibility(
      visible: QuranService.mostRecentlyList.isNotEmpty,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,

              child: Text(
                'Most Recently',
                style: textTheme.headlineSmall!.copyWith(color: AppTheme.white),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * .14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suraModels.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return QuranDisplayScreen(sura: suraModels[index]);
                        },
                      ),
                    );
                  },

                  child: ListViewSuraItem(suraModel: suraModels[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
