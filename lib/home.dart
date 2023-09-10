import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int clickedLesson= 0;
  bool liked= false;
  bool swchtap= true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
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
                                height: 36,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(40, 0, 40, 4),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
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
              physics: BouncingScrollPhysics(),
                itemCount: 30,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  index = index + 1;
                  return Column(
                    children: [
                      _listItems(
                        index: index, tapLesson: (int tapindex) {
                           setState(() {
                            clickedLesson==tapindex?swchtap=!swchtap:
                            swchtap=true;
                          clickedLesson=tapindex;
                        }); },
                      ),
                      clickedLesson==index && swchtap?
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                        decoration: BoxDecoration(color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                liked=!liked;
                              });
                            }, icon: liked?Icon(Icons.favorite):Icon(Icons.favorite_outline,),color: themeData.colorScheme.onPrimary,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.equalizer,color: themeData.colorScheme.onPrimary)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline),color: themeData.colorScheme.onPrimary),
                          ],
                        ),
                      ):SizedBox()
                    ],
                  );
                }),
          ),
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
      enableFeedback: false,
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

class _listItems extends StatefulWidget {
  final Function(int) tapLesson;
  const _listItems({Key? key, required this.index, required this.tapLesson}) : super(key: key);
  final int index;

  @override
  State<_listItems> createState() => _listItemsState();
}

class _listItemsState extends State<_listItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8,16, 8),
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
            '${widget.index}',
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
              Text(AppLocalizations.of(context)!.lessonNum + '${widget.index}',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(
                height: 8,
              ),
              Text(AppLocalizations.of(context)!.lessonTitle,
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
        ),
        IconButton(onPressed: (){
          widget.tapLesson(widget.index);
        },
          icon: Icon(
            Icons.more_vert,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ]),
    );
  }
}
