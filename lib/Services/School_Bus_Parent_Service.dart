import 'dart:convert';

import 'package:dio/dio.dart';

import '../Models/School_Bus_Parent_Model.dart';
import '../Models/School_Bus_Sign_Model.dart';

class School_Bus_Parent_Service {
  final Dio dio = Dio();
  final String baseUrl =
      "https://localhost:7163/api/Bus"; // Update the base URL

  BusService() {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // Fetch all buses
  Future<List<dynamic>> getBuses() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        // Parse the response body if the status code is 200
        List buses = response.data;
        return buses;
      } else {
        throw Exception('Failed to load buses');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load buses');
    }
  }

  // Fetch a specific bus by id
  Future<Map<String, dynamic>> getBusById(int id) async {
    try {
      final response = await dio.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load bus');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load bus');
    }
  }

  // Create a new bus
  Future<Map<String, dynamic>> createBus(Map<String, dynamic> busData) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: json.encode(busData),
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to create bus');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to create bus');
    }
  }

  // Update a bus
  Future<Map<String, dynamic>> updateBus(
      int id, Map<String, dynamic> busData) async {
    try {
      final response = await dio.put(
        '$baseUrl/$id',
        data: json.encode(busData),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to update bus');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to update bus');
    }
  }

  // Delete a bus
  Future<void> deleteBus(int id) async {
    try {
      final response = await dio.delete('$baseUrl/$id');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete bus');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to delete bus');
    }
  }
}

class DriverService {
  final Dio _dio = Dio(); // انشاء مثيل من Dio

  // الدالة لجلب السائقين من الـ API
  Future<dynamic> fetchDrivers() async {
    try {
      final response = await _dio.get('https://localhost:7163/api/drivers');

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        return Driver.fromJson(response.data);

      } else {
        throw Exception('Failed to load drivers');
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error fetching drivers: $e');
      throw Exception('Failed to load drivers');
    }
  }
}

