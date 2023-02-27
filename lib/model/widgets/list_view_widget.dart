// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:flutter_app_challenge/model/widgets/date_formatter.dart';


//==============Custom Widget for showing data in ListView=================//
class ListWidgetUser extends StatelessWidget {
  ListWidgetUser({super.key, required this.chalModel});
  FlutterAppChalModel chalModel = FlutterAppChalModel();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _cachedImage(url: chalModel.owner!.avatarUrl!),
      title: Text("Onwer: ${chalModel.name!}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customText(
            title: "Repo name:",
            text: chalModel.name!,
            titleColor: Colors.pink,
          ),
          _customText(
            title: "Created at:",
            text: convertToDMY(chalModel.createdAt!),
            titleColor: Colors.green,
          )
        ],
      ),
    );
  }

  //=================Cached image for Avater===============//
  CachedNetworkImage _cachedImage({required String url}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: 40,
      width: 40,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.red,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Padding _customText({
    required String title,
    required String text,
    required Color titleColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
