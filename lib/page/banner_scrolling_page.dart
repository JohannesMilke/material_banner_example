import 'package:flutter/material.dart';
import 'package:material_banner_example/main.dart';

class BannerScrollingPage extends StatefulWidget {
  @override
  _BannerScrollingPageState createState() => _BannerScrollingPageState();
}

class _BannerScrollingPageState extends State<BannerScrollingPage> {
  bool hasBanner = true;

  final urlImages = [
    'https://images.unsplash.com/photo-1590223357622-d7ba1d88d3f7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80',
    'https://images.unsplash.com/photo-1437914983566-976d85602771?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1523113501336-6ea4a7d6660d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    final styleContent = TextStyle(color: Colors.white, fontSize: 16);
    final styleAction = TextStyle(color: Colors.white, fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: [
          if (!hasBanner)
            IconButton(
              icon: Icon(Icons.visibility),
              onPressed: showBanner,
            ),
        ],
      ),
      body: ListView(
        children: [
          if (hasBanner)
            GestureDetector(
              onTap: join,
              child: MaterialBanner(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.indigoAccent,
                contentTextStyle: styleContent,
                leadingPadding: EdgeInsetsDirectional.only(end: 24),
                leading:
                    Icon(Icons.directions_run, color: Colors.white, size: 28),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly Workout',
                      style: styleContent.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'Enroll in a six hour workout and invite your friends!'),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('JOIN', style: styleAction),
                    onPressed: join,
                  ),
                  TextButton(
                    child: Text('DISMISS', style: styleAction),
                    onPressed: hideBanner,
                  ),
                ],
              ),
            ),
          ...buildImages(),
        ],
      ),
    );
  }

  void join() => Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('Clicked On Join')));

  List<Widget> buildImages() =>
      urlImages.map((urlImage) => Image.network(urlImage)).toList();

  void showBanner() => setState(() => hasBanner = true);

  void hideBanner() => setState(() => hasBanner = false);
}
