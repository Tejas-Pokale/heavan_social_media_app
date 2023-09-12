import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app/providers/fab_visibility_provider.dart';
import 'package:video_player_app/widgets/circle_image_url.dart';
import 'package:video_player_app/widgets/demopage.dart';
import 'package:video_player_app/widgets/drawer_home.dart';
import 'package:video_player_app/widgets/search_chips.dart';
import 'package:video_player_app/widgets/search_grid.dart';
import 'package:video_player_app/widgets/search_view.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _controller = ScrollController();
  ScrollController _controller2 = ScrollController();


  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // Tab is changing, perform actions if needed
      }
    });

    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        ref
            .watch(fabVisibilityProvider.notifier)
            .toggleFabVisibility(vertical: true, horizontal: false);
        ref.watch(fabVisibilityProvider);
        print('shoving');
      } else if (_controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        ref
            .watch(fabVisibilityProvider.notifier)
            .toggleFabVisibility(vertical: true, horizontal: false);
        ref.watch(fabVisibilityProvider);
        print('hiding');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: const DrawerHome(),
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            //controller: _controller2,
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  // expandedHeight: 90,

                  toolbarHeight: 60,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: CircleImageUrl(
                        imageUrl:
                            'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7',
                        radius: 3.0,
                      ),
                    ),
                  ),
                  title: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
                      child: const SearchView()),
                  titleSpacing: 0,
                  floating: true,
                  // snap: true,
                  pinned: true,
                  forceElevated: true,

                  bottom: const TabBar(
                    //controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Recommended'),
                      Tab(text: 'Trending'),
                      Tab(text: 'Newest'),
                      Tab(text: 'Most liked'),
                    ],
                  ),
                ),
              ];
            },
            body: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                ),
                TabBarView(
                  children: [
                    // Contents of Tab 1
                   ListView.builder(
                        itemCount: 50,
                        //controller: _controller,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Item $index"),
                          );
                        },
                      ),
                    // Contents of Tab 2
                    DemoPage(text: 'Trending'),
                    // Contents of Tab 3
                    DemoPage(text: 'Newest'),
                    DemoPage(text: 'Most liked'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
