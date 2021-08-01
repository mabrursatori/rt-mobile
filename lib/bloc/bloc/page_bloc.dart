import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  // PageBloc() : super(PageInitial());
  @override
  PageState get initialState => PageInitial();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(event.pageNumber);
    } else if (event is GoToResultPage) {
      yield OnResultPage(event.apiURL);
    } else if (event is GoToFailedPage) {
      yield OnFailedPage();
    } else if (event is GoToQrPage) {
      yield OnQrPage();
    }
  }
}
