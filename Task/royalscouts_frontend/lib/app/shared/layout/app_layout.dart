import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/nav_menu_items.dart';
import 'package:royalscouts/app/shared/layout/footer/footer.dart';

class AppLayout extends StatefulWidget {
  final double? bannerHeight;
  final String bannerBackgroundImage;
  final Widget banner;
  final Widget child;

  const AppLayout({
    Key? key,
    required this.child,
    required this.bannerBackgroundImage,
    required this.banner,
    this.bannerHeight,
  }) : super(key: key);

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late ScrollController _scrollController;
  late Color _theme;

  @override
  void initState() {
    super.initState();
    _theme = Colors.white;

    _scrollController = ScrollController()
      ..addListener(() => _isAppBarExpanded
          ? _theme != Colors.black
              ? setState(() {
                  _theme = Colors.black;
                })
              : {}
          : _theme != Colors.white
              ? setState(() {
                  _theme = Colors.white;
                })
              : {});
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (360 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    var actionsList = <Widget>[];

    for (var item in navMenuItems) {
      actionsList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, item.routeName);
          },
          child: Text(
            item.title,
            style: TextStyle(
              color: _theme,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ));
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                "RoyalScouts",
                style: TextStyle(
                  color: _theme,
                  fontWeight: FontWeight.w400,
                ),
              ),
              expandedHeight: widget.bannerHeight ?? 360.0,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 20,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.only(),
                  child: widget.banner,
                ),
                background: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.45),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    widget.bannerBackgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              actions: actionsList,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  widget.child,
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
