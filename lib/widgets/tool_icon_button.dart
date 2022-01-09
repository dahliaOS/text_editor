import 'package:flutter/material.dart';
import 'package:text_editor/editor.dart';

class ToolIconButton extends StatelessWidget {
  const ToolIconButton({
    required this.icon,
    required this.tooltip,
    Key? key,
  }) : super(key: key);
  final IconData icon;
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
            child: Icon(
              icon,
              size: 25,
              color: Theme.of(context).colorScheme.barIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
