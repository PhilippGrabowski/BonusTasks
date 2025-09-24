class Person {
  final String firstname;
  final String lastname;
  final String job;
  final String description;
  String? imageUrl;

  Person({
    required this.firstname,
    required this.lastname,
    required this.job,
    required this.description,
    this.imageUrl,
  });

  Person.example()
    : firstname = 'Philipp',
      lastname = 'Grabowski',
      job = 'Arbeitslos',
      description =
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.';
}
