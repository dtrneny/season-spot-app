
enum AppIcons {
  arrowLeft('arrow-left.svg'),
  arrowRight('arrow-right.svg'),
  bell('bell.svg'),
  burger('burger.svg'),
  calendar('calendar.svg'),
  dashboard('dashboard.svg'),
  eye('eye.svg'),
  eyeSlash('eye-slash.svg'),
  flag('flag.svg'),
  location('location.svg'),
  search('search.svg'),
  settings('settings.svg'),
  signOut('sign-out.svg'),
  user('user.svg');


  final String fileName;
  static const String prefix = 'assets/icons/';

  const AppIcons(this.fileName);

  String get path => '$prefix$fileName';
}