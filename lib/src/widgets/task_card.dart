import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../cores/constants/app_colors.dart';

class TaskCard extends GetView {
  final String title;
  final String content;
  final String createTime;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.title,
    required this.content,
    required this.createTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        content,
                        style: Theme.of(context).textTheme.subtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  Text(
                    createTime,
                    style: Theme.of(context).textTheme.overline,
                  ),
                ]),
          )),
    );
  }
}
