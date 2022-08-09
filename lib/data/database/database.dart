class Database {
  Future<String> getProductName() async {
    Future.delayed(const Duration(seconds: 2));
    return "LocalMilk";
  }

  Future<String> getUsername() async {
    Future.delayed(const Duration(seconds: 2));
    return "LocalName";
  }
}
