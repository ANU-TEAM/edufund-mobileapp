class ContentModel {
  final String image;
  final String name;
  final String title;
  final String message;
  final String amount;
  final double percentage;

  ContentModel(
      {this.image,
      this.name,
      this.title,
      this.message,
      this.amount,
      this.percentage});
}

List<ContentModel> contentmodel = [
  ContentModel(
    image: "assets/images/home_image.jpg",
    name: "Florence Hanson",
    title: "Aid To Pursue BEcon",
    message: "I started University last year but"
        " due to unfortunate reasons...",
    amount: "1,400",
    percentage: 0.65,
  ),
  ContentModel(
    image: "assets/images/home_image.jpg",
    name: "Florence Hanson",
    title: "Aid To Pursue BEcon",
    message: "I started University last year but"
        " due to unfortunate reasons...",
    amount: "1,400",
    percentage: 1,
  ),
  ContentModel(
    image: "assets/images/primary.jpg",
    name: "Kofi Mensah",
    title: "Aid To Pursue BEcon",
    message: "I started University last year but"
        " due to unfortunate reasons...",
    amount: "1,400",
    percentage: 0.22,
  ),
  ContentModel(
    image: "assets/images/home_image.jpg",
    name: "Florence Hanson",
    title: "Aid To Pursue BEcon",
    message: "I started University last year but"
        " due to unfortunate reasons...",
    amount: "1,400",
    percentage: 0.94,
  )
];
