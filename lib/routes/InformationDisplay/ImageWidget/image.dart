import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Image"), centerTitle: true),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage('lib/assets/coruja.jpg'),
          fit: BoxFit.fill,
          height: 300,
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
