import 'package:expense_app_flutter/models/card.dart';
import 'package:expense_app_flutter/models/transaction.dart';

final rejectedStatus = ApiTranactionStatus(title: 'Rejected', slug: 'rejected');
final approvedStatus = ApiTranactionStatus(title: 'Approved', slug: 'approved');
final pendingStatus = ApiTranactionStatus(title: 'Pending', slug: 'pending');
final completedStatus =
    ApiTranactionStatus(title: 'Completed', slug: 'completed');

final List<ApiTransaction> mockTransactions = [
  ApiTransaction(
      amount: 2750,
      currentStatus: rejectedStatus,
      date: DateTime(2022, 1, 1),
      title: 'Almighty hotels'),
  ApiTransaction(
      amount: 990,
      currentStatus: approvedStatus,
      date: DateTime(2022, 1, 1),
      title: 'Spotify'),
  ApiTransaction(
      amount: 1450,
      currentStatus: pendingStatus,
      date: DateTime(2022, 1, 1),
      title: 'Taxi'),
  ApiTransaction(
      amount: 2750,
      currentStatus: completedStatus,
      date: DateTime(2022, 1, 1),
      title: 'Almighty hotels'),
  ApiTransaction(
      amount: 990,
      currentStatus: completedStatus,
      date: DateTime(2022, 1, 1),
      title: 'Spotify'),
  ApiTransaction(
      amount: 1450,
      currentStatus: completedStatus,
      date: DateTime(2022, 1, 1),
      title: 'Taxi'),
];

List<ApiCard> mockCards = [
  ApiCard(
      cardHolderName: 'Abhijit Sanyal',
      number: '1234 5678 8765 4321',
      lastDigits: '4321',
      cvv: '111',
      expiryDate: DateTime(2025, 1, 1)),
  ApiCard(
      cardHolderName: 'Abhijit Sanyal',
      number: '8765 4321 1234 5678',
      lastDigits: '5678',
      cvv: '111',
      expiryDate: DateTime(2025, 1, 1)),
];
