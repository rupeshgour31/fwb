import 'package:flutter/material.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/models/business_professionals_model.dart';
import 'package:task/data/remote/models/my_businesses_model.dart';
import 'package:task/data/remote/models/my_teams_model.dart';
import 'package:task/data/remote/models/notiications_model.dart';
import 'package:task/data/remote/models/professionals_profile_model.dart';
import 'package:task/data/remote/models/user_profile_model.dart';
import 'package:task/data/repo/auth_repo.dart';
import 'package:task/data/repo/business_repo.dart';
import 'package:task/uis/pages/bottom_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/view_model.dart';

class DashBoardViewModel extends ViewModel {
  Data? userProfile;
  ProfessionalUser? getProfile;
  List<Teams> teamUsers = [];
  List<NotificationData> notifications = [];
  List<BusinessData> businessUsers = [];
  List<ProfessionalsData> professionals = [];
  int _bottomNavIndex = 0;

  int get bottomNavIndex => _bottomNavIndex;

  set bottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  void getUserProfileReq() {
    callApi(() async {
      final response = await AuthRepo.getProfileCall();
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        UserProfileModel userData = UserProfileModel.fromJson(response.data);
        SharedPrefHelper.userRole = userData.data!.role!;
        userProfile = null;
        notifyListeners();
        userProfile = userData.data;
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void getMyTeams() {
    callApi(() async {
      final response = await BusinessRepo.myTeamsCall();
      teamUsers.clear();
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        MyTeamsModel data = MyTeamsModel.fromJson(response.data);
        teamUsers.addAll(data.data!);
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void getMyBusinesses() {
    callApi(() async {
      final response = await BusinessRepo.myBusinessCall();
      businessUsers.clear();
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        MyBusinessesModel data = MyBusinessesModel.fromJson(response.data);
        businessUsers.addAll(data.data!);
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void getSearchBusinesses(keyword, industry, location) {
    Map<String, String> body = {
      'keyword': keyword,
      'industry': industry,
      'location': location,
    };
    callApi(() async {
      final response = await BusinessRepo.searchBusinessCall(body);
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        GetBusinessProfessionalsModel getData =
            GetBusinessProfessionalsModel.fromJson(
          response.data,
        );
        professionals.clear();
        notifyListeners();
        professionals.addAll(getData.data!);
        notifyListeners();
      } else {
        professionals.clear();
        notifyListeners();
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void getProfessionalsProfile(id) {
    getProfile = null;
    notifyListeners();
    callApi(() async {
      final response = await BusinessRepo.professionalsProfileCall(id);
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        ProfessionalUserModel data = ProfessionalUserModel.fromJson(
          response.data,
        );
        getProfile = data.data!;
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void addRemoveFromTeam(context, id, isAdd) {
    callApi(() async {
      final response = await BusinessRepo.addRemoveFromTeamCall(id, isAdd);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        bottomNavIndex = 1;
        Navigator.pushNamed(
          context,
          DashBoardScreen.route,
        );
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void leaveBusiness(context, id) {
    callApi(() async {
      final response = await BusinessRepo.leaveBusinessCall(id);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        bottomNavIndex = 1;
        Navigator.pushNamed(
          context,
          DashBoardScreen.route,
        );
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void createSchedule(context, body, id) {
    callApi(() async {
      final response = await BusinessRepo.createScheduleCall(body, id);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        bottomNavIndex = 1;
        Navigator.pushNamed(
          context,
          DashBoardScreen.route,
        );
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void getNotifications() {
    callApi(() async {
      final response = await BusinessRepo.notificationsCall();
      notifyListeners();
      if (response.status == 1) {
        // showToast(response.message, AppColors.greenColor);
        var res = NotificationsModel.fromJson(response.data);
        notifications.clear();
        notifyListeners();
        notifications.addAll(res.data!);
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }
}
