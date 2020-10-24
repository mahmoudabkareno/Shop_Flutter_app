class BaseCatogry {
  String id, title;

  BaseCatogry(this.id, this.title);

  BaseCatogry.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
  }
}
