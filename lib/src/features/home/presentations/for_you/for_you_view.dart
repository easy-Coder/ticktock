import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForYouView extends ConsumerWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        ColoredBox(color: Colors.blueGrey),
        ColoredBox(color: Colors.brown),
        ColoredBox(color: Colors.red),
        ColoredBox(color: Colors.indigo),
        ColoredBox(color: Colors.white),
      ],
    );
  }
}
