import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:unsplash_ui/app/data/userdata.dart';
import 'package:unsplash_ui/app/modules/home/views/widgets/custom_card.dart';
import 'package:unsplash_ui/app/modules/home/views/widgets/custom_searchbar.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/logos/Logo.svg"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 40,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Discover, collect, and sell",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Your Digital Art",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0), child: CustomSearchbar()),
            ElevatedButton(
              onPressed: () {
                homeController.onload();
              },
              child: const Text("Load Data"),
            ),
            // homeController.loaded.isTrue
            //     ? Column(
            //         children: [
            //           CustomCard(
            //               imagetitle: usersData[0].userName.toString(),
            //               imageUrl: usersData[0].imageUrl.toString(),
            //               profileImage: usersData[0].userProfileUrl.toString(),
            //               imageLikes: usersData[0].likes),
            //           CustomCard(
            //               imagetitle: usersData[1].userName.toString(),
            //               imageUrl: usersData[1].imageUrl.toString(),
            //               profileImage: usersData[1].userProfileUrl.toString(),
            //               imageLikes: usersData[1].likes),
            //           CustomCard(
            //               imagetitle: usersData[2].userName.toString(),
            //               imageUrl: usersData[2].imageUrl.toString(),
            //               profileImage: usersData[2].userProfileUrl.toString(),
            //               imageLikes: usersData[2].likes),
            //           CustomCard(
            //               imagetitle: usersData[3].userName.toString(),
            //               imageUrl: usersData[3].imageUrl.toString(),
            //               profileImage: usersData[3].userProfileUrl.toString(),
            //               imageLikes: usersData[3].likes),
            //         ],
            //       )
            //     : const Text("No data available to load"),

            if (homeController.loaded.isTrue)
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: usersData.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        imagetitle: usersData[index].userName.toString(),
                        imageUrl: usersData[index].imageUrl.toString(),
                        profileImage:
                            usersData[index].userProfileUrl.toString(),
                        imageLikes: usersData[index].likes,
                      );
                    }),
              )
          ],
        ),
      ),
    );
  }
}
