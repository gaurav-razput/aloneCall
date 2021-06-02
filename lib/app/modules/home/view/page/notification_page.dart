import 'dart:convert';

import 'package:alonecall/app/data/model/history_model.dart';
import 'package:alonecall/app/data/repository/repository_method.dart';
import 'package:alonecall/app/global_widgets/circular_photo.dart';
import 'package:alonecall/app/theme/colors_value.dart';
import 'package:alonecall/app/theme/dimens.dart';
import 'package:alonecall/app/theme/styles.dart';
import 'package:alonecall/app/utils/asset_constants.dart';
import 'package:alonecall/app/utils/string_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                StringConstants.notification,
                style: Styles.boldWhite20,
              ),
              backgroundColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: StreamBuilder(
                stream: Repository().notificationStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView(
                      children: List.generate(
                          15,
                          (index) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  width: Dimens.screenWidth,
                                  height: Dimens.fifty,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetConstants.loading,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )),
                    );
                  }
                  return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                    var model = HistoryModel.fromJson(
                        document.data() as Map<String, dynamic>);
                    if (model.receiverUid == Repository().uid &&
                        model.callDuration == 0.0) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: Dimens.screenWidth,
                          height: Dimens.fifty,
                          child: Row(
                            children: [
                              Container(
                                height: Dimens.fifty,
                                width: Dimens.fifty,
                                decoration: BoxDecoration(
                                    color: ColorsValue.lightGreyColor,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.fifty)),
                                child: circularPhoto(
                                    imageUrl:
                                        model.callerUid == Repository().uid
                                            ? model.receiverImage
                                            : model.callerImage),
                              ),
                              SizedBox(
                                width: Dimens.ten,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        model.isAudio
                                            ? Text(
                                                'Missed Audio Call from ${model.callerName}',
                                                style: Styles.blackBold16)
                                            : Text(
                                                'Missed Video Call from ${model.callerName}',
                                                style: Styles.blackBold16),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 2, 0, 0),
                                          child: Icon(
                                            model.isAudio
                                                ? Icons.phone
                                                : Icons.videocam,
                                            size: Dimens.sixTeen,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call_missed,
                                          size: Dimens.sixTeen,
                                          color: Colors.red,
                                        ),
                                        Text(
                                            ' ${DateTime.parse(model.date.toDate().toString())}'
                                                .substring(0, 17),
                                            style: Styles.black12),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }).toList());
                })),
      );
}
