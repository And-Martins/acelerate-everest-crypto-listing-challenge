import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get language => 'Português';

  @override
  String get movTitle => 'Movimentações';

  @override
  String get portTitle => 'Portifólio';

  @override
  String get transactionNotFoundTitle => 'Nenhuma transação encontrada!';

  @override
  String get transactionNotFoundSubtitle => 'Suas transações ficarão registradas nesta tela';

  @override
  String get walletTitle => 'Cripto';

  @override
  String get walletSubtitle => 'Valor total de moedas';

  @override
  String get detailTitleAppBar => 'Detalhes';

  @override
  String get item1Title => 'Preço atual';

  @override
  String get item2Title => 'Variação 24H';

  @override
  String get item3Title => 'Quantidade';

  @override
  String get item4Title => 'Valor';

  @override
  String get convertButtonTitle => 'Converter moeda';

  @override
  String get alertZeroMessage => 'Por favor, insira um valor válido!';

  @override
  String get alertQuantityMessage => 'Quantidade inserida é maior que a quantidade disponível!';

  @override
  String get convertTitle => 'Converter';

  @override
  String get convertBalance => 'Saldo disponível';

  @override
  String get convertText => 'Quanto você gostaria de converter?';

  @override
  String get convertTextTotal => 'Total estimado';

  @override
  String get reviewTitle => 'Revisar';

  @override
  String get reviewText => 'Revise os dados da sua conversão';

  @override
  String get item1TitleReview => 'Converter';

  @override
  String get item2TitleReview => 'Receber';

  @override
  String get item3TitleReview => 'Câmbio';

  @override
  String get reviewButton => 'Concluir conversão';

  @override
  String get completeTitle => 'Conversão efetuada';

  @override
  String get completeSubtitle => 'Conversão de moeda efetuada com sucesso!';
}
