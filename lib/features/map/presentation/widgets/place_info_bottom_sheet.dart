import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceInfoBottomSheet extends StatelessWidget {
  const PlaceInfoBottomSheet({super.key, required this.onClose});

  final void Function() onClose;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 0.2) {
          onClose();
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 13,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xffABABAB),
                  ),
                ),
                Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
