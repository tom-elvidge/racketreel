class SummaryEntity
{
  String datetime;

  SummaryEntity(this.datetime);

  static SummaryEntity default_() {
    return SummaryEntity("");
  }
}