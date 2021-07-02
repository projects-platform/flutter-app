import 'package:flutter/material.dart';
import 'package:flutter_app/demo/custom_navigation.dart';
import 'package:flutter_app/demo/custom_route.dart';
import './movie/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Hello Flutter', home: MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter 组件'),
              // 右侧行为按钮
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
            // 侧边栏
            drawer: AccountDrawer(),
            // 底部导航
            bottomNavigationBar: BottomNavigationBar(),
            // 主体页面
            body: BodyContainer()));
  }
}

class AccountDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/12862565?v=4'),
            ),
            accountName: Text('H_VK'),
            accountEmail: Text('hvkcoder@gmail.com'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://camo.githubusercontent.com/12be2b219d5e0179e164c86f5b0ffe2f286bf12b2d562f0adb857434e7e6ea27/68747470733a2f2f692e706f7374696d672e63632f7a665734725052582f6267312e6a7067'))),
          ),
          ListTile(
            title: Text('我的'),
            trailing: Icon(Icons.account_box),
          ),
          ListTile(
            title: Text('自定义导航'),
            trailing: Icon(Icons.menu),
            onTap: () {
              // Navigator.push(context,
              //     CustomRoute(builder: (BuildContext ctx) {
              //   return CustomNavigation();
              // }));

              Navigator.of(context).push(CustomRoute(CustomNavigation()));
            },
          ),
          ListTile(
            title: Text('系统设置'),
            trailing: Icon(Icons.settings),
          ),
          Divider(),
          ListTile(title: Text('退出登录'), trailing: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: TabBar(
        labelStyle: TextStyle(height: 0, fontSize: 10.0),
        tabs: [
          Tab(
            text: '正在热映',
            icon: Icon(Icons.movie_filter),
          ),
          Tab(
            text: '即将上映',
            icon: Icon(Icons.movie_creation),
          ),
          Tab(
            text: 'TOP250',
            icon: Icon(Icons.local_movies),
          )
        ],
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      MovieList(
        mt: 'in_theaters',
      ),
      MovieList(mt: 'coming_soon'),
      MovieList(mt: 'top250')
    ]);
  }
}
