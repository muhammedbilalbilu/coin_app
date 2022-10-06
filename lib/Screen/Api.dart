import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:coin_app/Screen/Apiadd.dart';
import 'package:coin_app/Screen/coin.dart';
import 'package:coin_app/responsive/coincared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import '../widgets/colors.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List<Post>? posts;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    setState(() {
      isLoaded = true;
    });
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.grey[300],
              title: Text(
                'CRYPTOBASE',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: isLoaded
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: posts?.length,
                    itemBuilder: (context, index) {
                      return CoinCart(
                        name: posts![index].name,
                        symbol: posts![index].symbol,
                        image: posts![index].image,
                        currentPrice: posts![index].currentPrice,
                        priceChange24H: posts![index].priceChange24H.toDouble(),
                        priceChangePercentage24H:
                            posts![index].priceChangePercentage24H.toDouble(),
                      );
                    },
                  )));
  }
}
