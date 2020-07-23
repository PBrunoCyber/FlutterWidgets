import 'package:flutter/material.dart';

class ImageNetworkPage extends StatefulWidget {
  @override
  _ImageNetworkState createState() => _ImageNetworkState();
}

class _ImageNetworkState extends State<ImageNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Image Network"), centerTitle: true),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.network(
          "https://www.talkwalker.com/images/2020/blog-headers/image-analysis.png",
          fit: BoxFit.fill,
          height: 300,
          width: 300,
          scale: 1,
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.noRepeat,
          matchTextDirection: true,
          semanticLabel: "Imagem de coruja",
          gaplessPlayback: false,
          color: Colors.indigo[900],
          colorBlendMode: BlendMode.colorDodge,
          filterQuality: FilterQuality.high,
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
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
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
