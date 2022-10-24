class purchaseData{
  static Map<String,dynamic> info = {
    "Image":"",
    "pay":"",
    "title":"",
  };
  static void setPurchaseData(String key,var data){
    info[key] = data;
  }
  static Map<String,dynamic>  getPurchaseData(){
    return info;
  }
}