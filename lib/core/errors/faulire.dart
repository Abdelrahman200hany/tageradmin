abstract class Faulire {
  final String faulireMessage;

  Faulire(this.faulireMessage);
}

class ServierFaulire extends Faulire {
  ServierFaulire(super.faulireMessage);
}
