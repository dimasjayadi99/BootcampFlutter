import 'package:flutter/cupertino.dart';

import '../../../../shared/gap.dart';

class CardUser extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  const CardUser(
      {super.key,
      required this.image,
      required this.email,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          ClipOval(
              child: Image.network(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          )),
          const Gap.h(w: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const Gap.v(h: 4),
              Text(email),
            ],
          )
        ],
      ),
    );
  }
}
