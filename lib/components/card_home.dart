import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_list_now_playing.dart';
import 'package:test_pilarmedia/screens/detail/detail.dart';

class CardHome extends StatefulWidget {
  const CardHome({Key? key, required this.item}) : super(key: key);
  final Result item;

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  int? lenght = 1;

  viewAll() {
    setState(() {
      lenght == 1 ? lenght = null : lenght = 1;
    });
  }

  getToname() {
    Get.toNamed(Detail.namePage, arguments: {"id": widget.item.id});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: getToname,
              child: Hero(
                tag: widget.item.id.toString(),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/" +
                      widget.item.posterPath.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.bar_chart_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.item.popularity.toString(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.item.voteAverage.toString() +
                                  " | " +
                                  widget.item.voteCount.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: GestureDetector(
                          onTap: getToname,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/" +
                                  widget.item.backdropPath.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: InkWell(
                      onTap: viewAll,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                        constraints: const BoxConstraints(
                          minHeight: 100,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.title ?? "Title",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            widget.item.originalTitle == widget.item.title
                                ? const SizedBox(
                                    width: 0,
                                    height: 0,
                                  )
                                : Text(
                                    widget.item.originalTitle ?? "Title",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 12,
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            lenght != 1
                                ? Text(widget.item.overview.toString())
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.item.overview.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: lenght,
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Original Language : " +
                                  widget.item.originalLanguage!,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
