class HttpNetwork {
  Future<String> getProductName() async {
    Future.delayed(const Duration(seconds: 5));
    return "CloudMilk";
  }

  Future<String> getUsername() async {
    Future.delayed(const Duration(seconds: 5));
    return "CloudName";
  }
}
