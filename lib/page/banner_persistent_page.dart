import 'package:flutter/material.dart';
import 'package:material_banner_example/main.dart';

class BannerPersistentPage extends StatefulWidget {
  @override
  _BannerPersistentPageState createState() => _BannerPersistentPageState();
}

class _BannerPersistentPageState extends State<BannerPersistentPage> {
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
      body: Column(
        children: [
          if (hasBanner)
            GestureDetector(
              onTap: updateCard,
              child: MaterialBanner(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.indigoAccent,
                contentTextStyle: styleContent,
                leading: Icon(Icons.credit_card, color: Colors.white, size: 28),
                content: Text(
                    'You card has expired. Update your credit card information'),
                actions: [
                  TextButton(
                    child: Text('DISMISS', style: styleAction),
                    onPressed: hideBanner,
                  ),
                ],
              ),
            ),
          Expanded(child: ListView(children: buildImages())),
        ],
      ),
    );
  }

  void updateCard() => Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('Clicked On Update')));

  List<Widget> buildImages() =>
      urlImages.map((urlImage) => Image.network(urlImage)).toList();

  void showBanner() => setState(() => hasBanner = true);

  void hideBanner() => setState(() => hasBanner = false);
}
