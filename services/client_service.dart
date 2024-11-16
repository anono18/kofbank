import 'dart:io';
import 'dart:math';
import '../models/client.dart';
import '../models/account.dart';
import 'account_service.dart';

class ClientService {
  static List<Client> clients = [];
  static List<Account> accounts = [];

  static void ajouterClient() {
    print("                                            ");
    print("---------Ajout d'un nouveau client------------");
    print("                                            ");
    stdout.write("Entrez le prénom : ");
    String? firstname = stdin.readLineSync();

    stdout.write("Entrez le nom : ");
    String? lastname = stdin.readLineSync();

    stdout.write("Entrez la date de naissance (yyyy-MM-dd) : ");
    String? birthdate = stdin.readLineSync();

    stdout.write("Entrez le numéro de téléphone : ");
    String? phonenumber = stdin.readLineSync();

    stdout.write("Entrez l'adresse email : ");
    String? email = stdin.readLineSync();

    stdout.write("Choisissez le type de compte (C pour courant, E pour épargne) : ");
    String? typeInput = stdin.readLineSync();
    AccountType type = (typeInput == "C") ? AccountType.courant : AccountType.epargne;

    String accountNumber = "KOBK-${Random().nextInt(999999).toString().padLeft(6, '0')}";
    String creationDate = DateTime.now().toIso8601String().split('T').first;

    Account newAccount = Account(
      type: type,
      creationDate: creationDate,
      accountNumber: accountNumber,
    );

    Client newClient = Client(firstname, lastname, birthdate, phonenumber, email);
    clients.add(newClient);
    accounts.add(newAccount);

    print("Client et compte ajoutés avec succès !");
    print("Numéro de compte : $accountNumber, Solde : ${newAccount.balance}");
    print("                                            ");
  }

  static void listerClients() {
    print("                                            ");
    print("------------Liste des clients----------");
    print("                                            ");
    clients.sort((a, b) => a.lastname!.compareTo(b.lastname!));
    for (var client in clients) {
      print("client : M(e). ${client.lastname} ${client.firstname}");
    }
    print("                                            ");
  }
}
