import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var meme =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYBMboChVnEKnNFnGh54ijKuu_BjbEZCUn3Q&usqp=CAU';

  var isLoading = false;
  final url = 'https://programming-memes-images.p.rapidapi.com/v1/memes';
  final headers = {
    'X-RapidAPI-Key': 'b396080d4bmsh95c5a42f117ae03p15b135jsnc62f0b3ce073',
    'X-RapidAPI-Host': 'programming-memes-images.p.rapidapi.com',
  };

  Future getMeme() async {
    var dio = Dio();
    var responce = await dio.get(url);
    if (responce.statusCode == 200) {
      setState(() {
        meme = responce.data['image'];
      });
    } else {
      debugPrint('Error ');
    }
  }

  void setLoading(bool image) {
    setState(() {
      isLoading = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRIblpZjIBg4QM-4MyKPN1MV2PXv2Wc9tbQ&usqp=CAU'),
              fit: BoxFit.fitHeight)),
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragStart: (eaders) async {
              setLoading(true);
              await getMeme();
              setLoading(false);
            },
            child: Center(
              child: Image(
                image: NetworkImage(meme),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
