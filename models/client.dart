class Client {
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? birthdate;
  String? email;

  Client(this.firstname, this.lastname, this.birthdate, this.phonenumber, this.email);

  void afficherDetails() {
    print('Nom : $lastname, Prénom : $firstname, Téléphone : $phonenumber, Email : $email');
  }
}
