class HttpNetwork {
  Future<String> getProductName() async {
    Future.delayed(const Duration(seconds: 2));
    return "CloudMilk";
  }

  Future<String> getUsername() async {
    Future.delayed(const Duration(seconds: 2));
    return "CloudName";
  }
}
