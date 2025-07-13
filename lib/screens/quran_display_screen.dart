import 'package:flutter/material.dart';
import 'package:islami/app_image.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/services/quran_service.dart';

class QuranDisplayScreen extends StatefulWidget {
  final SuraModel sura;

  QuranDisplayScreen({super.key, required this.sura});

  @override
  State<QuranDisplayScreen> createState() => _QuranDisplayScreenState();
}

class _QuranDisplayScreenState extends State<QuranDisplayScreen> {
  List<String> ayatList = [];
  @override
  void initState() {
    super.initState();
    loadSura();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          widget.sura.englishName,
          style: textTheme.headlineMedium!.copyWith(color: AppTheme.primary),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImage.cornerLeft),
                Text(
                  widget.sura.arabicName,
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                Image.asset(AppImage.cornerRight),
              ],
            ),
          ),
          ayatList.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemBuilder: (_, index) => Text(
                        ayatList[index],
                        style: textTheme.headlineMedium!.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      separatorBuilder: (_, _) => SizedBox(height: 10),
                      itemCount: ayatList.length,
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(color: AppTheme.primary),
                    ),
                  ),
                ),
          Image.asset(
            AppImage.mosque,
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height * .1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Future<void> loadSura() async {
    String suraText = await QuranService.loadSuraFile(widget.sura.number);
    ayatList = suraText.split('\n\r');
    setState(() {});
  }
}
