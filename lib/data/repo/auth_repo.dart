import 'dart:convert';

import 'package:task/data/remote/networking.dart';
import 'package:task/data/remote/response_data.dart';
import 'package:task/data/remote/url_constants.dart';

class AuthRepo {
  static Future<Response> loginCall(Map<String, String> body) async {
    //making the api call
    final response = await Networking.post(
      Endpoints.loginUrl,
      jsonEncode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    print(error);
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> registrationCall(Map<String, String> body) async {
    //making the api call
    final response = await Networking.post(
      Endpoints.registerUrl,
      jsonEncode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> getProfileCall() async {
    //making the api call
    final response = await Networking.get(Endpoints.userProfileUrl);

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> editProfileCall(Map<String, String> body) async {
    //making the api call
    final response = await Networking.put(
      Endpoints.userProfileUrl,
      jsonEncode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> forgotPasswordCall(body) async {
    //making the api call
    final response = await Networking.post(
      Endpoints.forgotPasswordUrl,
      json.encode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> logoutCall() async {
    //making the api call
    final response = await Networking.get(
      Endpoints.logoutUrl,
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> getPlansCall() async {
    //making the api call
    final response = await Networking.get(
      Endpoints.getPlansUrl,
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> paymentInfoCall(int type) async {
    //making the api call
    final response = await Networking.get(
      type == 1
          ? Endpoints.registerMyBusinessUrl
          : type == 2
              ? Endpoints.contractProfessionalUrl
              : Endpoints.businessOwnerUrl,
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];

    return Response(loginSucceeded, message, responseJson, error ?? {});
  }
}
