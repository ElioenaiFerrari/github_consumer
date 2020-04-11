import 'package:dio/dio.dart';
import 'package:github_repos/config/constants.dart';

class ClientHttp {
  Dio dio = Dio();
  String tokenRefresh = '';

  ClientHttp() {
    dio.interceptors.clear();
    dio.options.baseUrl = API_GITHUB;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          if (tokenRefresh.isNotEmpty) {
            options.headers = {
              'Authorization': 'Bearer $tokenRefresh',
            };
          }
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError error) async {
          if (error.response?.statusCode == 401) {
            dio.interceptors.requestLock.lock();
            dio.interceptors.responseLock.lock();
            RequestOptions options = error.response.request;
            options.headers = {
              'Authorization': 'Bearer $tokenRefresh',
            };

            dio.interceptors.requestLock.unlock();
            dio.interceptors.responseLock.unlock();

            return dio.request(options.path, options: options);
          }
          return error;
        },
      ),
    );
  }
  Dio getClient() => dio;
}
