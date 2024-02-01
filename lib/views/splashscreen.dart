import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vibes/constant/colours.dart';
// import 'package:music_player/controller/SplaceScreenController.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SplaceScreenController splaceScreenController = Get.put(SplaceScreenController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset("assets/icons/LOGO.png"),
              SizedBox(height: 100,),
              Text("Ecommerce", style: TextStyle(
                  fontSize: 22
              ),)
            ],
          ),
        ),
      ),
    );
  }
}