class Company {
  final String name;
  final String location;
  final String imgURL;
  final String country;
  final String industry;
  final String description;

  const Company({
    required this.name,
    required this.location,
    required this.imgURL,
    required this.country,
    required this.industry,
    required this.description,
  });

  factory Company.froJson(Map<String, dynamic> jsonObj) => Company(
        name: jsonObj['name'],
        location: jsonObj['location'],
        imgURL: jsonObj['imgURL'],
        country: jsonObj['country'],
        industry: jsonObj['industry'],
        description: jsonObj['description'],
      );
}
