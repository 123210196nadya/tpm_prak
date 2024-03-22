import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tourizmapp/tourism.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.tourismPlace});

  TourismPlace tourismPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tourismPlace.name),
      ),
      body: Column(
        children: [
          Text('Foto Foto Di ${tourismPlace.name}'),
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
                itemCount: tourismPlace.imageUrls.length,
                itemBuilder: (context, index) => Image.network(
                  tourismPlace.imageUrls[index],
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
                  Icon(Icons.watch_later_outlined),
                  Text(tourismPlace.openDays)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.watch_later_rounded),
                  Text(tourismPlace.openTime)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.movie_filter_sharp),
                  Text(tourismPlace.ticketPrice)
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
              tourismPlace.description,
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
