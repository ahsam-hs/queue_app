class TokenStatusModel {
  final int id;
  final String name;
  final String job;
  final String room;
  final String totalPatients;
  final String waiting;
  final String serving;
  final String avatar;

  TokenStatusModel(this.id, this.name, this.job, this.room, this.waiting,
      this.serving, this.totalPatients, this.avatar);
}
