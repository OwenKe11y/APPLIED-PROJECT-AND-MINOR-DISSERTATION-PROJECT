class Ticket {
  final int id;
  final String event_name;
  final String owner;
  final String organiserEmail;

  const Ticket(
      {required this.id,
      required this.event_name,
      required this.owner,
      required this.organiserEmail});
}

var ownedTickets = [];
