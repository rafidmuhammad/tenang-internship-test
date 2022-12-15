import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tenang_test/model/doctor_model.dart';

class DoctorService {
  final Uri apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<Doctor>> getDoctor() async {
    try {
      var result = await http.get(apiUrl);
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Doctor> doctors =
            data.map((item) => Doctor.fromJson(item)).toList();
        return doctors;
      } else {
        return <Doctor>[];
      }
    } catch (e) {
      rethrow;
    }
  }
}
