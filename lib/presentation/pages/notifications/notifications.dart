import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';

@RoutePage()
class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  State<HeartScreen> createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> newNotifs = [
      {
        'photo': photosPath('notif_pp.png'),
        'username': 'karenne',
        'notif_type': 'like',
        'time': '1h',
        'liked_photo': photosPath('liked_photo.png'),
        'text': 'liked your photo.'
      }
    ];
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryInputColor,
            title: const Text(
              'Notifications',
              style: TextStyle(color: primaryBlackColor),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Text(
                  'Following requests',
                  style: TextStyle(fontSize: notificationsFontSize.w),
                ),
              ),
              GreyLine(
                sizeRate: 1,
                customColor: Colors.grey.shade300,
              ),
              ListTile(
                leading: Text(
                  'New',
                  style: TextStyle(
                      fontSize: notificationsFontSize.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var notif = newNotifs[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(notif['photo']),
                    ),
                    title: Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(
                            style: const TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  text: notif['username']),
                              const TextSpan(text: ' '),
                              TextSpan(text: notif['text']),
                              TextSpan(
                                  style:
                                      const TextStyle(color: primaryGreyColor),
                                  text: notif['time'])
                            ])),
                    trailing: Image.asset(
                      photosPath('liked_photo.png'),
                      width: 50.w,
                      height: 50.h,
                    ),
                  );
                },
                itemCount: newNotifs.length,
              )
            ],
          ),
        ));
  }
}
