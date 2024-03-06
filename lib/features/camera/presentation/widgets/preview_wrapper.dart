import 'package:flutter/material.dart';
import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';

class Preview extends StatelessWidget {
  const Preview({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoPreviewer(
          path: path,
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: context.height(.2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                _ActionButton(
                  icon: Icons.check,
                  onPressed: () {
                    context.popAll();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SaveModal(
                          path: path,
                        );
                      },
                    );
                  },
                ),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.close,
                    onPressed: context.pop,
                    iconSize: 30,
                    padding: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.onPressed,
    this.iconSize = 50,
    this.padding = 20,
  });

  final IconData icon;
  final double iconSize;
  final double padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.2),
        shape: const CircleBorder(),
        padding: EdgeInsets.all(padding),
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: Colors.white.withOpacity(.4),
      ),
    );
  }
}
