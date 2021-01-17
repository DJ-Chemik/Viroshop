import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:viroshop/Utilities/Constants.dart';
import 'package:flutter/material.dart';
import 'package:viroshop/Utilities/Data.dart';
import 'package:viroshop/World/CartItem.dart';
import 'package:viroshop/World/Shop.dart';

class Requests{
  Requests();

  static Future<String> PostLogin(String login, String password) async {
    try{
      http.Response response = await http.post(
          "${Constants.apiUser}/login",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"login" : login, "password" : password})
      ).timeout(Duration(seconds: Constants.timeOutTime));
      debugPrint(response.body);
      switch(response.body){
        case "Login successful":
          return "loginsuccessful";
        case "User not found":
          return "usernotfound";
        case "Cannot login":
          return "cannotlogin";
        default:
          return "unknown";
      }
    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> PostRegister(String login, String email, String password, String birthDate) async {
    try{
      http.Response response = await http.post(
          "${Constants.apiUser}/register",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"login" : login, "email" : email, "password" : password, "birthDate" : birthDate})
      ).timeout(Duration(seconds: Constants.timeOutTime));
      debugPrint(response.body);
      switch(response.body){
        case "Registered":
          return "registered";
        case "User exists":
          return "userexists";
        default:
          return "unknown";
      }
    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> GetShops() async{
    try{
      http.Response response = await http.get(
          Constants.apiShopList,headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> GetShopsInCity(String city) async{
    try{
      http.Response response = await http.get(
          "${Constants.apiShopsInCity}?city=$city", headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }
  static Future<String> GetProductsInShop(int id) async{
    try{
      http.Response response = await http.get(
          "${Constants.apiProductsInShop}?shopId=$id",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> GetAlleys(int shopId) async{
    try{
      http.Response response = await http.get(
          "${Constants.apiAlleysInShop}?shopId=$shopId",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> addFavoriteShop(int shopId) async{
    try{
      http.Response response = await http.post(
          "${Constants.apiFavoriteShops}/add?shopId=$shopId&login=${Data().currentUsername}",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> deleteFavoriteShop(int shopId) async{
    try{
      http.Response response = await http.delete(
          "${Constants.apiFavoriteShops}/delete?shopId=$shopId&login=${Data().currentUsername}",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> getFavoriteShops() async{
    try{
      http.Response response = await http.get(
          "${Constants.apiFavoriteShops}?login=${Data().currentUsername}",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> test() async{
    String queryString = Uri(queryParameters: {
      "shopId" : '1',
      "productIds" : ['2', '7', '8', '9', '10']
    }).query;
    try{
      http.Response response = await http.get(
          "${Constants.api}/shop/shortway?$queryString",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }

  static Future<String> PostReservation(int shopId, DateTime chosenDate, int quarter, List<CartItem> cartItems) async{
    try{
      List<Map<String, dynamic>> products = [];
      for (CartItem cartItem in cartItems){
        products.add(
            {
              "productId": cartItem.cartProduct.id,
              "count" : cartItem.quantity
            });
      }
      http.Response response = await http.post(
          "${Constants.apiReservations}/new",headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      }, body: jsonEncode(
        {
          "date" : DateFormat("yyyy-MM-dd").format(chosenDate),
          "quarterOfDay" : quarter,
          "productReservations" : products,
          "shopId" : shopId,
          "login" : Data().currentUsername
        }
      )
      ).timeout(Duration(seconds: Constants.timeOutTime));

      return response.body;

    }on SocketException{
      debugPrint("Connection failed");
      return "connfailed";
    }on TimeoutException{
      debugPrint("Timeout");
      return "conntimeout";
    }on HttpException{
      debugPrint("Http Exception");
      return "httpexception";
    }
  }
}