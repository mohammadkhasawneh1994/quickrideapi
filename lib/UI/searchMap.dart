import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:tam_drive/UI/UiComponent.dart/TextField.dart';
import 'package:tam_drive/UI/home.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/impl/Location/findLocationByName.dart';

class SearchMap extends StatefulWidget {
  final bool isStart;
  const SearchMap({super.key, this.isStart = true});

  @override
  State<SearchMap> createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  bool isLoaded = false;
  List<PlacesSearchResult> suggestions = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TamTaxtField(
                  isSecured: false,
                  label: "بحث...",
                  width: .85,
                  onChanged: (value) {
                    setState(() {
                      isLoaded = false;
                    });
                    FindLocationByName().main(value).then((onValue) {
                      setState(() {
                        suggestions = onValue;
                        isLoaded = true;
                      });
                    });
                  },
                ),
                SizedBox(
                  width: size.width * .9,
                  height: size.height * .8,
                  child: isLoaded
                      ? ListView.builder(
                          itemCount: suggestions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                suggestions[index]
                                    .setPoint(isStart: widget.isStart);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext contex) =>
                                            const Home()));
                              },
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(suggestions[index].name),
                                    Text(
                                      "${suggestions[index].formattedAddress}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
