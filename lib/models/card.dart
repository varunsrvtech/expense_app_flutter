class ApiCard {
  final String number;
  final String cvv;
  final DateTime expiryDate;
  final String lastDigits;
  final String cardHolderName;

  ApiCard({
    required this.number,
    required this.cvv,
    required this.expiryDate,
    required this.lastDigits,
    required this.cardHolderName,
  });
}
