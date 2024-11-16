import 'dart:io';
import '../models/account.dart';
import 'client_service.dart';

class AccountService {
  static void faireDepot() {
    print("                                            ");
    print("------------Faire un depot----------");
    print("                                            ");
    stdout.write("Entrez le numéro de compte : ");
    String? accountNumber = stdin.readLineSync();

    Account? account = ClientService.accounts.firstWhere(
      (a) => a.accountNumber == accountNumber,
      //orElse: () => null,  Utilisation de null si aucun compte trouvé
    );

    if (account != null) {
      stdout.write("Entrez le montant à déposer : ");
      double amount = double.parse(stdin.readLineSync()!);
      account.deposit(amount);
      print("Dépôt réussi. Nouveau solde : ${account.balance}");
    } else {
      print("Compte non trouvé.");
    }
    print("                                            ");
  }

  static void faireRetrait() {
    print("                                            ");
    print("------------Faire un retrait----------");
    print("                                            ");
    stdout.write("Entrez le numéro de compte : ");
    String? accountNumber = stdin.readLineSync();

    Account? account = ClientService.accounts.firstWhere(
      (a) => a.accountNumber == accountNumber,
      //orElse: () => null,  Utilisation de null si aucun compte trouvé
    );

    if (account != null) {
      stdout.write("Entrez le montant à retirer : ");
      double amount = double.parse(stdin.readLineSync()!);
      if (account.withdrawal(amount)) {
        print("Retrait réussi. Nouveau solde : ${account.balance}");
      } else {
        print("Solde insuffisant.");
      }
    } else {
      print("Compte non trouvé.");
    }
    print("                                            ");
  }

  static void transfererArgent() {
    print("                                            ");
    print("------------Faire un transfere----------");
    print("                                            ");

    stdout.write("Entrez le numéro de compte source : ");
    String? sourceAccountNumber = stdin.readLineSync();

    stdout.write("Entrez le numéro de compte destination : ");
    String? destAccountNumber = stdin.readLineSync();

    Account? sourceAccount = ClientService.accounts.firstWhere(
      (a) => a.accountNumber == sourceAccountNumber,
      //orElse: () => null,  Utilisation de null si aucun compte trouvé
    );

    Account? destAccount = ClientService.accounts.firstWhere(
      (a) => a.accountNumber == destAccountNumber,
      //orElse: () => null,  Utilisation de null si aucun compte trouvé
    );

    if (sourceAccount != null && destAccount != null) {
      stdout.write("Entrez le montant à transférer : ");
      double amount = double.parse(stdin.readLineSync()!);
      if (sourceAccount.transfer(amount, destAccount)) {
        print("Transfert réussi.");
      } else {
        print("Échec du transfert. Solde insuffisant.");
      }
    } else {
      print("Compte source ou destination introuvable.");
    }
    print("                                            ");
  }
}
