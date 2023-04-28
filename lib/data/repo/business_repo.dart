import 'dart:convert';

import 'package:task/data/remote/networking.dart';
import 'package:task/data/remote/response_data.dart';
import 'package:task/data/remote/url_constants.dart';

class BusinessRepo {
  static Future<Response> myTeamsCall() async {
    //making the api call
    final response = await Networking.get(
      Endpoints.getMyTeamsUrl,
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> myBusinessCall() async {
    //making the api call
    final response = await Networking.get(
      Endpoints.getMyBusinessUrl,
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> searchBusinessCall(body) async {
    //making the api call
    final response = await Networking.post(
      Endpoints.searchBusinessUrl,
      json.encode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> professionalsProfileCall(body) async {
    //making the api call
    final response =
        await Networking.get(Endpoints.professionalsProfileUrl + '$body');

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> addRemoveFromTeamCall(body, isAdd) async {
    //making the api call

    final response;
    if (isAdd) {
      response = await Networking.post(
        '${Endpoints.addRemoveInTeamUrl}$body',
        json.encode({}),
      );
    } else {
      response =
          await Networking.delete('${Endpoints.addRemoveInTeamUrl}$body');
    }
    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> leaveBusinessCall(body) async {
    //making the api call

    final response =
        await Networking.delete('${Endpoints.leaveBusinessUrl}$body');

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> createScheduleCall(body, id) async {
    //making the api call

    final response = await Networking.post(
      '${Endpoints.createScheduleUrl}$id',
      json.encode(body),
    );

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }

  static Future<Response> notificationsCall() async {
    //making the api call
    final response = await Networking.get(Endpoints.getNotificationsUrl);

    final responseJson = jsonDecode(response);
    final int loginSucceeded = responseJson['status'];
    final String message = responseJson['message'];
    final Map? error = responseJson['error'];
    return Response(loginSucceeded, message, responseJson, error ?? {});
  }
}
