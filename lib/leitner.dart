import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth.dart';

class Leitner extends StatelessWidget {
  @override
  const Leitner({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background,
        shadowColor: const Color(0xff35353d).withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context)!.leitner,
          style: themeData.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                          child: Column(children: [
                            TextField(
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios),
                                    ),
                                    label: Text(
                                      AppLocalizations.of(context)!
                                          .learningWords,
                                      style: themeData.textTheme.labelLarge,
                                    )),
                                style: themeData.textTheme.titleLarge!
                                    .apply(fontSizeFactor: 0.8)),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                          child: Column(children: [
                            TextField(
                                decoration: InputDecoration(
                                    label: Text(
                                      AppLocalizations.of(context)!
                                          .learnedWords,
                                      style: themeData.textTheme.labelLarge,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios),
                                    )),
                                style: themeData.textTheme.titleLarge!
                                    .apply(fontSizeFactor: 0.8)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppLocalizations.of(context)!.todaysCards,style: themeData.textTheme.labelLarge,)],
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  minimumSize: MaterialStateProperty.all(
                      Size(240, 60))),
              child: Text(AppLocalizations.of(context)!.start,
                  style: TextStyle(color: themeData.colorScheme.onPrimary))),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}
