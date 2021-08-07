class Transfer {
  final String id;
  final String sender;
  final String receiver;
  final double amount;
  final String status;

  Transfer({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.status,
  });
}
