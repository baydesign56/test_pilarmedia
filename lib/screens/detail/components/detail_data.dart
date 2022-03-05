import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_detail_now_playing.dart';
import 'package:test_pilarmedia/screens/detail/components/production_company.dart';
import 'package:test_pilarmedia/screens/detail/components/spoken_languages.dart';

import 'over_view.dart';

class DetailData extends StatefulWidget {
  const DetailData({Key? key, required this.data}) : super(key: key);
  final ModelDetailNowPlaying data;

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              child: Hero(
                tag: widget.data.id.toString(),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/" +
                      widget.data.posterPath.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title ?? "Title",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  widget.data.originalTitle == widget.data.title
                      ? const SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : Text(
                          widget.data.originalTitle ?? "Title",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.data.genres == null || widget.data.genres!.length <= 1
                      ? const SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            for (var item in widget.data.genres!)
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Text(item.name!),
                              ),
                          ],
                        ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bar_chart_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.data.popularity.toString(),
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
                            widget.data.voteAverage.toString() +
                                " | " +
                                widget.data.voteCount.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  widget.data.productionCompanies == null ||
                          widget.data.productionCompanies!.isEmpty
                      ? const SizedBox(width: 0, height: 0)
                      : productionCompany(widget.data.productionCompanies!),
                  widget.data.spokenLanguages == null ||
                          widget.data.spokenLanguages!.isEmpty
                      ? const SizedBox(width: 0, height: 0)
                      : spokenLanguage(widget.data.spokenLanguages!),
                  widget.data.overview == null
                      ? const SizedBox(width: 0, height: 0)
                      : overView(widget.data.overview!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
