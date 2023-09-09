import 'package:english_medifors/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  final Function(bool) toggleTheme;
  final Function(bool) toggleLanguage;

  const Settings({super.key, required this.toggleTheme, required this.toggleLanguage});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool light = true;
  bool lan = true;
  bool notif = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background,
        shadowColor: const Color(0xff35353d).withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context)!.settingsTitle,
          style: themeData.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  widget.toggleTheme(!light);
                                  setState(() {
                                    light = !light;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.theme,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    light
                                        ? Icon(
                                            Icons.sunny,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          )
                                        : Icon(
                                            Icons.nights_stay,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          )
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {
                                  widget.toggleLanguage(!lan);
                                  setState(() {
                                    lan = !lan;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.language,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    lan
                                        ? Text('Fa',
                                            style: TextStyle(
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                            ))
                                        : Text('En',
                                            style: TextStyle(
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                            ))
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    notif = !notif;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.notifications,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    notif
                                        ? Icon(
                                            Icons.notifications,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          )
                                        : Icon(
                                            Icons.notifications_off,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.storage,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.storage,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.downloads,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.download,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.update,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.update,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.profile,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.person,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.changePassword,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.password,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!.logOut,
                                      style: themeData.textTheme.titleMedium,
                                    )),
                                    Icon(
                                      Icons.exit_to_app,
                                      color: themeData.colorScheme.onPrimary,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
