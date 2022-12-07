import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/failures.dart';

class InputConverter{
  Either<Failuer,int>  stringToUnsignedInteger(String str){
    try {
      final int number=int.parse(str);
      if(number >0)
      {return Right(int.parse(str));}
      {
return left(InputConverterFaliuer());
      }
      
    } on FormatException {
      return Left(InputConverterFaliuer());
    }
    

  }

}
class InputConverterFaliuer extends Failuer{


}