part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  // @override
  // List<Object> get props => [];
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int pageNumber;
  OnMainPage(this.pageNumber);
  @override
  List<Object> get props => [];
}

class OnResultPage extends PageState {
  final String apiURL;

  OnResultPage(this.apiURL);

  @override
  List<Object> get props => [apiURL];
}

class OnFailedPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnQrPage extends PageState {
  @override
  List<Object> get props => [];
}
