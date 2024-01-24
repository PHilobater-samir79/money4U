class OnBoardingModel {
  String imagePath;
  String title;
  String subTitle;
  String nextBottom;
  String backBottom;
  String skip;

  OnBoardingModel(
      {required this.title,
        required this.imagePath,
        required this.subTitle,
        required this.nextBottom,
        required this.skip,
        required this.backBottom});

  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        title: 'Manage your Money',
        imagePath: 'assets/images/finance1.png',
        skip: 'Skip',
        subTitle:
        'You can easily manage your Money',
        backBottom: '1/3',
        nextBottom: 'Next'),
    OnBoardingModel(
        title: 'Create daily payment',
        imagePath: 'assets/images/finance2.png',
        skip: 'Skip',
        subTitle:
        'In Money 4 U you can create your\n personalized payments to stay productive',
        backBottom: '2/3',
        nextBottom: 'Next'),
    OnBoardingModel(
        title: 'Organizing your payments',
        imagePath: 'assets/images/finance3.png',
        skip: '',
        subTitle:
        'You can organize your daily payments by\n adding your payment into separate categories',
        backBottom: '3/3',
        nextBottom: 'Get Started')
  ];
}
