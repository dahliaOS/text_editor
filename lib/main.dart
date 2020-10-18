/*
Copyright 2019 The dahliaOS Authors
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(new TextEditorApp());
}

class TextEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Text Editor',
      theme: new ThemeData(
        platform: TargetPlatform.fuchsia,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: const Color(0xFFfafafa),
      ),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<FirstScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff28292E),
      body: Row(
        children: <Widget>[
          NavigationRail(
            minWidth: 56.0,
            groupAlignment: 1.0,
            backgroundColor: Color(0xff2D3035),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
                  ),
                ),
                SizedBox(
                  height: 108,
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: IconButton(
                    icon: Icon(Icons.tune),
                    color: Color(0xffFCCFA8),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            selectedLabelTextStyle: TextStyle(
              color: Color(0xffFCCFA8),
              fontSize: 13,
              letterSpacing: 0.8,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 13,
              letterSpacing: 0.8,
            ),
            destinations: [
              buildRotatedTextRailDestination("Popular", padding),
              buildRotatedTextRailDestination("Favourites", padding),
              buildRotatedTextRailDestination("Inspiration", padding),
              buildRotatedTextRailDestination("All", padding),
            ],
          ),
          // This is the main content.
          ContentSpace(_selectedIndex)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  final int _selectedIndex;

  ContentSpace(this._selectedIndex);

  final List<String> images = [
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
    "https://images.unsplash.com/photo-1513161455079-7dc1de15ef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1544457070-4cd773b4d71e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=843&q=80",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1549488344-cbb6c34cf08b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];

  final List<String> titles = [
    "Popular\nIdeas",
    "Favourites",
    "Inspiration\nIdeas",
    "All"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(titles[_selectedIndex],
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 24,
              ),
              for (var i in images) ImageCard(i),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final uri;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: Image.network(uri),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  const ImageCard(this.uri);
}

class DocPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Untitled Document',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w300)),
                  Text(
                      '      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                      style: TextStyle(
                          height: 1.5, fontSize: 14, color: Color(0xff2b2b2b)))
                ]))));
  }
}

// Navigator.pushNamed(context, '/second');

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        appBar: AppBar(
          centerTitle: false,
          title: Text('Untitled Document'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        body: Column(children: [
          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: SingleChildScrollView(
                  //padding:
                  // new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.undo,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.redo,
                                size: 25, color: Color(0xff545454)))),
                    VerticalDivider(
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_bold,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.strikethrough_s,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_underlined,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_italic,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_quote,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.code,
                                size: 25, color: Color(0xff545454)))),
                    VerticalDivider(
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H1",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H2",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H3",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H4",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H5",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: new Text(
                            "H6",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    VerticalDivider(
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_list_bulleted,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.format_list_numbered,
                                size: 25, color: Color(0xff545454)))),
                    VerticalDivider(
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.link,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.image,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.table_chart,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.insert_emoticon,
                                size: 25, color: Color(0xff545454)))),
                    Container(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: Icon(Icons.functions,
                                size: 25, color: Color(0xff545454)))),
                  ]))),
          new Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.all(25.0),
              width: 900,
              height: 1600,
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: new TextFormField(
                    onChanged: (text) {
                      print("First text field: $text");
                    },
                    style: TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFF222222),
                      fontFamily: "Roboto",
                    ),
                    decoration: InputDecoration.collapsed(hintText: ""),
                    autocorrect: false,
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    cursorColor: const Color(0xFF222222),
                  ),
                ),
              ),
            ),
          ))
        ]));
  }
}
//Navigator.pop(context);
