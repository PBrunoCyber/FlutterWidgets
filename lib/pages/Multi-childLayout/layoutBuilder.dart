import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LayoutBuilderPage extends StatefulWidget {
  @override
  _LayoutBuilderState createState() => _LayoutBuilderState();
}

class _LayoutBuilderState extends State<LayoutBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Layout Builder"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600)
            return _layoutCell();
          else
            return _layoutTablet();
        },
      ),
    );
  }

  Widget _layoutCell() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                              "Proident sit ut exercitation",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "In ad ea cupidatat sunt qui laboris ipsum eu. ia ex minim occaecat adipisicing Lorem.",
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sit velit velit tempor pariatur sit cillum Lorem culpa quis laboris. Cupidatat nostrud veniam adipisicing enim tempor minim incididunt laboris Lorem ullamco tempor nulla nisi sint. Quis non cillum quis ullamco occaecat minim non deserunt laborum voluptate nisi eiusmod cillum. Laboris veniam sint dolore eu tempor ullamco. Aliqua est excepteur eu aute. Pariatur eu quis minim in sint ad do velit reprehenderit reprehenderit. Reprehenderit irure amet do labore pariatur exercitation officia laborum labore fugiat ipsum quis.",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          "https://www.pngpix.com/wp-content/uploads/2016/11/PNGPIX-COM-Target-PNG-Transparent-Image-2.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                              "Proident sit ut exercitation",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "In ad ea cupidatat sunt qui laboris ipsum eu. ia ex minim occaecat adipisicing Lorem.",
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sit velit velit tempor pariatur sit cillum Lorem culpa quis laboris. Cupidatat nostrud veniam adipisicing enim tempor minim incididunt laboris Lorem ullamco tempor nulla nisi sint. Quis non cillum quis ullamco occaecat minim non deserunt laborum voluptate nisi eiusmod cillum. Laboris veniam sint dolore eu tempor ullamco. Aliqua est excepteur eu aute. Pariatur eu quis minim in sint ad do velit reprehenderit reprehenderit. Reprehenderit irure amet do labore pariatur exercitation officia laborum labore fugiat ipsum quis.",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _layoutTablet() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text(
                                "Proident sit ut exercitation",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "In ad ea cupidatat sunt qui laboris ipsum eu. ia ex minim occaecat adipisicing Lorem.",
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sit velit velit tempor pariatur sit cillum Lorem culpa quis laboris. Cupidatat nostrud veniam adipisicing enim tempor minim incididunt laboris Lorem ullamco tempor nulla nisi sint. Quis non cillum quis ullamco occaecat minim non deserunt laborum voluptate nisi eiusmod cillum. Laboris veniam sint dolore eu tempor ullamco. Aliqua est excepteur eu aute. Pariatur eu quis minim in sint ad do velit reprehenderit reprehenderit. Reprehenderit irure amet do labore pariatur exercitation officia laborum labore fugiat ipsum quis.",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            "https://www.pngpix.com/wp-content/uploads/2016/11/PNGPIX-COM-Target-PNG-Transparent-Image-2.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text(
                                "Proident sit ut exercitation",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "In ad ea cupidatat sunt qui laboris ipsum eu. ia ex minim occaecat adipisicing Lorem.",
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sit velit velit tempor pariatur sit cillum Lorem culpa quis laboris. Cupidatat nostrud veniam adipisicing enim tempor minim incididunt laboris Lorem ullamco tempor nulla nisi sint. Quis non cillum quis ullamco occaecat minim non deserunt laborum voluptate nisi eiusmod cillum. Laboris veniam sint dolore eu tempor ullamco. Aliqua est excepteur eu aute. Pariatur eu quis minim in sint ad do velit reprehenderit reprehenderit. Reprehenderit irure amet do labore pariatur exercitation officia laborum labore fugiat ipsum quis.",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
