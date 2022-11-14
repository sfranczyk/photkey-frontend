class ApiConstants{
  static String apiServer = '10.0.2.2'; // loopback for android simulator
  static String apiPort = '8888';
  static String baseUrl = 'http://$apiServer:$apiPort';
  static String loginEndpoint = '/api/v1/auth/login';
}