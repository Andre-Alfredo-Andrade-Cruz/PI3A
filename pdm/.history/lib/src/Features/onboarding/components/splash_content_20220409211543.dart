class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.text2,
    this.image,
  }) : super(key: key);
  final String text, text2, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(flex: 2),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Text(
          text2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
