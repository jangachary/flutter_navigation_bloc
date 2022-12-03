import 'package:flutter/material.dart';
import 'package:flutter_navigation_bloc/screens/animation_holder.dart';
import 'package:getwidget/getwidget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return AnimationHolder(
      child: Column(
        children: const [
          GFCard(
            boxFit: BoxFit.cover,
            // image: Image.asset('your asset image'),
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              title: Text('Card Title'),
              subTitle: Text('Card Sub Title'),
            ),
            content: Text("Some quick example text to build on the card"),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            // image: Image.asset('your asset image'),
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              title: Text('Card Title'),
              subTitle: Text('Card Sub Title'),
            ),
            content: Text("Some quick example text to build on the card"),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            // image: Image.asset('your asset image'),
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              title: Text('Card Title'),
              subTitle: Text('Card Sub Title'),
            ),
            content: Text("Some quick example text to build on the card"),
          ),
        ],
      ),
    );
  }
}
