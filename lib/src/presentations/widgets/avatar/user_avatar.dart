import 'package:cct_core/cct_core.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String displayName;
  final double avatarSize;
  final AttachmentEntity? avatar;

  const UserAvatar({
    super.key,
    required this.displayName,
    required this.avatarSize,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return avatar != null
        ? Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: ThumbnailImage(
                imageSrc: avatar!,
                borderRadius: BorderRadius.zero,
                margin: EdgeInsets.zero,
                hasSize: true,
                width: avatarSize,
                height: avatarSize),
          )
        : Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondaryFixed),
            child: Text(
              getAvatarText(displayName),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
  }

  String getAvatarText(String name) {
    final words = name.split(' ').where((word) => word.isNotEmpty).toList();
    if (words.isEmpty) return '';
    if (words.length == 1) return words[0][0].toUpperCase();
    return (words[0][0] + words[1][0]).toUpperCase();
  }
}
