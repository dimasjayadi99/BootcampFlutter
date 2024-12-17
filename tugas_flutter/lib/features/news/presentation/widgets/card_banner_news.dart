import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/string.dart';
import '../../../../shared/gap.dart';
import '../../domain/entities/news_entity.dart';

class CardBannerNews extends StatelessWidget {
  final NewsEntity newsEntity;
  const CardBannerNews({super.key, required this.newsEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 311,
          height: 311,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(newsEntity.image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
        ),
        Container(
          width: 311,
          height: 311,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(newsEntity.category.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(whiteColor))),
                    const Spacer(),
                    Text('${newsEntity.createdAt} min ago',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: const Color(whiteColor),
                            ))
                  ],
                ),
                const Spacer(),
                Text(
                  newsEntity.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(whiteColor),
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap.v(
                  h: 32,
                ),
                Row(
                  children: [
                    Image.asset(messageIconPath),
                    const Gap.h(w: 24),
                    Image.asset(favoriteIconPath),
                    const Spacer(),
                    Image.asset(shareIconPath),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
