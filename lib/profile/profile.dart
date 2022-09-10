import 'package:anime_library/profile/profile_store.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  late String username;
  Profile({Key? key, required this.username}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileStore profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
    profileStore.getProfiles(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
