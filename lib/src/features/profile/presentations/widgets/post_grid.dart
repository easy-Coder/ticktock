import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostGrid extends ConsumerWidget {
  const PostGrid({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        mainAxisExtent: 182.h,
      ),
      itemBuilder: (BuildContext context, int index) => Container(
        decoration: const ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/137x182"),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.41,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
