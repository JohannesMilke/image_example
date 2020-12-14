import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlImage =
        'https://images.unsplash.com/photo-1607285179635-dd06da10eac1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzZ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
    final urlImage2 =
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80';

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Center(
          child: Image.network(
            urlImage,
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : Container(
                    height: 400,
                    width: 400,
                    child: Center(child: CircularProgressIndicator()),
                  ),
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        CircleAvatar(
          child: ClipOval(
            child: Image.network(
              urlImage2,
              width: 240,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          radius: 120,
        ),
        const SizedBox(height: 16),
        CircleAvatar(
          backgroundImage: NetworkImage(urlImage2),
          radius: 120,
        ),
      ],
    );
  }
}
