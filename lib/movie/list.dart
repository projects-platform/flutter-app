import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../component/image.dart';
import './detail.dart';

Dio dio = new Dio();

// 创建有状态控件，必须结合一个状态管理类
class MovieList extends StatefulWidget {
  MovieList({Key? key, required this.mt}) : super(key: key);

  // 电影类型
  final String mt;

  @override
  _MovieListState createState() {
    return _MovieListState();
  }
}

// 状态管理类
class _MovieListState extends State<MovieList>
    with AutomaticKeepAliveClientMixin {
  // 默认显示第一页数据
  int page = 1;
  // 每页显示的数据条数
  int pageSize = 10;
  // 电影列表数据
  var movieList = [];
  // 总数据条数
  var total = 0;

  @override
  bool get wantKeepAlive => true;

  // 使用 widget 可访问状态类中的属性
  @override
  Widget build(BuildContext context) {
    // 指定动态渲染
    return ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext ctx, int i) {
          var mItem = movieList[i];
          return GestureDetector(
            onTap: () {
              // 导航跳转并传参
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return MovieDetail(
                  id: mItem['id'],
                  title: mItem['title'],
                );
              }));
            },
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: Row(
                  children: [
                    CustomImage(
                      url: mItem['images']['small'],
                      width: 130.0,
                      height: 180.0,
                    ),
                    Container(
                        height: 200,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('电影名称：${mItem['title']}'),
                            Text('上映年份：${mItem['year']} 年'),
                            Text('电影类型：${mItem['genres'].join(',')}'),
                            Text('豆瓣评分：${mItem['rating']['average']} 分'),
                            Text('主要演员：${mItem['title']}'),
                          ],
                        ))
                  ],
                )),
          );
        });
  }

  // 组件初始化时调用
  @override
  void initState() {
    super.initState();
    print('initState');
    getMovieList();
  }

  // 定义获取数据请求
  getMovieList() async {
    int offset = (page - 1) * pageSize;
    var response = await dio.get(
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');
    var result = response.data;
    print(result);

    // 为私有数据赋值
    setState(() {
      movieList = result['subjects'];
      total = result['total'];
    });
  }
}
