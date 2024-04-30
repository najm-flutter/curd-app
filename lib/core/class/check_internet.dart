
abstract class CheckInternet {
  Future<bool> get isConnectInternet  ;
}
class IsConnectInternet implements CheckInternet {
  @override
  Future<bool> get isConnectInternet => Future.value(true) ;
  
  }