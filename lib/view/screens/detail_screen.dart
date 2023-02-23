// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:flutter_app_challenge/model/constant/colors_list.dart';
import 'package:flutter_app_challenge/model/widgets/bullets.dart';

class OwnerDetailScreen extends StatelessWidget {
  OwnerDetailScreen({super.key, required this.appChalModel});
  FlutterAppChalModel appChalModel = FlutterAppChalModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text(appChalModel.name!),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  imageUrl: appChalModel.owner!.avatarUrl!,
                ),
              ),
            ),
            //===================================//
            _rowBulletTextView(
              context: context,
              title: "Owner Info:",
            ),
            _rowText(context, "Owner ID:", appChalModel.owner!.id.toString()),
            _rowText(
                context, "Node ID:", appChalModel.owner!.nodeId.toString()),
            _linkText(
                context: context,
                text: "Avater",
                url: appChalModel.owner!.avatarUrl!),
            _linkText(
                context: context,
                text: "Repo Url",
                url: appChalModel.owner!.avatarUrl!),
            //===================================//
          ],
        ),
      ),
    );
  }

  int _randomIntForColor() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    return randomNumber;
  }

  Padding _rowBulletTextView({
    required BuildContext context,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: MyBullet(color: myColorList[_randomIntForColor()]),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding _rowText(BuildContext context, String title, String text) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkText(
      {required BuildContext context,
      required String text,
      required String url}) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              "$text:",
              overflow: TextOverflow.fade,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          //===//
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
