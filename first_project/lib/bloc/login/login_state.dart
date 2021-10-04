import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({this.message});
}

//qua toiwis state
//thì ví dụ lúc t bấm login thì t muốn trên màn hình sẽ có cái icon quay vòng vòng, rồi sau đó sẽ chuyển màn hình nêu thành công, k thì nó sẽ báo lỗi hay gì đó
//thì mấy cái đó gọi là state
//ở dây t có 4 state
//init là chỉ cho biết lúc bắt đàu thôi, 