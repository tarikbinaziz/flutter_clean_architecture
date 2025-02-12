import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  if (error.response == null) {
    return "No response from server. Please check your internet connection.";
  }

  final response = error.response!;
  final int statusCode = response.statusCode ?? 0;
  final dynamic responseData = response.data;

  String extractMessage() {
    if (responseData is Map<String, dynamic>) {
      if (responseData['code'] != null &&
          responseData['code'].toString() != "0") {
        return responseData['msg'] ?? "Unknown error.";
      }

      if (statusCode == 200 && responseData["statusCode"].toString() != "0") {
        return responseData['fault']?['faultstring'] ?? "Unknown error.";
      }

      if (statusCode == 422) {
        final validations = responseData["data"]?["validations"];
        if (validations != null && validations.values.isNotEmpty) {
          return validations.values.first[0];
        }

        final errors = responseData["errors"];
        if (errors != null && errors.values.isNotEmpty) {
          return errors.values.first[0] ?? "Unknown error.";
        }
      }

      if (responseData.containsKey('fault')) {
        return responseData['fault']['faultstring'] ?? "Unknown error.";
      }
    }
    return "Unknown error.";
  }

  switch (statusCode) {
    case 400:
    case 401:
    case 403:
    case 404:
    case 422:
    case 429:
      return extractMessage();

    case 409:
      final String faultString = extractMessage();
      final String minsToJoin =
          responseData["data"]?["mins_to_join"]?.toString() ?? "";
      return minsToJoin.isNotEmpty
          ? "$faultString,\n Minutes left to join: $minsToJoin"
          : faultString;

    case 413:
      return response.statusMessage ?? "Request entity too large.";

    case 500:
    case 502:
    case 503:
    case 504:
      return "Server error. Please try again later.";

    default:
      return "Received invalid status code: $statusCode.";
  }
}

// Its documentation can be found here: https://medium.com/@yamen.abd98/clean-architecture-in-flutter-mvvm-bloc-dio-79b1615530e1#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6ImVlYzUzNGZhNWI4Y2FjYTIwMWNhOGQwZmY5NmI1NGM1NjIyMTBkMWUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTI2NjE5NDUzNzAwNDg5NjIzMDUiLCJlbWFpbCI6Im1kdGFyaWtiaW5heml6QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYmYiOjE3MzkzNDg3OTksIm5hbWUiOiJ0YXJpayBCaW4gYXppeiIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NJTVA1aG5uT25Yb0tMUVJWakFBVm5XUnQ5aWk0Z1BFcUFsYjFZNDlZUWp2WGZfeXI4PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6InRhcmlrIiwiZmFtaWx5X25hbWUiOiJCaW4gYXppeiIsImlhdCI6MTczOTM0OTA5OSwiZXhwIjoxNzM5MzUyNjk5LCJqdGkiOiJjZDk0YzNkZTJlZDA0YWJkODg2YmY2ODI2ZTEzYzY5ZDk3ZDQyZjk2In0.WNHaSM9ZJq1pKKXvfc1KqNKOgRfk51VSgguPY59R2JVhzNOBU778kWfYM7Zh-0LowtBOcMN-1q6lekQJHgSyM9F76qcZXCT-BP2ob6dU9gqfGXusG4kSRcB0DKSBtaB78AuzR5_hDMb-KpVlHvFonQh5v-Zy-x4p9NDaGKK-7JFMetP7Oxxjy3oURhMV2Ie-7JkZ9Z6te-mzu3RH4_4wQwZDqG3IAKSwADo4boVux0K-JALZFOnNohjsGCcatqzMrti8AbxltfyOgYMJve7DNeYN9CSRAujJed-fyFQHSnYESQQXh-ifcbYeHOdbUWgYr1_N-G4aPB77jaJ5kVVi4Q

// String handleDioError(DioError error) {
//   String errorDescription = "";

//   switch (error.type) {
//     case DioErrorType.cancel:
//       errorDescription = "Request to API server was cancelled";
//       break;
//     case DioErrorType.connectionTimeout:
//       errorDescription = "Connection timeout with API server";
//       break;
//     case DioErrorType.connectionTimeout:
//       errorDescription = "Internet Connection Problem.";
//       break;
//     case DioErrorType.receiveTimeout:
//       errorDescription = "Receive timeout in connection with API server";
//       break;
//     case DioErrorType.badResponse:
//       {
//         if (error.response?.data['code'] != null &&
//             (error.response?.data['code'] ?? "0") != "0") {
//           errorDescription = error.response?.data['msg'];
//         } else {
//           if (error.response?.statusCode == 200 &&
//               ("${(error.response?.data["statusCode"] ?? "0")}" != "0")) {
//             if ((error.response?.data['fault']['faultstring'] ?? "") != "") {
//               errorDescription =
//                   (error.response?.data['fault']['faultstring'] ?? "");
//             } else {
//               errorDescription = "Unknown Error";
//             }
//           } else if (error.response?.statusCode == 422) {
//             errorDescription = (error.response?.data["data"] != null &&
//                     error.response?.data["data"]["validations"] != null)
//                 ? error.response?.data["data"]["validations"].values.first[0]
//                 : error.response?.data["errors"] == null
//                     ? error.response?.data['fault']['faultstring'] ??
//                         "Unknown Error"
//                     : error.response?.data["errors"].values.first[0] ??
//                         error.response?.data['fault']['faultstring'] ??
//                         "Unknown Error";
//           } else if (error.response?.statusCode == 413) {
//             errorDescription = error.response!.statusMessage ?? "";
//           } else if (error.response?.statusCode == 400) {
//             errorDescription =
//                 error.response?.data['fault']['faultstring'] ?? "Unknown Error";
//           } else if (error.response?.statusCode == 401) {
//             errorDescription =
//                 error.response?.data['fault']['faultstring'] ?? "Unknown Error";
//           } else if (error.response?.statusCode == 403) {
//             errorDescription = error.response?.data is String
//                 ? "403 Forbidden"
//                 : error.response?.data['fault']['faultstring'] ??
//                     "Unknown Error";
//           } else if (error.response?.statusCode == 404) {
//             errorDescription = error.response?.data is String
//                 ? "404 Unknown Error"
//                 : error.response?.data['fault']['faultstring'] ??
//                     "Unknown Error";
//           } else if (error.response?.statusCode == 409) {
//             errorDescription = error.response?.data['fault']['faultstring'] +
//                     ",\n Minutes left to join: " +
//                     error.response?.data["data"]["mins_to_join"].toString() ??
//                 "Unknown Error";
//           } else if (error.response?.statusCode == 429) {
//             errorDescription = error.response?.data['fault']['faultstring'];
//           } else {
//             errorDescription =
//                 "Received invalid status code: ${error.response?.statusCode}";
//           }
//         }

//         break;
//       }

//     case DioErrorType.sendTimeout:
//       errorDescription = "Send timeout in connection with API server";
//       break;
//     case DioErrorType.badCertificate:
//       // TODO: Handle this case.
//       break;
//     case DioErrorType.connectionError:
//       // TODO: Handle this case.
//       break;
//     case DioErrorType.unknown:
//       // TODO: Handle this case.
//       break;
//   }

//   return errorDescription;
// }
