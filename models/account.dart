enum AccountType { courant, epargne }

class Account {
  AccountType type;
  double balance;
  String creationDate;
  String accountNumber;

  Account({
    required this.type,
    this.balance = 0.0,
    required this.creationDate,
    required this.accountNumber,
  });

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  bool withdrawal(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }

  bool transfer(double amount, Account receiver) {
    if (withdrawal(amount)) {
      receiver.deposit(amount);
      return true;
    }
    return false;
  }
}
