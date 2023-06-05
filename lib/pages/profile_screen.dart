import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genielogiciel/controllers/auth_controller.dart';
import 'package:genielogiciel/controllers/profile_controller.dart';
import 'package:genielogiciel/utils/constants.dart';
import 'package:genielogiciel/utils/theme.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor),
    );
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    String? name = AuthController.instance.user!.displayName ?? "NO Name";
    String? email = AuthController.instance.user!.email;
    String? mobile = AuthController.instance.user!.phoneNumber ?? "0000000000";
    mobileController.text = mobile;
    nameController.text = name;
    emailController.text = email.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 150.0,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: MyTheme.appBarColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text('Name'),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            readOnly: ProfileController.instance.isEdit.value,
                            initialValue: name,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color(0xFFE4EDFF),
                                  ),
                                  child: const Icon(
                                    Icons.person_outline_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text('Email'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          initialValue: email,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xFFE8D8FF),
                                ),
                                child: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFFCC80EA),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text('Mobile'),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            initialValue: mobile,
                            readOnly: ProfileController.instance.isEdit.value,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color(0xFFCCEFE0),
                                  ),
                                  child: const Icon(
                                    Icons.phone_android_outlined,
                                    color: Color(0xFF48EB9F),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: MyTheme.greyColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('DOCUMENTATION'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: const Icon(
                            Icons.privacy_tip_outlined,
                            size: 20,
                          ),
                          title: const Text(
                            'Privacy Policy',
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: const Icon(
                            Icons.share,
                            size: 20,
                          ),
                          title: const Text(
                            'Share',
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout_outlined,
                            size: 20,
                            color: Colors.red,
                          ),
                          title: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            AuthController.instance.signOut();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 90.0,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: picUrl,
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170.0,
              left: MediaQuery.of(context).size.width * 0.5 + 20,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: MyTheme.appBarColor,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
