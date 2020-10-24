class BaseImage{
  String id, outText, url;

  BaseImage(this.id, this.outText, this.url);

  BaseImage.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.outText = jsonObject['outText'];
    this.url = jsonObject['url'];
  }

}