import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/game_store.dart';
import 'package:quiz/main.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.gameStore});

  GameStore gameStore;

  get onPressed => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameStore.name),
      ),
      body: Column(
        children: [
          Text('${gameStore.name}'),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: gameStore.imageUrls.length,
                itemBuilder: (context, index) => Image.network(
                  gameStore.imageUrls[index],
                  height: 100,
                ),
                shrinkWrap: true,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.watch_later_rounded),
                  Text(gameStore.releaseDate)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.movie_filter_sharp),
                  Text(gameStore.reviewAverage)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.movie_filter_sharp),
                  Text(gameStore.reviewCount)
                ],
              ),
              Column(
                children: [
                  TextButton(onPressed: onPressed, child: Text(gameStore.linkStore))
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              gameStore.about,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          )
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     return Text("oke");
          //   },
          // )
        ],
      ),
    );
  }
}
