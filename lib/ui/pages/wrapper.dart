part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.run(() async {
      ipPublic = await IpServices.getPublicIP();
      String username = await SessionServices.getUsername();
      String password = await SessionServices.getPassword();
      if (username != null &&
          password != null &&
          username != "" &&
          password != "") {
        user = await UserServices.getUser(username, password);
        context.bloc<PageBloc>().add(GoToMainPage());
      } else {
        context.bloc<PageBloc>().add(GoToLoginPage());
      }
    });
    // context.bloc<PageBloc>().add(GoToMainPage());
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnMainPage)
            ? MainPage(pageState.pageNumber)
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnResultPage)
                    ? ResultPage(pageState.apiURL)
                    : (pageState is OnFailedPage)
                        ? FailedPage()
                        : (pageState is OnQrPage)
                            ? QrPage()
                            : BlankPage());
  }
}
