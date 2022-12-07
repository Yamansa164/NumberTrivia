import 'package:equatable/equatable.dart';

 abstract class Failuer {
  Failuer([List properties=const<dynamic>[]]);
  

} 

/// general failures 
class ServerFailure implements Failuer{}
class LocalFailure implements Failuer{}