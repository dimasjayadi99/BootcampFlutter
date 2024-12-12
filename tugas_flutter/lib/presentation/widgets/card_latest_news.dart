import 'package:flutter/material.dart';
import 'package:tugas_flutter/domain/entities/news_entity.dart';
import '../../shared/gap.dart';

class CardLatestNews extends StatelessWidget {
  final NewsEntity newsEntity;

  const CardLatestNews({super.key, required this.newsEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                newsEntity.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap.h(w: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
