import 'translation_file.dart';

/// The translations for English (`en`).
class TranslationFileEn extends TranslationFile {
  TranslationFileEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get movTitle => 'Transactions';

  @override
  String get portTitle => 'portfolio';

  @override
  String get transactionNotFoundTitle => 'No transactions encountered!';

  @override
  String get transactionNotFoundSubtitle => 'Your transactions will be registered on this screen';

  @override
  String get walletTitle => 'Crypto';

  @override
  String get walletSubtitle => 'Total coin value';

  @override
  String get detailTitleAppBar => 'Details';

  @override
  String get item1Title => 'Current Price';

  @override
  String get item2Title => '24H variation';

  @override
  String get item3Title => 'Quantity';

  @override
  String get item4Title => 'Amount';

  @override
  String get convertButtonTitle => 'Convert money';

  @override
  String get alertZeroMessage => 'Please enter a valid value!';

  @override
  String get alertQuantityMessage => 'Quantity entered is greater than the available quantity!';

  @override
  String get convertTitle => 'Convert';

  @override
  String get convertBalance => 'Available Balance';

  @override
  String get convertText => 'How much would you like to convert?';

  @override
  String get convertTextTotal => 'Total estimated';

  @override
  String get reviewTitle => 'Review';

  @override
  String get reviewText => 'Review your conversion results';

  @override
  String get item1TitleReview => 'Convert';

  @override
  String get item2TitleReview => 'Receive';

  @override
  String get item3TitleReview => 'Exchange';

  @override
  String get reviewButton => 'Finish conversion';

  @override
  String get completeTitle => 'Conversion done';

  @override
  String get completeSubtitle => 'The currency conversion has been successfully completed!';
}
