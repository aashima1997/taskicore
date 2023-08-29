

import 'package:flutter/material.dart';
import 'package:taskicore/ReasponseModel/listResponse.dart';

import 'customWidgets.dart';

class ListDetailScreen extends StatefulWidget {
  const ListDetailScreen({Key? key,required this.details}) : super(key: key);
  final ListResponse details;
  @override
  State<ListDetailScreen> createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: () => onBackPressed(context),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                title:  Text(
                  widget.details!.userId!.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.blue,
              ),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:
                              Text(
                                "ID:${widget.details!.id!}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ), ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:
                              Text(
                               widget.details!.title!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ), ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:
                              Text(
                                widget.details!.body!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    ),
                              ), ),

    ]))))));
  }
}

