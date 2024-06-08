import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';

class ImagePalette extends StatefulWidget {
  const ImagePalette({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  _ImagePaletteState createState() => _ImagePaletteState();
}

class _ImagePaletteState extends State<ImagePalette> {
  PaletteGenerator? paletteGenerator;

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/${widget.image}"));
    print(paletteGenerator!.vibrantColor);
    setState(() {});
  }

  @override
  void initState() {
    _updatePaletteGenerator();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.h,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor:
                paletteGenerator?.vibrantColor?.color ?? Colors.transparent,
          ),
          CircleAvatar(
            backgroundColor:
                paletteGenerator?.dominantColor?.color ?? Colors.transparent,
          ),
          CircleAvatar(
            backgroundColor:
                paletteGenerator?.mutedColor?.color ?? Colors.transparent,
          ),
        ],
      ),
    );
  }
}
