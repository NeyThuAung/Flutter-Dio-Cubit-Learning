import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("REQUEST: ${options.method} ${options.path}");
          print("Headers: ${options.headers}");
          print("Data: ${options.data}");

          // 👉 Add token here (later)
          // options.headers["Authorization"] = "Bearer YOUR_TOKEN";

          return handler.next(options);
        },

        onResponse: (response, handler) {
          print("RESPONSE: ${response.statusCode}");
          print("Data: ${response.data}");

          return handler.next(response);
        },

        onError: (DioException e, handler) {
          print("ERROR: ${e.message}");

          // Optional: handle common errors
          if (e.response != null) {
            print("Status Code: ${e.response?.statusCode}");
            print("Response Data: ${e.response?.data}");
          }

          return handler.next(e);
        },
      ),
    );
  }
}
