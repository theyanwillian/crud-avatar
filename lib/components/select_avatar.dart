import 'package:flutter/material.dart';

class SelectableAvatar extends StatelessWidget {
  const SelectableAvatar({
    Key? key,
    required this.url,
    required this.selected,
    this.onAvatarSelected,
  }) : super(key: key);

  final String url;
  final bool selected;
  final void Function(String)? onAvatarSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (onAvatarSelected != null) {
              onAvatarSelected!(url);
            }
          },
          child: _renderAvatar(context),
        ),
      ),
    );
  }

  Widget _renderAvatar(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: selected ? 120 : 100,
      height: selected ? 120 : 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: selected ? 5 : 3,
          color: selected ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
