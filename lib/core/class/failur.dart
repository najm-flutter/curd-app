import 'package:equatable/equatable.dart';

abstract class Failur extends Equatable {} 
class OfflineFailur extends Failur {
  @override
  List<Object?> get props => [];
  
  
}
class EmpityFailur extends Failur {
  @override
  List<Object?> get props => [];
  
}
class ServerFailur extends Failur {
  @override
  List<Object?> get props => [];
  
}