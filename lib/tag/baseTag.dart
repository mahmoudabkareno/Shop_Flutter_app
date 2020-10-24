class BaseTag{
  String id , title;

  BaseTag(this.id, this.title);

  BaseTag.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
  }
}