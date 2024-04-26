class Company {
  final String name;
  final String simbol;
  final String location;
  final String imgURL;
  final String country;
  final String industry;
  final String url;
  bool? value;

  Company(
      {required this.name,
      required this.simbol,
      required this.location,
      required this.imgURL,
      required this.country,
      required this.industry,
      required this.url,
      this.value});

  factory Company.fromJson(Map<String, dynamic> jsonObj) => Company(
        name: jsonObj['name'],
        simbol: jsonObj['simbol'],
        location: jsonObj['location'],
        imgURL: jsonObj['imgURL'],
        country: jsonObj['country'],
        industry: jsonObj['industry'],
        url: jsonObj['url'],
      );
}
