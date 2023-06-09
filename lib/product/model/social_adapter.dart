import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_finder/core/constant/design/color_constant.dart';
import 'package:recipe_finder/core/extension/string_extension.dart';

import '../../core/init/language/locale_keys.g.dart';

class SocialAdapterModel {
  final String title;
  final Color color;
  final Icon icon;
  SocialAdapterModel({required this.title, required this.color, required this.icon});
  factory SocialAdapterModel.google() {
    return SocialAdapterModel(
        title: LocaleKeys.loginWithGoogle.locale,
        color: ColorConstants.instance.googleColor,
        icon: Icon(
          FontAwesomeIcons.googlePlusG,
          color: ColorConstants.instance.googleColor,
        ));
  }
  factory SocialAdapterModel.facebook() {
    return SocialAdapterModel(title: LocaleKeys.loginWithFacebook.locale, color: ColorConstants.instance.facebookColor, icon: Icon(FontAwesomeIcons.facebook, color: ColorConstants.instance.facebookColor));
  }
  factory SocialAdapterModel.apple() {
    return SocialAdapterModel(title: 'Sign in with Apple', color: Colors.black, icon: const Icon(FontAwesomeIcons.apple));
  }
}

abstract class ISocialAdapter {
  late final SocialAdapterModel model;
  Future<String> login();
  Future<void> signOut();
}

class GoogleAdapter implements ISocialAdapter {
  GoogleSignIn get googleSignIn {
    if (Platform.isIOS) {
      return GoogleSignIn(clientId: '865687401723-ac4bulugmdj6ot4q3rs021q5mv6mi12g.apps.googleusercontent.com');
    } else {
      return GoogleSignIn();
    }
  }

  @override
  Future<String> login() async {
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        throw 'Google sign in user is null';
      } else {
        final authentication = await user.authentication;
        print('email:${user.email}');
        print('photoUrl:${user.photoUrl}');
        print('serverAuthCode:${user.serverAuthCode}');
        print('displayName:${user.displayName}');
        print('id:${user.id}');
        print('accessToken:${authentication.accessToken}');
        print('idToken:${authentication.idToken}');

        return user.email;
      }
    } catch (error) {
      throw '$error';
    }
  }

  @override
  SocialAdapterModel model = SocialAdapterModel.google();

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}

class FacebookAdapter implements ISocialAdapter {
  @override
  Future<String> login() async {
    try {
      final login = await FacebookAuth.instance.login(permissions: ['public_profile', 'email']);
      if (login.status == LoginStatus.success) {
        final user = await FacebookAuth.instance.getUserData();
        final email = user["email"];
        final name = user["name"];
        final picture = user["picture"]["data"]["url"];
        print(email);
        print(name);
        print(picture);
        print(login.accessToken?.toJson());
        return user.toString();
      } else {
        return 'Facebook sign in user is null';
      }
    } catch (error) {
      print(error);
      return '$error';
    }
  }

  @override
  SocialAdapterModel model = SocialAdapterModel.facebook();

  @override
  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }
}
