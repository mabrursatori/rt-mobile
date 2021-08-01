part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int pageNumber;
  GoToMainPage({this.pageNumber = 0});
  @override
  List<Object> get props => [pageNumber];
}

class GoToResultPage extends PageEvent {
  final String apiURL;

  GoToResultPage(this.apiURL);

  @override
  List<Object> get props => [apiURL];
}

class GoToFailedPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToQrPage extends PageEvent {
  @override
  List<Object> get props => [];
}
