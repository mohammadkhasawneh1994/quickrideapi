// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:tam_drive/helpers/displayLocations.dart';
// import 'package:tam_drive/helpers/uuid.dart';
// import 'package:google_maps_webservice/places.dart';

// final homeScaffoldKey = GlobalKey<ScaffoldState>();
// final searchScaffoldKey = GlobalKey<ScaffoldState>();

// class CustomSearchScaffold extends PlacesAutocompleteWidget {
//   CustomSearchScaffold({super.key})
//       : super(
//           apiKey: "AIzaSyCUanBpB6SHAoJRblE5iM9mpjAyHg0AojQ",
//           sessionToken: Uuid().generateV4(),
//           language: "en",
//         );

//   @override
//   _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
// }

// class _CustomSearchScaffoldState extends PlacesAutocompleteState {
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
//     final body = PlacesAutocompleteResult(
//       onTap: (p) {
//         DisplayLocations(context: context).displayPrediction(p);
//       },
//       logo: const Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [FlutterLogo()],
//       ),
//     );
//     return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
//   }

//   @override
//   void onResponseError(PlacesAutocompleteResponse response) {
//     super.onResponseError(response);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(response.errorMessage!)),
//     );
//   }

//   @override
//   void onResponse(PlacesAutocompleteResponse? response) {
//     super.onResponse(response);
//     if (response != null && response.predictions.isNotEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Got answer")),
//       );
//     }
//   }
// }
