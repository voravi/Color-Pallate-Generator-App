import 'dart:convert';
import 'dart:developer';
import 'package:color_pallate_generator_app/modals/pallate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PaletteProvider with ChangeNotifier{

  Palette palette = Palette(
    index: 0,
    codeList: ["FFF8BBD0", "FFF48FB1", "FFF06292", "FFEC4071", "FFE91E63", "FFAD1457", "FF880E4F"],
    colorList: [
      const Color(0xfff8bbd0),
      const Color(0xfff48fb1),
      const Color(0xfff06292),
      const Color(0xffec4071),
      const Color(0xffe91e63),
      const Color(0xffad1457),
      const Color(0xff880e4f)
    ],
  );

  void changePalette({required int index}) async {
    String data = await rootBundle.loadString("assets/json/color_data.json");
    List<dynamic> decodedData = jsonDecode(data);

    palette.codeList = await decodedData[index]["colors"];

    List<int> paletteIntData = palette.codeList.map((e) => int.parse(e, radix: 16)).toList();
    palette.colorList= paletteIntData.map((e) => Color(e)).toList();

    log(palette.codeList.toString(),name: "Code List");
    log(palette.colorList.toString(),name: "Color List");

    notifyListeners();
  }
}
