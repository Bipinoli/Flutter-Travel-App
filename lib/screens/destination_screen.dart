import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Widget _ratingsBuilder(int rating) {
    return Row(
      children: List(rating).map((_) {
        return Text("⭐");
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 2.0),
                      )
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            onPressed: () => print("search")),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.sortAmountDown,
                              size: 25.0,
                            ),
                            onPressed: () => print("sort")),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white70,
                          size: 15.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  size: 25.0,
                  color: Colors.white70,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
              child: ListView.builder(
                  itemCount: widget.destination.activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 170.0,
                          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 100.0,
                              top: 15.0,
                              right: 10.0,
                              bottom: 15.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 180.0,
                                          child: Text(
                                            widget.destination.activities[index]
                                                .name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          widget.destination.activities[index]
                                              .type,
                                          style: TextStyle(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        _ratingsBuilder(widget.destination
                                            .activities[index].rating),
                                      ],
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "\$${widget.destination.activities[index].price}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            "per pax",
                                            style: TextStyle(
                                              color: Colors.black26,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      child: Text(
                                        widget.destination.activities[index]
                                            .startTimes[0],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      child: Text(
                                        widget.destination.activities[index]
                                            .startTimes[1],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.0,
                          left: 10.0,
                          bottom: 10.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                width: 110.0,
                                fit: BoxFit.cover,
                                image: AssetImage(widget
                                    .destination.activities[index].imageUrl)),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
