import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        flexibleSpace: FlexibleSpaceBar(
          background: SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      Theme.of(context).colorScheme.background),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.search_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 32,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(40, 0, 40, 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(
                                        AppLocalizations.of(context)!
                                            .search,
                                        style: themeData.textTheme.labelLarge,
                                      ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              color: const Color(0xff7a7a7a))),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.data_saver_off_rounded,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView.builder(
              itemCount: 30,
              itemExtent: 120,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                index = index + 1;
                return _listItems(
                  index: index,
                );
              }),
        ),
      ),
    );
  }
}

int selected = 0;

class bottomnavigationBar extends StatelessWidget {
  const bottomnavigationBar({
    super.key,
    required this.select,
  });

  final indexCallback select;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selected,
      showSelectedLabels: false,
      unselectedIconTheme: const IconThemeData(size: 24),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      fixedColor: Theme.of(context).colorScheme.onPrimary,
      onTap: (index) {
        select(index);
        selected = index;
      },
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            activeIcon: const Icon(Icons.home_filled)),
        BottomNavigationBarItem(
            label: 'Litner',
            icon: Icon(
              Icons.add_box_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            activeIcon: const Icon(Icons.add_box)),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            activeIcon: const Icon(Icons.person)),
        BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            activeIcon: const Icon(Icons.settings))
      ],
    );
  }
}

typedef indexCallback = void Function(int index);

class _listItems extends StatelessWidget {
  const _listItems({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Theme.of(context).colorScheme.primary)
          ]),
      child: Row(children: [
        Stack(alignment: Alignment.center, children: [
          Icon(
            Icons.circle_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ),
          Text(
            '$index',
            style: TextStyle(
                fontSize: 36, color: Theme.of(context).colorScheme.onPrimary),
          )
        ]),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.lessonNum + '$index',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(
                height: 8,
              ),
              Text(AppLocalizations.of(context)!.lessonTitle,
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
        ),
        Icon(
          Icons.lock_open_rounded,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        )
      ]),
    );
  }
}
