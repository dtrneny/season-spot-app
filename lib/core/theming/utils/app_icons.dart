
enum AppIcons {
  arrowLeft('arrow-left.svg'),
  arrowRight('arrow-right.svg'),
  bell('bell.svg'),
  burger('burger.svg'),
  calendar('calendar.svg'),
  eye('eye.svg'),
  eyeSlash('eye-slash.svg'),
  search('search.svg');

  final String fileName;
  static const String prefix = 'assets/icons/';

  const AppIcons(this.fileName);

  String get path => '$prefix$fileName';
}