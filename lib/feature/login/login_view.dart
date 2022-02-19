import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:login_screen/core/constans/text_constans.dart';
import 'package:login_screen/core/init/design/color.dart';
import 'package:login_screen/core/init/design/text_style.dart';
import 'package:login_screen/core/widget_size_constant.dart';
import 'package:login_screen/products/companets/widget/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  StringConstants strings = StringConstants.instance;
  bool isObservable = true;

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  double _borderRadius = 6;

  void _obSecureUpdate() {
    setState(() {
      isObservable = !isObservable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeText(context),
                    designText(context),
                    SizedBox(
                      height: context.dynamicHeight(0.01),
                    ),
                    _emailFormField(),
                    _passwordFormField(),
                    forgotButton(),
                    loginButton(context),
                  ],
                ),
              ),
            ),
          ),
          dontHaveAccontText()
        ],
      ),
    );
  }

  CustomTextFormField _passwordFormField() {
    return CustomTextFormField(
      codeController: _passwordController,
      textInputType: TextInputType.name,
      labelText: strings.password,
      focusNode: _passwordNode,
      isPassword: isObservable,
      trailing: Icon(
        isObservable ? Icons.visibility : Icons.visibility_off,
        color: kcLightGreyColor,
      ),
      trailingTapped: _obSecureUpdate,
      validator: (value) {
        if (value?.isEmpty ?? false) return null;
        if (value!.length > 8) {
          return null;
        }
        return 'Şifreniz en az 8 karakter olmalıdır';
      },
    );
  }

  CustomTextFormField _emailFormField() {
    return CustomTextFormField(
      codeController: _mailController,
      textInputType: TextInputType.emailAddress,
      labelText: strings.emailAddress,
      focusNode: _emailNode,
      validator: (value) {
        if (value?.isEmpty ?? false) return null;
        if (value!.contains('@')) {
          return null;
        }
        return 'Emailinizi düzgün girin ';
      },
    );
  }

  Padding designText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(strings.designRelish,
            style: headlineStyle.copyWith(fontSize: 45)),
      ),
    );
  }

  Padding welcomeText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          strings.welcomeBack,
          style:
              subheadingStyle.copyWith(fontSize: 25, color: kcLightGreyColor),
        ),
      ),
    );
  }

  InkWell forgotButton() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
            right: WidgetSizeConstant.xLarge2x,
            bottom: WidgetSizeConstant.xLarge2x * 2),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            strings.forgotPassword,
            style: bodyStyle.copyWith(color: kcLightGreyColor),
          ),
        ),
      ),
    );
  }

  InkWell loginButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: context.dynamicHeight(0.1),
        width: context.dynamicWidth(0.9),
        color: Colors.pink,
        child: Center(
            child: Text(
          strings.login,
          style: subheadingStyle.copyWith(color: kcLightColor),
        )),
      ),
    );
  }

  Padding dontHaveAccontText() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            strings.dontHaveAnAccount,
            style: bodyStyle.copyWith(color: kcLightGreyColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            strings.create,
            style: bodyBoldStyle.copyWith(decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
