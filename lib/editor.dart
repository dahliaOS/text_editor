/*
Copyright 2022 The dahliaOS Authors
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
import 'package:text_editor/widgets/tool_icon_button.dart';
import 'package:text_editor/widgets/tool_text_button.dart';

extension CustomColorScheme on ColorScheme {
  Color get foregroundText => brightness == Brightness.light
      ? const Color(0xFF222222)
      : const Color(0xFFffffff);

  Color get cardColor => brightness == Brightness.light
      ? const Color(0xFFffffff)
      : const Color(0xFF333333);

  Color get barIconColor => brightness == Brightness.light
      ? const Color(0xFF454545)
      : const Color(0xFFffffff);

  Color get barColor => brightness == Brightness.light
      ? const Color(0xFFe0e0e0)
      : const Color(0xFF333333);
}

class TextEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.fuchsia,
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        platform: TargetPlatform.fuchsia,
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      /*themeMode: Pangolin.settingsBox.get("darkMode")
          ? ThemeMode.dark
          : ThemeMode.light,*/
      title: 'Text Editor',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/second',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const TextEditorHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class TextEditorHomePage extends StatefulWidget {
  const TextEditorHomePage({Key? key}) : super(key: key);

  @override
  _TextEditorHomePageState createState() => _TextEditorHomePageState();
}

class _TextEditorHomePageState extends State<TextEditorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Untitled Document'),
        actions: <Widget>[
          // action button
          Tooltip(
            message: 'Save',
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          Tooltip(
            message: 'Share',
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          Tooltip(
            message: 'Print',
            child: IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.barColor,
            child: SingleChildScrollView(
              //padding:
              // new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ToolIconButton(
                    icon: Icons.undo,
                    tooltip: 'Undo',
                  ),
                  const ToolIconButton(
                    icon: Icons.redo,
                    tooltip: 'Redo',
                  ),
                  VerticalDivider(
                    endIndent: 10,
                    indent: 10,
                    color: Theme.of(context).colorScheme.barIconColor,
                  ),
                  const ToolIconButton(
                    icon: Icons.format_bold,
                    tooltip: 'Bold',
                  ),
                  const ToolIconButton(
                    icon: Icons.strikethrough_s,
                    tooltip: 'Strike Through',
                  ),
                  const ToolIconButton(
                    icon: Icons.format_underlined,
                    tooltip: 'Underline',
                  ),
                  const ToolIconButton(
                    icon: Icons.format_italic,
                    tooltip: 'Italic',
                  ),
                  const ToolIconButton(
                    icon: Icons.format_quote,
                    tooltip: 'Quote',
                  ),
                  const ToolIconButton(
                    icon: Icons.code,
                    tooltip: 'Code',
                  ),
                  VerticalDivider(
                    endIndent: 10,
                    indent: 10,
                    color: Theme.of(context).colorScheme.barIconColor,
                  ),
                  const ToolTextButton(
                    text: "H1",
                    tooltip: "Headline1",
                  ),
                  const ToolTextButton(
                    text: "H2",
                    tooltip: "Headline2",
                  ),
                  const ToolTextButton(
                    text: "H3",
                    tooltip: "Headline3",
                  ),
                  const ToolTextButton(
                    text: "H4",
                    tooltip: "Headline4",
                  ),
                  const ToolTextButton(
                    text: "H5",
                    tooltip: "Headline5",
                  ),
                  const ToolTextButton(
                    text: "H6",
                    tooltip: "Headline6",
                  ),
                  VerticalDivider(
                    endIndent: 10,
                    indent: 10,
                    color: Theme.of(context).colorScheme.barIconColor,
                  ),
                  const ToolIconButton(
                    icon: Icons.format_list_bulleted,
                    tooltip: 'Bullet List',
                  ),
                  const ToolIconButton(
                    icon: Icons.format_list_numbered,
                    tooltip: 'Number List',
                  ),
                  VerticalDivider(
                    endIndent: 10,
                    indent: 10,
                    color: Theme.of(context).colorScheme.barIconColor,
                  ),
                  const ToolIconButton(
                    icon: Icons.link,
                    tooltip: 'Link',
                  ),
                  const ToolIconButton(
                    icon: Icons.image,
                    tooltip: 'Image',
                  ),
                  const ToolIconButton(
                    icon: Icons.table_chart,
                    tooltip: 'Table Chart',
                  ),
                  const ToolIconButton(
                    icon: Icons.insert_emoticon,
                    tooltip: 'Emoticon',
                  ),
                  const ToolIconButton(
                    icon: Icons.functions,
                    tooltip: 'Functions',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(25.0),
                width: 900,
                height: 1600,
                child: Card(
                  color: Theme.of(context).colorScheme.cardColor,
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: TextFormField(
                      onChanged: (text) {
                        print("First text field: $text");
                      },
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Theme.of(context).colorScheme.foregroundText,
                        fontFamily: "Roboto",
                      ),
                      decoration: const InputDecoration.collapsed(hintText: ""),
                      autocorrect: false,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      cursorColor: Theme.of(context).colorScheme.foregroundText,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//Navigator.pop(context);
