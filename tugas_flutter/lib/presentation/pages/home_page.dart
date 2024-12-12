import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/domain/entities/news_entity.dart';
import 'package:tugas_flutter/presentation/pages/detail_news_page.dart';
import 'package:tugas_flutter/presentation/widgets/card_banner_news.dart';
import 'package:tugas_flutter/presentation/widgets/card_latest_news.dart';
import 'package:tugas_flutter/shared/gap.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  /// data dummy for the latest news list
  final List<NewsEntity> listNews = [
    NewsEntity(
      category: 'Technology',
      title: 'Insurtech startup PasarPolis gets \$54 million — Series B',
      image: newsImage1,
      createdAt: 30,
      author: 'Dimas Jayadi',
      description:
          'PasarPolis, a leading insurtech startup, has successfully raised \$54 million in its Series B funding round. The company plans to use this funding to further expand its digital insurance solutions across Southeast Asia, making insurance more accessible and affordable for millions of users. This marks a significant milestone in the startup’s journey as it continues to transform the insurance industry with innovative technology.',
    ),
    NewsEntity(
      category: 'Technology',
      title: 'The IPO parade continues as Wish files, Bumble targets',
      image: newsImage2,
      createdAt: 50,
      author: 'Samuel Newton',
      description:
          'The IPO frenzy in the tech world shows no signs of slowing down as major companies like Wish and Bumble gear up to go public. Wish, the popular e-commerce platform, and Bumble, a dating app that empowers women, are expected to bring significant attention to the market with their upcoming offerings. These IPOs highlight the growing interest in consumer tech companies amid a strong rebound in the stock market.',
    ),
    NewsEntity(
      category: 'Technology',
      title: 'Hypatos gets \$11.8M for a deep learning approach',
      image: newsImage3,
      createdAt: 50,
      author: 'Cristiano Ronaldo',
      description:
          'Hypatos, a startup specializing in deep learning solutions, has raised \$11.8 million to advance its data processing technology. The company focuses on automating complex back-office processes, such as invoice processing and financial document handling, by leveraging state-of-the-art deep learning models. This funding will enable Hypatos to expand its reach and further enhance its cutting-edge solutions, revolutionizing the way businesses handle data.',
    ),
    NewsEntity(
      category: 'Technology',
      title:
          'Adobe forecasts fiscal 2025 revenue below estimates on slower subscription spending',
      image: newsImage4,
      createdAt: 50,
      author: 'Lionel Messi',
      description:
          'Adobe has announced a cautious revenue forecast for fiscal 2025, citing a slowdown in subscription spending among its customer base. Despite the challenges, the company remains committed to driving growth through its popular Creative Cloud and Document Cloud services. Analysts believe that Adobe’s ability to innovate and adapt to market demands will play a critical role in navigating this period of slower-than-expected growth.',
    ),
    NewsEntity(
      category: 'Sports',
      title:
          'Saka denied a first Arsenal hat trick by his own teammate in Champions League win',
      image: newsImage5,
      createdAt: 50,
      author: 'John Cena',
      description:
          'Arsenal star Bukayo Saka showcased his exceptional talent during the team’s recent Champions League victory. Despite his outstanding performance, Saka was denied his first hat trick by an unexpected block from his own teammate. The match highlighted Saka’s growing influence on the field and solidified his reputation as one of the Premier League’s most promising young players. Fans and pundits alike continue to praise his skills and sportsmanship.',
    ),
  ];

  void goToDetail(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailNewsPage(newsEntity: listNews[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildBanner(),
                const Gap.v(h: 32),
                _buildLatestNews(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// build app bar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Text(
        'NewsApp',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      leading: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            menuIconPath,
            width: 40,
            height: 40,
          )),
    );
  }

  /// build a horizontal news banner list
  _buildBanner() {
    return SizedBox(
      width: double.infinity,
      height: 311,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                goToDetail(context, index);
              },
              child: CardBannerNews(newsEntity: listNews[index]));
        },
        separatorBuilder: (context, index) => const Gap.h(
          w: 16,
        ),
        itemCount: listNews.length,
      ),
    );
  }

  /// build a vertical news list
  _buildLatestNews(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Latest News',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey)),
            const Spacer(),
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.grey,
            ),
          ],
        ),
        const Gap.v(h: 16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  goToDetail(context, index);
                },
                child: CardLatestNews(newsEntity: listNews[index]));
          },
          separatorBuilder: (context, index) => const Gap.v(h: 8),
          itemCount: listNews.length,
        ),
      ],
    );
  }
}
