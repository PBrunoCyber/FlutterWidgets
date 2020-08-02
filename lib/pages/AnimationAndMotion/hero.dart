import 'package:flutter/material.dart';

class RoutesHero extends StatefulWidget {
  @override
  _RoutesHeroState createState() => _RoutesHeroState();
}

class _RoutesHeroState extends State<RoutesHero> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/heroPage':
            final HeroData data = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => HeroPage(
                name: data.name,
                color: data.color,
              ),
            );
            break;
        }
        return null;
      },
      home: Builder(
        builder: (context) => HeroMain(),
      ),
    );
  }
}

class HeroMain extends StatelessWidget {
  final List<String> _image = [
    'https://image.freepik.com/vetores-gratis/desenho-de-baleia-bonito_43633-154.jpg', //azul
    'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png', //verde
    'https://image.freepik.com/vetores-gratis/veado-de-nariz-vermelho-dos-desenhos-animados_29190-4265.jpg' //laranja
  ];
  final List<Color> _colors = [
    Colors.blue[50],
    Colors.green[50],
    Colors.orange[50]
  ];
  final List<String> _animais = ["baleia", "sapo", "veado"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Hero"),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        itemExtent: 200,
        scrollDirection: Axis.horizontal,
        itemCount: _image.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Hero(
              tag: 'tag-$index',
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  '/heroPage',
                  arguments: HeroData('${_animais[index]}', _colors[index]),
                ),
                child: CircleAvatar(
                  backgroundColor: _colors[index],
                  child: Image.network(
                    '${_image[index]}',
                    height: 100,
                    width: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator(
                        value: loadingProgress != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  final String name;
  final Color color;
  const HeroPage({Key key, @required this.name, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: color,
          iconTheme: IconThemeData(color: Colors.black54),
          title: Text(
            name.toUpperCase(),
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
      ),
      body: name == 'baleia'
          ? ItemHero(
              tag: 'tag-0',
              image:
                  'https://image.freepik.com/vetores-gratis/desenho-de-baleia-bonito_43633-154.jpg',
              description:
                  'Duis ea esse laborum sint irure pariatur eiusmod esse ad tempor sunt. Enim irure dolor nisi ad sit duis. Consequat culpa amet sit ullamco.',
            )
          : name == 'sapo'
              ? ItemHero(
                  tag: 'tag-1',
                  image:
                      'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                  description:
                      'Ex ut fugiat mollit labore aute consequat. Sit et ea ea est nisi commodo sunt culpa sit cillum in excepteur sit et. Nostrud elit ullamco ut duis elit ad adipisicing qui. Mollit exercitation nulla ullamco ex irure velit ullamco in adipisicing dolore Lorem magna. Qui quis duis cupidatat amet cupidatat. Nisi tempor consequat incididunt anim commodo officia nisi consequat dolor id anim. Mollit amet consectetur voluptate sit sunt dolore velit non quis dolore dolor tempor dolor dolore.',
                )
              : ItemHero(
                  tag: 'tag-2',
                  image:
                      'https://image.freepik.com/vetores-gratis/veado-de-nariz-vermelho-dos-desenhos-animados_29190-4265.jpg',
                  description:
                      'Sint deserunt ipsum sint sunt cupidatat. Culpa excepteur id ex fugiat laborum. Esse minim proident nulla dolor nostrud ex qui. Aliquip quis Lorem aliquip irure occaecat dolore aliqua esse voluptate ea mollit nisi. Velit aute incididunt occaecat eu laboris mollit adipisicing proident adipisicing irure excepteur sunt cillum anim.',
                ),
    );
  }
}

class ItemHero extends StatelessWidget {
  final String tag;
  final String image;
  final String description;

  ItemHero(
      {Key key,
      @required this.tag,
      @required this.image,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onVerticalDragEnd: (details) {
            Navigator.of(context).pop();
          },
          child: Hero(
            transitionOnUserGestures: true,
            tag: this.tag,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.network(
                this.image,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            this.description,
          ),
        ),
      ],
    );
  }
}

class HeroData {
  final String name;
  final Color color;
  HeroData(this.name, this.color);
}
