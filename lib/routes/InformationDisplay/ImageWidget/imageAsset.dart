import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageAssetPage extends StatefulWidget {
  @override
  _ImageAssetState createState() => _ImageAssetState();
}

class _ImageAssetState extends State<ImageAssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Image Asset"), centerTitle: true),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'lib/assets/coruja.jpg',
          fit: BoxFit.fill,
          height: 300,
          scale: 0.1,
          cacheHeight: 200,
          cacheWidth: 200,
          bundle: PlatformAssetBundle(),
          width: 300,
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.noRepeat,
          matchTextDirection: true,
          semanticLabel: "Imagem de coruja",
          gaplessPlayback: false,
          color: Colors.indigo[900],
          colorBlendMode: BlendMode.colorDodge,
          filterQuality: FilterQuality.low,
          excludeFromSemantics: false,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedAlign(
              child: child,
              alignment: frame == null ? Alignment.topCenter : Alignment.center,
              duration: Duration(seconds: 2),
              curve: Curves.easeOutSine,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Text("Image doesn't exist!");
          },
        ),
      ),
    );
  }
}
