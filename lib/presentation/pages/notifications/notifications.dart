import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';
import 'package:instagram_clone/presentation/pages/notifications/widgets/title.dart';

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
              const TitleWidget(text: 'New'),
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
              ),
              SizedBox(
                height: 20.h,
              ),
              GreyLine(
                sizeRate: 1,
                customColor: Colors.grey.shade300,
              ),
              const TitleWidget(text: 'Today'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 54,
                      height: 54.h,
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage(photosPath('notif-pp-1.png')),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage(photosPath('notif-pp-2.png')),
                          ),
                        ),
                      ]),
                    ),
                    title: const Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(style: TextStyle(fontSize: 15), children: [
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: 'kiero_d, zackjhon'),
                          TextSpan(text: ' and '),
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: '36 others'),
                          TextSpan(text: ' liked your photo'),
                          TextSpan(
                              style: TextStyle(color: primaryGreyColor),
                              text: ' 3h')
                        ])),
                    trailing: Image.asset(
                      photosPath('liked_photo.png'),
                      width: 50.w,
                      height: 50.h,
                    ),
                  );
                },
                itemCount: newNotifs.length,
              ),
              SizedBox(
                height: 20.h,
              ),
              GreyLine(
                sizeRate: 1,
                customColor: Colors.grey.shade300,
              ),
              const TitleWidget(text: 'This week'),
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(photosPath('notif-pp-3.png')),
                    ),
                    title: const Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(style: TextStyle(fontSize: 15), children: [
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: 'craig_love '),
                          TextSpan(text: 'mentioned you in a comment: '),
                          TextSpan(
                              style: TextStyle(color: primaryBlueTextColor),
                              text: '@jacob_w '),
                          TextSpan(text: 'exactly... '),
                          TextSpan(
                              style: TextStyle(color: primaryGreyColor),
                              text: '2d')
                        ])),
                    trailing: Image.asset(
                      photosPath('liked_photo_2.png'),
                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(photosPath('notif-pp-4.png')),
                    ),
                    title: const Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(style: TextStyle(fontSize: 15), children: [
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: 'martini_rond '),
                          TextSpan(text: 'started following you '),
                          TextSpan(
                              style: TextStyle(color: primaryGreyColor),
                              text: '3d')
                        ])),
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(110, 10),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade400),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Message',
                          style: TextStyle(
                              color: primaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(photosPath('notif-pp-5.png')),
                    ),
                    title: const Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(style: TextStyle(fontSize: 15), children: [
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: 'max_jacobson '),
                          TextSpan(text: 'started following you '),
                          TextSpan(
                              style: TextStyle(color: primaryGreyColor),
                              text: '3d')
                        ])),
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(110, 10),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade400),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Message',
                          style: TextStyle(
                              color: primaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(photosPath('notif-pp-6.png')),
                    ),
                    title: const Text.rich(
                        overflow: TextOverflow.visible,
                        TextSpan(style: TextStyle(fontSize: 15), children: [
                          TextSpan(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              text: 'mis_potter '),
                          TextSpan(text: 'started following you '),
                          TextSpan(
                              style: TextStyle(color: primaryGreyColor),
                              text: '3d')
                        ])),
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(110, 10),
                          elevation: 0,
                          backgroundColor: primaryBlueButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade400),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
