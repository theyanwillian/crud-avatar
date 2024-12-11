import 'package:flutter/material.dart';
import 'package:projeto_login/components/select_avatar.dart';

typedef AvatarSelectedCallback = void Function(String);

class AvatarSelector extends StatefulWidget {
  final String? initialAvatarUrl;
  final AvatarSelectedCallback onAvatarSelected;

  const AvatarSelector({
    Key? key,
    required this.initialAvatarUrl,
    required this.onAvatarSelected,
  }) : super(key: key);

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  String? selectedAvatarUrl;

  @override
  void initState() {
    super.initState();
    selectedAvatarUrl = widget.initialAvatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> avatarUrls = [
      'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png',
      'https://cdn.pixabay.com/photo/2014/03/24/17/19/teacher-295387_1280.png',
      'https://cdn.pixabay.com/photo/2014/04/02/17/07/user-307993_1280.png',
      'https://cdn.pixabay.com/photo/2024/06/09/13/00/ai-generated-8818683_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/09/13/00/ai-generated-8818682_960_720.jpg',
      'https://cdn.pixabay.com/photo/2024/09/19/10/49/ai-generated-9058455_960_720.jpg',
      'https://cdn.pixabay.com/photo/2023/01/06/12/38/ai-generated-7701143_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/01/07/09/20/ai-generated-7702855_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/09/02/09/17/ai-generated-9016210_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/08/02/16/49/ai-generated-8940241_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/08/02/16/49/ai-generated-8940240_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/08/02/16/56/little-monster-8940271_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/09/19/10/49/ai-generated-9058454_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/09/19/10/49/ai-generated-9058456_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/09/19/10/49/ai-generated-9058451_1280.jpg',
    ];

    return Wrap(
      spacing: 32,
      runSpacing: 32,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: avatarUrls.map((url) {
        return SelectableAvatar(
          url: url,
          selected: selectedAvatarUrl == url,
          onAvatarSelected: (selectedUrl) {
            setState(() {
              selectedAvatarUrl = selectedUrl;
            });
            widget.onAvatarSelected(selectedUrl);
          },
        );
      }).toList(),
    );
  }
}