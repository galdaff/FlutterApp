import 'package:equatable/equatable.dart';
// muốn add maa6ys cái package thì vô pub.dev rôi search ra thôi, add thì vô file pubspec.yaml để add

class LoginEvent extends Equatable {
  @override
  List<Object> get props => []; //mấy này syntax thoioi, đó giờ t để vậy
}

class StartEvent extends LoginEvent {
} //coi coi cái chức năng nào có event gì thì ghi vào, ở đây có 2 cái

class LoginButtonPressed extends LoginEvent {
  final String username;
  final int password;
  LoginButtonPressed({this.username, this.password});
}

//lag qqua t copy cho le
// mỗi 1 bloc sẽ có 3 file : bloc, event, state ok
// thì đầu tiên cái event này là khi m ân 1 cái nút nào đó, thì nó sẽ nhận dc cái gì
//ở đây login thì khi ấn nút login thì mình nhận dc usernam, pasowrd
//cái startevent là lúc đầu tiên chạy , là mình chưa bấm gì, nên nó k nhận gì cả
//loginbuttonpressed là nhấn 