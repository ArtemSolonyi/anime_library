import 'package:anime_library/widgets/button-purple.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100E19),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, top: 50, bottom: 50, right: 50),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1B2E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 260,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1B2E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const ProfileLeftBlock(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: const Color(0xFF100E19),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Container(
                width: 360,
                decoration: BoxDecoration(
                  color: const Color(0xFF100E19),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ProfileRightBlockChat(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRightBlockChat extends StatefulWidget {
  const ProfileRightBlockChat({Key? key}) : super(key: key);

  @override
  State<ProfileRightBlockChat> createState() => _ProfileRightBlockChatState();
}

class _ProfileRightBlockChatState extends State<ProfileRightBlockChat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 7, right: 7),
          child: Row(
            children: const [
              BurgerMenu(),
              SizedBox(width: 7),
              SearchBarChat(),
              SizedBox(width: 7),
              UpBarChat(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const ButtonAddfriend(),
        const SizedBox(height: 8),
        LikedFriendsLine(
          text: 'Избранные друзья',
          color: const Color(0xFF742F85).withOpacity(0.15),
        ),
        const Friend(
          nickname: 'Сквильям',
          avatar: 'assets/images/avatar.png',
        ),
        LikedFriendsLine(
          text: 'Друзья',
          color: const Color(0xFF645BA3).withOpacity(0.1),
        ),
        const Expanded(child: ScrollFriendChat())
      ],
    );
  }
}

class ScrollFriendChat extends StatelessWidget {
  const ScrollFriendChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.builder(
        primary: true,
        itemCount: 15,
        itemBuilder: (context, i) => const Friend(
          nickname: 'Пупок',
          avatar: "assets/images/avatar.png",
        ),
      ),
    );
  }
}

class Friend extends HookWidget {
  final String avatar;
  final String nickname;

  const Friend({
    Key? key,
    required this.nickname,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = useState(false);
    return Container(
      height: 70,
      width: 359,
      decoration: selected.value
          ? BoxDecoration(
              color: const Color(0xFF645BA3),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xFF161226).withOpacity(0.99),
                  const Color(0xFF161226).withOpacity(0.5),
                ],
              ),
            )
          : null,
      child: MouseRegion(
        onEnter: (_) => selected.value = true,
        onExit: (_) => selected.value = false,
        child: Row(
          children: [
            const SizedBox(width: 1),
            Container(
              height: 70,
              width: 2,
              color: selected.value ? const Color(0xFF645BA3) : null,
            ),
            // Container(
            //   child: Icon(Icons.arrow_right, size: 40),
            //   padding: EdgeInsets.zero,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 5, bottom: 5),
              child: Image.asset(avatar),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 13),
                Text(
                  nickname,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'В сети',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF24A703),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LikedFriendsLine extends StatelessWidget {
  final String text;
  final Color color;

  const LikedFriendsLine({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 358,
      color: color,
      child: Row(
        children: [
          const SizedBox(width: 19),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class ButtonAddfriend extends StatelessWidget {
  const ButtonAddfriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonPurple(
      buttonText: 'Добавить друга',
      width: 320,
      height: 36,
      onPressed: () {},
    );
  }
}

class UpBarChat extends StatelessWidget {
  const UpBarChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1F1B2E),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 7,
            top: 4.5,
            child: SvgPicture.asset(
              height: 30,
              width: 30,
              fit: BoxFit.fitWidth,
              'assets/images/MessageIcon.svg',
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarChat extends StatelessWidget {
  const SearchBarChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF645BA3),
        ),
      ),
      child: TextInputField(
        hintText: 'Поиск',
        onChanged: (w) {},
      ),
    );
  }
}

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF1F1B2E),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xFF645BA3),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xFF645BA3),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xFF645BA3),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileLeftBlock extends StatelessWidget {
  const ProfileLeftBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 11,
                width: 24,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Color(0xFF24A703), blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xFF2FD206), Color(0xFF79E75D)],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(53),
            border: Border.all(color: const Color(0xFFE81F54), width: 3),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(53),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Image.asset(
              'assets/images/avatar.png',
              height: 100,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Squilliam Fancyson',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xFFE81F54),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text('Мой баланс',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: const Color(0xFFFFFFFF).withOpacity(0.6),
            )),
        const SizedBox(height: 5),
        const Text(
          '\$9,420.321',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 52),
        const NavBarListProfile(text: 'Активность'),
        const NavBarListProfile(text: 'Достижения'),
        const NavBarListProfile(text: 'Покупки'),
        const NavBarListProfile(text: 'Настройки'),
        const Expanded(child: SizedBox(height: 240)),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60, bottom: 40),
              child: Text(
                'Выход',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class NavBarListProfile extends StatelessWidget {
  final String text;

  const NavBarListProfile({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 4,
          color: const Color(0xFFE81F54),
        ),
        Container(
          width: 256,
          height: 46,
          padding: const EdgeInsets.only(left: 58),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color(0xFFE81F54).withOpacity(0.1),
                const Color(0xFF1F1B2E).withOpacity(0),
              ],
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xFFFFFFFF).withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
