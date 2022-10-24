class wishData{
  static List<Map<String,dynamic>> page =[];
  static void addPage(String key,Map<String,dynamic> _page){
    if (page.length == 10){
      page.remove(0);
    }
    page.add(_page);
  }
  static List<Map<String,dynamic>>  getPage(){
    return page;
  }
}