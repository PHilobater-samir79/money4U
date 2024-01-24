class MoneyModel
{
   int? id;
   String title ;
   double moneyValue;
   String dateTime ;

  MoneyModel({
    required this.dateTime,
    required this.title,
    required this.moneyValue,
    this.id
});

  factory MoneyModel.fromJson(Map<String, dynamic> json) {
    return MoneyModel(
        dateTime: json['dateTime'] ,
        moneyValue: json['moneyValue'],
        id: json['id'],
        title: json['title']
    );
  }



}