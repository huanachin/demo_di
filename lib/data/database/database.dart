class Database {
  Future<String> getProductName() async {
    Future.delayed(const Duration(seconds: 5));
    return "LocalMilk";
  }

  Future<String> getUsername() async {
    Future.delayed(const Duration(seconds: 5));
    return "LocalName";
  }
}
