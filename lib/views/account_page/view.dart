import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pkcomics/actions/adapt.dart';
import 'package:pkcomics/widget/customcliper_path.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AccountPageState state, Dispatch dispatch, ViewService viewService) {
  return Builder(builder: (context) {
    final _lightTheme = ThemeData.light()
        .copyWith(cardColor: Colors.white, canvasColor: Colors.grey[300]);
    final _darkTheme = ThemeData.dark()
        .copyWith(cardColor: Color(0xFF505050), canvasColor: Color(0xFF404040));
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final ThemeData _theme = _mediaQuery.platformBrightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    Widget _buildBackGround() {
      return ClipPath(
          clipper: CustomCliperPath(
              height: Adapt.px(380),
              width: Adapt.screenW(),
              radius: Adapt.px(2000)),
          child: Container(
            height: Adapt.px(380),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF6495ED),
                    Color(0xFF6A5ACD),
                    //Color(0xFF707070),
                    //Color(0xFF202020),
                  ],
                  stops: <double>[
                    0.0,
                    1.0
                  ]),
            ),
          ));
    }

    Widget _buildHeader() {
      return Row(
        children: <Widget>[
          SizedBox(
            width: Adapt.px(40),
          ),
          SizedBox(
            width: Adapt.screenW() - Adapt.px(225),
            child: Text(
              'Hi, ${state.user?.displayName ?? 'Guest'}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Adapt.px(60),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          state.user == null
              ? InkWell(
                  onTap: () => dispatch(AccountPageActionCreator.onLogin()),
                  child: Container(
                      height: Adapt.px(60),
                      margin: EdgeInsets.only(
                          right: Adapt.px(30),
                          top: Adapt.px(13),
                          bottom: Adapt.px(13)),
                      padding: EdgeInsets.symmetric(
                          horizontal: Adapt.px(20), vertical: Adapt.px(10)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Adapt.px(30)),
                          border: Border.all(
                              color: const Color(0xFFFFFFFF), width: 2)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: Adapt.px(26)),
                      )))
              : PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  offset: Offset(0, Adapt.px(100)),
                  icon: Icon(
                    Icons.more_vert,
                    color: const Color(0xFFFFFFFF),
                    size: Adapt.px(50),
                  ),
                  onSelected: (selected) {
                    switch (selected) {
                      case 'Sign Out':
                        dispatch(AccountPageActionCreator.onLogout());
                        break;
                    }
                  },
                  itemBuilder: (ctx) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Notifications',
                        child: const _DropDownItem(
                          title: 'Notifications',
                          icon: Icons.notifications_none,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Sign Out',
                        child: const _DropDownItem(
                          title: 'Sign Out',
                          icon: Icons.exit_to_app,
                        ),
                      ),
                    ];
                  },
                ),
          SizedBox(
            width: Adapt.px(10),
          )
        ],
      );
    }

    Widget _buildGirdCell(String icon, String title, {Function() ontap}) {
      return GestureDetector(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.fromLTRB(
                Adapt.px(10), Adapt.px(10), Adapt.px(10), Adapt.px(30)),
            decoration: BoxDecoration(
                color: _theme.cardColor,
                borderRadius: BorderRadius.circular(Adapt.px(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: Adapt.px(10),
                      color: _theme.canvasColor,
                      offset: Offset(0, Adapt.px(15)))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  icon,
                  width: Adapt.px(100),
                  height: Adapt.px(100),
                ),
                SizedBox(
                  height: Adapt.px(20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Adapt.px(10)),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: Adapt.px(30), fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ));
    }

    Widget _buildBody() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: Adapt.px(30),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            _buildGirdCell('images/yoda.png', 'Watchlist',
                ontap: () => dispatch(AccountPageActionCreator.navigatorPush(
                    'WatchlistPage',
                    arguments: {'accountid': state.acountIdV3}))),
            _buildGirdCell('images/luke_skywalker.png', 'MyLists',
                ontap: () => dispatch(AccountPageActionCreator.navigatorPush(
                    'MyListsPage',
                    arguments: {'accountid': state.acountIdV4}))),
            _buildGirdCell('images/darth_vader.png', 'Favorites',
                ontap: () => dispatch(AccountPageActionCreator.navigatorPush(
                    'FavoritesPage',
                    arguments: {'accountid': state.acountIdV3}))),
            _buildGirdCell('images/chewbacca.png', 'Stream Links',
                ontap: () {}),
            _buildGirdCell('images/c3po.png', 'MyRated',
                ontap: () => dispatch(AccountPageActionCreator.navigatorPush(
                    'testPage',
                    arguments: {'accountid': state.acountIdV3}))),
            _buildGirdCell('images/r2d2.png', 'Settings',
                ontap: () =>
                    dispatch(AccountPageActionCreator.settingCellTapped())),
          ],
        ),
      );
    }

    return Scaffold(
        key: state.scafoldState,
        endDrawer: Drawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              _buildBackGround(),
              Container(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: Adapt.px(60),
                      ),
                      _buildHeader(),
                      SizedBox(
                        height: Adapt.px(50),
                      ),
                      _buildBody(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  });
}

class _DropDownItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const _DropDownItem({@required this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[Icon(icon), SizedBox(width: 10), Text(title)],
    );
  }
}
