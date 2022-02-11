class ApiTransaction {
  final double amount;
  final ApiTranactionStatus currentStatus;
  final DateTime date;
  final String title;

  ApiTransaction({
    required this.amount,
    required this.currentStatus,
    required this.date,
    required this.title,
  });
}

class ApiTranactionStatus {
  final String title;
  final String slug;

  ApiTranactionStatus({required this.title, required this.slug});
}
