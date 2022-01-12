import 'package:flutter/material.dart';
import 'package:text_editor/editor.dart';

class ToolTextButton extends StatelessWidget {
  const ToolTextButton({
    required this.text,
    required this.tooltip,
    Key? key,
  }) : super(key: key);
  final String text;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                color: Theme.of(context).colorScheme.barIconColor,
                fontWeight: FontWeight.w800,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
