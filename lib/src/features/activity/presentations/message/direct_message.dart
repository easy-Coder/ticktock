import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';

class DirectMessageScreen extends StatelessWidget {
  const DirectMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF161722),
        title: Text(
          "Direct Message",
          style: TextStyle(
            color: const Color(0xFF161722),
            fontSize: 17.sp,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Color(0xFF161722),
            ),
          ),
        ],
        elevation: 0.1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.svg.messageStrokeIcon.svg(
              width: 68,
              height: 68,
              colorFilter:
                  const ColorFilter.mode(Color(0xffB0B0B3), BlendMode.srcIn),
            ),
            SizedBox(
              height: 12.h,
            ),
            const Text(
              'Message your friends',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF161722),
                fontSize: 17,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            const Text(
              'Share videos or start a conversation',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7C7D83),
                fontSize: 14,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
