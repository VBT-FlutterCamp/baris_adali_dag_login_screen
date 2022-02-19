class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();

  final String welcomeBack = 'Welcome back!';
  final String designRelish = 'Design Relish';
  final String emailAddress = 'Email Address';
  final String password = 'Password';
  final String forgotPassword = 'Forgot Password?';
  final String login = 'LOGIN';
  final String dontHaveAnAccount = 'Dont\'t have an account?';
  final String create = 'Create';
}
