import 'package:anime_library/widgets/button-purple.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFF100E19),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, top: 50, bottom: 50, right: 50),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF1F1B2E),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                child: ProfileLeftBlock(),
                width: 260,
                decoration: BoxDecoration(
                    color: Color(0xFF1F1B2E),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF100E19),
                        borderRadius: BorderRadius.circular(20)),
                    width: 500,
                  ),
                ),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFF100E19),
                    borderRadius: BorderRadius.circular(10)),
                child: ProfileRightBlockChat(),
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
            children: [
              BurgerMenu(),
              SizedBox(
                width: 7,
              ),
              SearchBarChat(),
              SizedBox(width: 7),
              UpBarChat(),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ButtonAddfriend(),
        SizedBox(
          height: 8,
        ),
        LikedFriendsLine(
            text: 'Избранные друзья',
            color: Color(0xFF742F85).withOpacity(0.15)),
        Friend(
          nickname: 'Сквильям',
          avatar: 'assets/images/avatar.png',
        ),
        LikedFriendsLine(
            text: 'Друзья', color: Color(0xFF645BA3).withOpacity(0.1)),
        Expanded(child: ScrollFriendChat())
      ],
    );
  }
}

class ScrollFriendChat extends StatefulWidget {
  const ScrollFriendChat({Key? key}) : super(key: key);

  @override
  State<ScrollFriendChat> createState() => _ScrollFriendChatState();
}

class _ScrollFriendChatState extends State<ScrollFriendChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 359,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
                primary: true,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Friend(
                      nickname: 'Пупок', avatar: "assets/images/avatar.png");
                }),
          ),
        ),
      ],
    );
  }
}

class Friend extends StatefulWidget {
  final String avatar;
  final String nickname;

  const Friend({
    required this.nickname,
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  late bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 359,
      decoration: selected
          ? BoxDecoration(
              color: Color(0xFF645BA3),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF161226).withOpacity(0.99),
                  Color(0xFF161226).withOpacity(0.5),
                ],
              ),
            )
          : null,
      child: MouseRegion(
        onEnter: (select) {
          setState(() => {selected = true});
        },
        onExit: (select) {
          setState(() => {selected = false});
        },
        child: Row(
          children: [
            SizedBox(
              width: 1,
            ),
            selected
                ? Container(
                    height: 70,
                    width: 2,
                    color: Color(
                      0xFF645BA3,
                    ))
                : SizedBox(
                    height: 70,
                    width: 2,
                  ),
            // Container(
            //   child: Icon(Icons.arrow_right, size: 40),
            //   padding: EdgeInsets.zero,
            // ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 17, right: 17, top: 5, bottom: 5),
              child: Image.asset(
                widget.avatar,
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 13,
              ),
              Text(widget.nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  )),
              SizedBox(
                height: 2,
              ),
              Text(
                'В сети',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: Color(0xFF24A703),
                ),
              )
            ]),
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
        child: Row(children: [
          SizedBox(
            width: 19,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          )
        ]),
        height: 30,
        width: 358,
        color: color);
  }
}

class ButtonAddfriend extends StatelessWidget {
  const ButtonAddfriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonPurple(
        onPressed: () {}, buttonText: 'Добавить друга', width: 320, height: 36);
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
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1F1B2E)),
      child: Stack(children: [
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
      ]),
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
          color: Color(0xFF645BA3),
        ),
      ),
      child: TextInputField(hintText: 'Поиск', onChanged: (w) {}),
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
      decoration:
          const BoxDecoration(color: Color(0xFF1F1B2E), shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF645BA3)),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF645BA3)),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF645BA3)),
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
                  boxShadow: [
                    BoxShadow(color: Color(0xFF24A703), blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
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
        const SizedBox(
          height: 15,
        ),
        Text('Squilliam Fancyson',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFFFFFFFF),
                fontFamily: 'Montserrat')),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFE81F54)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text('Мой баланс',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color(0xFFFFFFFF).withOpacity(0.6),
            )),
        SizedBox(
          height: 5,
        ),
        Text('\$9,420.321',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFFFFFFFF),
            )),
        SizedBox(
          height: 52,
        ),
        NavBarListProfile(text: 'Активность'),
        NavBarListProfile(text: 'Достижения'),
        NavBarListProfile(text: 'Покупки'),
        NavBarListProfile(text: 'Настройки'),
        Expanded(child: SizedBox(height: 240)),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60, bottom: 40),
              child: Text('Выход',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat')),
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
        Container(height: 50, width: 4, color: Color(0xFFE81F54)),
        Container(
          width: 256,
          height: 46,
          padding: EdgeInsets.only(left: 58),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFE81F54).withOpacity(0.1),
                Color(0xFF1F1B2E).withOpacity(0)
              ],
            ),
          ),
          child: Text(text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFFFFFFFF).withOpacity(0.8),
              )),
        ),
      ],
    );
  }
}
