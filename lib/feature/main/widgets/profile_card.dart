import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/main/main_controller.dart';
import 'package:tpt_frontend/resources/resources.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: controller.user?.profilePicture != ""
                ? controller.user!.profilePicture!
                : "https://ui-avatars.com/api/?size=120&name=${controller.user?.name ?? "User"}",
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 20,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircleAvatar(
                radius: 20,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "https://ui-avatars.com/api/?size=120&name=${controller.user?.name ?? "User"}"
                ),
              ),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              controller.user?.name ?? "User",
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}