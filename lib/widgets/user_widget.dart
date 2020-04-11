import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  String avatarUrl;
  String title;
  String subtitle;
  Function onTap;

  UserWidget({
    this.avatarUrl =
        'https://media-exp1.licdn.com/dms/image/C4E03AQHC8qKsCnifOQ/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=5EbleMBEmXR55pb8zMDjuzd_V3U2884ZfSA0k-G8tCk',
    this.title = 'Elioenai Ferrari',
    this.subtitle = 'Elioenai Ferrari',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  offset: Offset(-10, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.black26,
                      ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: -25,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(
              avatarUrl,
            ),
          ),
        )
      ],
    );
  }
}
