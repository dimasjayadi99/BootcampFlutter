import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/shared/gap.dart';
import '../../domain/entities/news_entity.dart';

class DetailNewsPage extends StatelessWidget {
  final NewsEntity newsEntity;
  const DetailNewsPage({super.key, required this.newsEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _buildContent(context),
          ),

          // custom app bar
          _buildCustomBar(context),
        ],
      ),
    );
  }

  /// private widget custom app bar
  _buildCustomBar(BuildContext context) {
    return Positioned(
      top: 56,
      left: 16,
      right: 16,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(blackColor).withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(whiteColor),
                ),
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(blackColor).withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(favoriteIconPath),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// private widget content
  _buildContent(BuildContext context) {
    return Column(
      children: [
        // Image Preview
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 375,
            child: Image.asset(
              newsEntity.image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Creator
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      defaultAvatarPath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap.h(w: 16),
                  Text(newsEntity.author),
                ],
              ),
              const Gap.v(h: 32),

              // Detail Content
              Text(
                newsEntity.category.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const Gap.v(h: 8),
              Text(
                newsEntity.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap.v(h: 16),
              Text(
                'publish at ${newsEntity.createdAt} minutes ago',
                style: const TextStyle(fontSize: 12),
              ),
              const Gap.v(h: 32),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              const Gap.v(h: 32),
              Text(
                newsEntity.description,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
