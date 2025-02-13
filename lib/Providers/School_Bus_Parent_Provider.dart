import 'package:flutter/cupertino.dart';

import '../Models/School_Bus_Parent_Model.dart';
import '../Services/School_Bus_Parent_Service.dart';

class School_Bus_Parent_Provider extends ChangeNotifier {
  final School_Bus_Parent_Service _busService = School_Bus_Parent_Service(); // BusService instance
  List<School_Bus_Parent_Show_Buses_Model> _buses = [];
  bool _isLoading = false;
  String _errorMessage = '';

  // Getter to access buses list
  List<School_Bus_Parent_Show_Buses_Model> get buses => _buses;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch all buses
  Future<void> fetchBuses() async {
    _isLoading = true;
    _errorMessage = '';

    try {
      List<dynamic> data = await _busService.getBuses();
      // Convert response to a list of Bus objects
      _buses = data.map((busJson) => School_Bus_Parent_Show_Buses_Model.fromJson(busJson)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load buses';
      notifyListeners();
    }
  }

  // Fetch a specific bus by ID
  Future<void> fetchBusById(int id) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      Map<String, dynamic> data = await _busService.getBusById(id);
      _buses = [School_Bus_Parent_Show_Buses_Model.fromJson(data)]; // Update the list with a single bus
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load bus';
      notifyListeners();
    }
  }


  // Create a new bus
  Future<void> createBus(Map<String, dynamic> busData) async {
    try {
      var newBus = await _busService.createBus(busData);
      _buses.add(School_Bus_Parent_Show_Buses_Model.fromJson(newBus));
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to create bus';
      notifyListeners();
    }
  }

  // Update an existing bus
  Future<void> updateBus(int id, Map<String, dynamic> busData) async {
    try {
      var updatedBus = await _busService.updateBus(id, busData);
      int index = _buses.indexWhere((bus) => bus.id == id);
      if (index != -1) {
        _buses[index] = School_Bus_Parent_Show_Buses_Model.fromJson(updatedBus);
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to update bus';
      notifyListeners();
    }
  }

  // Delete a bus
  Future<void> deleteBus(int id) async {
    try {
      await _busService.deleteBus(id);
      _buses.removeWhere((bus) => bus.id == id);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to delete bus';
      notifyListeners();
    }
  }
}
class DriverProvider with ChangeNotifier {
  final DriverService _driverService = DriverService();
  List<Driver> _drivers = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Driver> get drivers => _drivers;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadDrivers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _drivers = await _driverService.fetchDrivers();
      _errorMessage = null; // Clear any previous error
    } catch (e) {
      _errorMessage = e.toString();
      print('Error: $_errorMessage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}