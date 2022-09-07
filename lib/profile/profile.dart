import 'package:anime_library/profile/profile_store.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileStore profileStore = ProfileStore();

  @override
  void initState() async {
    await profileStore.getProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
