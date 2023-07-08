import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowingView extends ConsumerWidget {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        ColoredBox(color: Colors.blue),
        ColoredBox(color: Colors.green),
        ColoredBox(color: Colors.yellow),
        ColoredBox(color: Colors.grey),
        ColoredBox(color: Colors.lime),
      ],
    );
  }
}
