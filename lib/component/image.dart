import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  CustomImage(
      {Key? key,
      required this.url,
      required this.width,
      required this.height,
      this.fit = BoxFit.cover,
      this.defaultImagePath = 'assets/images/404.png'})
      : super(key: key);

  // 图片路径
  final String url;

  // 图片宽高
  final double width;
  final double height;

  final BoxFit fit;

  // 默认图片地址
  final String defaultImagePath;

  @override
  _CustomImageState createState() {
    return _CustomImageState();
  }
}

class _CustomImageState extends State<CustomImage> {
  Image _image = Image.asset('');

  @override
  void initState() {
    super.initState();
    _image = Image.network(widget.url,
        width: widget.width, height: widget.height, fit: widget.fit);

    var resolve = _image.image.resolve(ImageConfiguration.empty);
    resolve
        .addListener(ImageStreamListener((_, __) {}, onError: (error, stack) {
      print('图片加载错误');
      setState(() {
        _image = Image.asset(
          widget.defaultImagePath,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        );
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _image;
  }
}
