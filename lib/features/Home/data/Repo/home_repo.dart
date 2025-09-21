import 'dart:developer';

import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/features/Home/data/model/SliderResponse/slider_resbonse/slider_resbonse.dart';
import 'package:bookia/features/Home/data/model/books_response/books_response.dart';

class Home_Repo {
  static Future<Books_Response?> bestSaller() async {
    try {
      var res = await Dio_Provider.Get(endPoint: API_EndPoint.BestSaller);
      if (res.statusCode == 200) {
        return Books_Response.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<Books_Response?> allBooks() async {
    try {
      var res = await Dio_Provider.Get(endPoint: API_EndPoint.AllBooks);
      if (res.statusCode == 200) {
        return Books_Response.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<Books_Response?> newArrivails() async {
    try {
      var res = await Dio_Provider.Get(endPoint: API_EndPoint.NewArrivals);
      if (res.statusCode == 200) {
        return Books_Response.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<SliderResbonse?> getSlider() async {
    try {
      var res = await Dio_Provider.Get(endPoint: API_EndPoint.Slider);

      if (res.statusCode == 200) {
        return SliderResbonse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<Books_Response?> searchHome(
    String title,
    double max,
    double min,
  ) async {
    try {
      var res = await Dio_Provider.Get(
        endPoint: API_EndPoint.SearchWithfilter,
        queryParameters: {'max': max, 'min': min, 'search': title},
      );
      if (res.statusCode == 200) {
        return Books_Response.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
