import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskicore/ReasponseModel/listResponse.dart';

import 'ListDetailScreen.dart';
import 'ReasponseModel/exception.dart';
import 'customWidgets.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {

  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<ListResponse>? listResponse;
  String baseUrl="https://jsonplaceholder.typicode.com/posts";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () => onBackPressed(context),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'API List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.blue,
              ),
              body: FutureBuilder(
                  future: ListResponseDownload(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                          child: Lottie.asset(
                            "images/coffeeLoading.json",
                          ));
                    }
                    else if (snapshot.data==null) {
                      return TryAgainButton(
                        onPressed: ()  {
                          setState(()  {
                          });
                        },
                      );
                    }
                    else if (snapshot.data == null) {
                      return TryAgainButton(
                        onPressed: () {
                          setState(() {});
                        },
                      );
                    } else {
                      var list=listResponse!;
                      if (list.isEmpty) {
                        return Column(
                          children: [
                            Lottie.asset("images/coffeeLoading.json"),
                            const Text(
                              "No Data Found",
                              style: TextStyle(
                                  fontSize: 17, fontStyle: FontStyle.italic),
                            )
                          ],
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(5),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: listResponse!.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              final user = listResponse![index];
                              return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ListDetailScreen(
                                                  details: user))),
                                  child: Card(
                                    elevation: 3,
                                    child: Row(children: <Widget>[

                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          user.userId!.toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                              Flexible(
                             child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          user.title!,
                                          softWrap: false,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),

                                      )
                              )]),
                                  ));
                            },
                          ),
                        );
                      }
                    }
                  })),
        ));
  }

  Future<List<ListResponse>?> ListResponseDownload() async {
    var  listRes=http.Client();
    var data;
    try {
      var url=Uri.parse(baseUrl);

      var response = await listRes.get(url);
      if(response.statusCode==200){
      data = response.body;
      print("KnowledgerevNo $data");
      listResponse=postFromJson(data);
    } }catch (e) {
      print(e);
    }

    return postFromJson(data)!;
  }
   /* var  listResponse1;

      var response = await callApi(
          context: context, url:baseUrl, isGetMethod: true);
      listResponse1 = response.data;
      print("KnowledgerevNo $listResponse1");

    return postFromJson(listResponse1)!;
  }*/

callApi({
  bool?isGetMethod,
  required BuildContext context,required String url,int? connectTimeout,int?receiveTimeout,dynamic data} )async {
  BaseOptions options = BaseOptions(
    baseUrl: url,
    connectTimeout: connectTimeout ?? 100000,
    receiveTimeout: receiveTimeout ?? 100000,
  );
  Dio dio = Dio(options);
  try {
    Response response = isGetMethod == null || !isGetMethod ? await dio.post(
        url, data: data) : await dio.get(url);
    return response;

  } on DioError catch (e) {
    print("ASDFG ${e.error}");
    String dioExceptions = DioExceptions
        .fromDioError(e)
        .message;
    return errordialog(context,"Error", dioExceptions);
  }
}}
