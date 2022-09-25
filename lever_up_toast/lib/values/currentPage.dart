class currentPage{
  static List<Map<String,dynamic>> page = [];
  static void addPage(Map<String,dynamic> _page){
    if (page.length == 10){
      page.removeAt(0);
    }
    page.add(_page);
  }
  static List<Map<String,dynamic>> getPage(){
    return page;
  }
}