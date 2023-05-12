import 'package:flutter/material.dart';

import 'meme_calling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        setLoading(true);
        getMeme();
        setLoading(false);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(memeImg), fit: BoxFit.contain)),
      ),
    ));
  }
}
