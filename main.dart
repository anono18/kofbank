import 'dart:io';
import 'services/client_service.dart';
import 'services/account_service.dart';

void main() {
  int operation;
  do {
    print('---------------Bienvenue sur KOFBANK--------------');
    print('1- Ajouter un client');
    print('2- Liste des clients');
    print('3- Faire un dépôt');
    print('4- Faire un retrait');
    print('5- Transférer de l\'argent');
    print('0- Quitter');
    print("----------quelle operation voulez-vous effectuer ?--------------");
    //stdout.write('Choisissez une option : ');

    operation = int.parse(stdin.readLineSync()!);

    switch (operation) {
      case 1:
        ClientService.ajouterClient();
        break;
      case 2:
        ClientService.listerClients();
        break;
      case 3:
        AccountService.faireDepot();
        break;
      case 4:
        AccountService.faireRetrait();
        break;
      case 5:
        AccountService.transfererArgent();
        break;
      case 0:
        print('Merci d\'avoir utilisé KOFBANK. À bientôt !');
        print("                                            ");
          print("K   K   OOO    FFFFF   BBBBB   AAAAAA   N     N   K    k");
          print("K  K   O   O   F       B    B  A     A  N N   N   K  K");
          print("K K    O   O   FFFF    BBBBB   AAAAAAA  N  N  N   K K");
          print("K  K   O   O   F       B    B  A     A  N   N N   K  K");
          print("K   K   OOO    F       BBBBB   A     A  N     N   K    k");
          print("                                            ");
        break;
      default:
        print('Option invalide. Veuillez réessayer.');
    }
  } while (operation != 0);
}
