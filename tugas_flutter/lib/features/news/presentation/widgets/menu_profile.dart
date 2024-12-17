import 'package:flutter/material.dart';

import '../../../../shared/gap.dart';

class MenuProfile extends StatelessWidget {
  final String title;
  final String label;
  final IconData icon;
  final void Function(BuildContext context) onTap;

  const MenuProfile({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Icon(icon),
            ),
            const Gap.h(w: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyMedium),
                const Gap.v(h: 8),
                Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
