import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  RxInt number1 = 0.obs;
  RxInt number2 = 0.obs;
  RxInt result = 0.obs;
  RxBool isLoading = true.obs;
  RxList<String> history = <String>[].obs;
  final Dio _dio = Dio();
  RxString quote = ''.obs;
  RxString auther = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    isLoading.value = true;
    try {
      final response = await _dio.get('https://zenquotes.io/api/random');
      if (response.statusCode == 200) {
        final data = response.data[0];
        quote.value = data['q'];
        auther.value = data['a'];
      }
    } catch (e) {
      print('Failed to fetch quote: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void addNumbers() {
    number1.value = int.tryParse(number1Controller.text) ?? 0;
    number2.value = int.tryParse(number2Controller.text) ?? 0;
    result.value = number1.value + number2.value;
    history.add(
        '${number1.value} + ${number2.value} = ${result.value}');
  }
}
