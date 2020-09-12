import 'package:bazoga/models/event.dart';
import 'package:bazoga/models/fasilitas.dart';
import 'package:bazoga/models/hewan.dart';
import 'package:bazoga/models/kandang.dart';
import 'package:bazoga/models/marketing.dart';
import 'package:bazoga/models/promo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const url = "http://www.kota103.my.id/";

class GetHewans {
  String getPath() {
    return url + "api/hewan";
  }

  Future<List<Hewan>> getHewans() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((hewan) => new Hewan.fromJson(hewan)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class Getfasilitases {
  String getPath() {
    return url + "api/fasilitas";
  }

  Future<List<Fasilitas>> getFasilitases() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data
          .map((fasilitas) => new Fasilitas.fromJson(fasilitas))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetEvents {
  String getPath() {
    return url + "api/event";
  }

  Future<List<Event>> getEvents() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((event) => new Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetKandangs {
  String getPath() {
    return url + "api/kandang";
  }

  Future<List<Kandang>> getKandangs() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((kandang) => new Kandang.fromJson(kandang)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetMarketings {
  String getPath() {
    return url + "api/marketing";
  }

  Future<List<Marketing>> getMarketings() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data
          .map((marketing) => new Marketing.fromJson(marketing))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetPromos {
  String getPath() {
    return url + "api/promo";
  }

  Future<List<Promo>> getPromos() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((promo) => new Promo.fromJson(promo)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
