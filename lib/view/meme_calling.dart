import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var memeImg =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYBMboChVnEKnNFnGh54ijKuu_BjbEZCUn3Q&usqp=CAU';

var isLoading = false;
const memeApiUrl = 'https://programming-memes-images.p.rapidapi.com/v1/memes';
var headers = {
  'X-RapidAPI-Key': 'b396080d4bmsh95c5a42f117ae03p15b135jsnc62f0b3ce073',
  'X-RapidAPI-Host': 'programming-memes-images.p.rapidapi.com',
};

Future getMeme() async {
  var dio = Dio();
  try {
    var responce =
        await dio.get(memeApiUrl, options: Options(headers: headers));
    if (responce.statusCode == 200) {
      memeImg = responce.data['image'];
    } else {
      debugPrint('Error ');
    }
  } catch (error) {}
}

void setLoading(bool image) {
  isLoading = image;
}
