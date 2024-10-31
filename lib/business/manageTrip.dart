import 'package:tam_drive/core/abstractions/IApiManager.dart';
import 'package:tam_drive/core/constants/enums.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/impl/API/RequestBuilder.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/core/models/post/tripDetails.dart';
import 'package:tam_drive/core/models/put/confirmOrder.dart';
import 'package:tam_drive/core/models/put/updateCar.dart';
import 'package:tam_drive/core/models/put/varifyTrip.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class TripManager extends IApiManager {
  Future addTrip(Trip trip) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Tour.add;
    requestBuilder.payload = trip;
    var req = await requestBuilder.build(RequestType.post);
    res = await req.load();
  }

  Future<List<Order>> getTrip(String state) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Tour.query.replaceAll("{state}", state);
    var req = await requestBuilder.build(RequestType.get);
    res = await req.load();
    var data = res.payload as List;
    var orders = data.map((i) => Order.fromJson(i)).toList();
    return orders;
  }

  Future<List<Order>> getTripByDriver(String state) async {
    var userId = await ManageSession.getValue(SessionKeys.userId);
    requestBuilder = RequestBuilder();
    requestBuilder.dir =
        Tour.bydriver.replaceAll("{state}", state).replaceAll("{Id}", userId!);
    var req = await requestBuilder.build(RequestType.get);
    res = await req.load();
    var data = res.payload as List;
    var orders = data.map((i) => Order.fromJson(i)).toList();
    return orders;
  }

  Future<List<Order>> getTripByUser(String state) async {
    var userId = await ManageSession.getValue(SessionKeys.userId);
    requestBuilder = RequestBuilder();
    requestBuilder.dir =
        Tour.byuser.replaceAll("{state}", state).replaceAll("{Id}", userId!);
    var req = await requestBuilder.build(RequestType.get);
    res = await req.load();
    var data = res.payload as List;
    var orders = data.map((i) => Order.fromJson(i)).toList();
    return orders;
  }

  Future confirmTrip(String Id, ConfirmTrip confirm) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Tour.confirmed.replaceAll("{Id}", Id);
    requestBuilder.payload = confirm;
    var req = await requestBuilder.build(RequestType.put);
    res = await req.load();
  }

  Future varifyTrip(String Id, VarifyTrip varify) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Tour.arrived.replaceAll("{Id}", Id);
    requestBuilder.payload = varify;
    var req = await requestBuilder.build(RequestType.put);
    res = await req.load();
  }

  Future finishTrip(String Id) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Tour.finished.replaceAll("{Id}", Id);
    var req = await requestBuilder.build(RequestType.get);
    res = await req.load();
  }

  Future updateDriverState(UpdateCar updateCar) async {
    var userId = await ManageSession.getValue(SessionKeys.userId);
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Car.newride.replaceAll("{Id}", userId!);
    requestBuilder.payload = updateCar;
    var req = await requestBuilder.build(RequestType.put);
    res = await req.load();
  }
}
