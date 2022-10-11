import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translation_file_en.dart';
import 'translation_file_pt.dart';

/// Callers can lookup localized strings with an instance of TranslationFile
/// returned by `TranslationFile.of(context)`.
///
/// Applications need to include `TranslationFile.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/translation_file.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TranslationFile.localizationsDelegates,
///   supportedLocales: TranslationFile.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TranslationFile.supportedLocales
/// property.
abstract class TranslationFile {
  TranslationFile(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TranslationFile? of(BuildContext context) {
    return Localizations.of<TranslationFile>(context, TranslationFile);
  }

  static const LocalizationsDelegate<TranslationFile> delegate = _TranslationFileDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Idioma atual
  ///
  /// In pt, this message translates to:
  /// **'Português'**
  String get language;

  /// Título página movimentações
  ///
  /// In pt, this message translates to:
  /// **'Movimentações'**
  String get movTitle;

  /// Título página Portifólio
  ///
  /// In pt, this message translates to:
  /// **'Portifólio'**
  String get portTitle;

  /// Título da mensagem da página de transação
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma transação encontrada!'**
  String get transactionNotFoundTitle;

  /// SubTítulo da mensagem da página de transação
  ///
  /// In pt, this message translates to:
  /// **'Suas transações ficarão registradas nesta tela'**
  String get transactionNotFoundSubtitle;

  /// Título da carteira da página Portifólio
  ///
  /// In pt, this message translates to:
  /// **'Cripto'**
  String get walletTitle;

  /// SubTítulo da carteira da página Portifólio
  ///
  /// In pt, this message translates to:
  /// **'Valor total de moedas'**
  String get walletSubtitle;

  /// Título da barra de navegação da página detalhes
  ///
  /// In pt, this message translates to:
  /// **'Detalhes'**
  String get detailTitleAppBar;

  /// Título do item 1
  ///
  /// In pt, this message translates to:
  /// **'Preço atual'**
  String get item1Title;

  /// Título do item 2
  ///
  /// In pt, this message translates to:
  /// **'Variação 24H'**
  String get item2Title;

  /// Título do item 3
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get item3Title;

  /// Título do item 4
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get item4Title;

  /// Título do botão de conversão da página de detalhes
  ///
  /// In pt, this message translates to:
  /// **'Converter moeda'**
  String get convertButtonTitle;

  /// Mensagem de Alerta quando valor inserido for nulo
  ///
  /// In pt, this message translates to:
  /// **'Por favor, insira um valor válido!'**
  String get alertZeroMessage;

  /// Mensagem de Alerta quando quantidade inserido for maior que a disponível
  ///
  /// In pt, this message translates to:
  /// **'Quantidade inserida é maior que a quantidade disponível!'**
  String get alertQuantityMessage;

  /// Título da appbar da página de conversão
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get convertTitle;

  /// Título saldo disponível da tela de conversão
  ///
  /// In pt, this message translates to:
  /// **'Saldo disponível'**
  String get convertBalance;

  /// Texto exibido na tela de conversão
  ///
  /// In pt, this message translates to:
  /// **'Quanto você gostaria de converter?'**
  String get convertText;

  /// Texto exibindo o total na tela de conversão
  ///
  /// In pt, this message translates to:
  /// **'Total estimado'**
  String get convertTextTotal;

  /// Título da página de revisão
  ///
  /// In pt, this message translates to:
  /// **'Revisar'**
  String get reviewTitle;

  /// Texto exibido na tela de revisão
  ///
  /// In pt, this message translates to:
  /// **'Revise os dados da sua conversão'**
  String get reviewText;

  /// Título do item 1
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get item1TitleReview;

  /// Título do item 2
  ///
  /// In pt, this message translates to:
  /// **'Receber'**
  String get item2TitleReview;

  /// Título do item 3
  ///
  /// In pt, this message translates to:
  /// **'Câmbio'**
  String get item3TitleReview;

  /// Texto do botão de conclusão de conversão da tela de review
  ///
  /// In pt, this message translates to:
  /// **'Concluir conversão'**
  String get reviewButton;

  /// Título da tela de confirmação
  ///
  /// In pt, this message translates to:
  /// **'Conversão efetuada'**
  String get completeTitle;

  /// Subtitulo da tela de confirmação
  ///
  /// In pt, this message translates to:
  /// **'Conversão de moeda efetuada com sucesso!'**
  String get completeSubtitle;
}

class _TranslationFileDelegate extends LocalizationsDelegate<TranslationFile> {
  const _TranslationFileDelegate();

  @override
  Future<TranslationFile> load(Locale locale) {
    return SynchronousFuture<TranslationFile>(lookupTranslationFile(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationFileDelegate old) => false;
}

TranslationFile lookupTranslationFile(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TranslationFileEn();
    case 'pt': return TranslationFilePt();
  }

  throw FlutterError(
    'TranslationFile.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
