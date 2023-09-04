import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kargomkolay_tracking_app/features/home/data/local/social_media_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/local/stepper_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/events_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/horizontal_model.dart';

class AppStrings {
  // global text
  static String yurtDisi(BuildContext context) {
    return AppLocalizations.of(context)!.titleTracking;
  }

  static String cargoWhere(BuildContext context) {
    return AppLocalizations.of(context)!.kargoWhere;
  }

  static String dropDownButtonEmptyText(BuildContext context) {
    return AppLocalizations.of(context)!.chooseACarrier;
  }

  static String homeKargoTakipContent(BuildContext context) {
    return AppLocalizations.of(context)!.kargoTakipContentDescription;
  }

  // hint messages
  static String hintText(BuildContext context) {
    return AppLocalizations.of(context)!.hintText;
  }

  // error Indicators
  static String emptyErrorMessage(BuildContext context) {
    return AppLocalizations.of(context)!.emptyErrorMessage;
  }

  static String noCarrierChosen(BuildContext context) {
    return AppLocalizations.of(context)!.noCarrierChosen;
  }

  static List<String> getFeatureList(BuildContext context) {
    return [
      AppLocalizations.of(context)!.kargomKolayFeatureList1,
      AppLocalizations.of(context)!.kargomKolayFeatureList2,
      AppLocalizations.of(context)!.kargomKolayFeatureList3,
      AppLocalizations.of(context)!.kargomKolayFeatureList4,
      AppLocalizations.of(context)!.kargomKolayFeatureList5,
      AppLocalizations.of(context)!.kargomKolayFeatureList6,
      AppLocalizations.of(context)!.kargomKolayFeatureList7,
    ];
  }

  static const List<String> kargomKolayCarrierCompanies = [
    "UPS",
    "DHL",
    "FedEx",
    "CargoMini"
  ];

  static List<String> getLanguages(BuildContext context) {
    return [
      "English",
      "Türkçe",
      "العربيه",
    ];
  }

  static String carrierCompany(BuildContext context) {
    return AppLocalizations.of(context)!.carrierCompany;
  }

  static String getDateTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.date;
  }

  static String getstatusTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.status;
  }

  static String gettrackingNumberTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.trackingNumber;
  }

  static String getMovementsTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.movements;
  }

  static String arabicUnSupport(BuildContext context) {
    return AppLocalizations.of(context)!.dhlArabicUnSupport;
  }

  static String continueInEnglish(BuildContext context) {
    return AppLocalizations.of(context)!.continueInEnglish;
  }

  static List<DrawerItemModel> socialMediaList(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return [
      DrawerItemModel(
        localization!.linkedIn,
        const Icon(FontAwesomeIcons.linkedin),
        'https://www.linkedin.com/company/drn-logistics/',
      ),
      DrawerItemModel(
        localization.facebook,
        const Icon(FontAwesomeIcons.facebook),
        'https://www.facebook.com/KargomKolay/',
      ),
      DrawerItemModel(
        localization.instagram,
        const Icon(FontAwesomeIcons.instagram),
        'https://www.instagram.com/kargomkolay/',
      ),
      DrawerItemModel(
        localization.twitter,
        const Icon(FontAwesomeIcons.twitter),
        'https://twitter.com/i/flow/login?redirect_after_login=%2Fkargomkolay',
      ),
      DrawerItemModel(
        localization.youtube,
        const Icon(FontAwesomeIcons.youtube),
        'https://www.youtube.com/channel/UCqiyiXdY-bFlD2ls9m-wkhg',
      ),
    ];
  }

  static List<DrawerItemModel> mainDrawerItemsList(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return [
      DrawerItemModel(
        localization!.website,
        const Icon(FontAwesomeIcons.globe),
        'https://www.kargomkolay.com/',
      ),
      // DrawerItemModel(
      //   localization.calculatePrice,
      //   const Icon(FontAwesomeIcons.calculator),
      //   'https://panel.kargomkolay.com/#/customer/priceCalculator',
      // ),
    ];
  }

  static String contactUs(BuildContext context) {
    return AppLocalizations.of(context)!.contactUs;
  }

  static String launchError(BuildContext context) {
    return AppLocalizations.of(context)!.lanuchError;
  }

  static String takePrice(BuildContext context) {
    return AppLocalizations.of(context)!.takePrice;
  }

  static String connectStore(BuildContext context) {
    return AppLocalizations.of(context)!.connectStore;
  }

  // static List<String> listOfTypes = ["import", "export"];

  static List<String> listOfTypes(BuildContext context) {
    return [
      AppLocalizations.of(context)!.import,
      AppLocalizations.of(context)!.export
    ];
  }

  static String importOrExport(int val, BuildContext context) {
    if (val == 1) {
      return AppLocalizations.of(context)!.import;
    } else {
      return AppLocalizations.of(context)!.export;
    }
  }

  static List<String> listOfCurrencies = [
    "EUR",
    "USD",
    "TRY",
    "GBP",
  ];

  static String tradeType(BuildContext context) {
    return AppLocalizations.of(context)!.tradeType;
  }

  static String chooseCurrency(BuildContext context) {
    return AppLocalizations.of(context)!.selectCurrency;
  }

  static String importString(BuildContext context) {
    return AppLocalizations.of(context)!.import;
  }

  static List<String> listOfDocsParcel(BuildContext context) {
    return [
      AppLocalizations.of(context)!.document,
      AppLocalizations.of(context)!.parcel
    ];
  }

  static String calculate(BuildContext context) {
    return AppLocalizations.of(context)!.calculate;
  }

  static String price(BuildContext context) {
    return AppLocalizations.of(context)!.price;
  }

  static String estimatedTime(BuildContext context) {
    return AppLocalizations.of(context)!.estimatedTime;
  }

  static String days(BuildContext context) {
    return AppLocalizations.of(context)!.days;
  }

  static String lowestPrice(BuildContext context) {
    return AppLocalizations.of(context)!.lowestPrice;
  }

  static String offerValidity(BuildContext context) {
    return AppLocalizations.of(context)!.validityDate;
  }

  static String addTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.add;
  }

  static String deleteTranslation(BuildContext context) {
    return AppLocalizations.of(context)!.delete;
  }

  static String requiredFieldsError(BuildContext context) {
    return AppLocalizations.of(context)!.errorRequiredFields;
  }

  static String dimensionsError(BuildContext context) {
    return AppLocalizations.of(context)!.errorDimensions;
  }

  static String receiver(BuildContext context) {
    return AppLocalizations.of(context)!.receiver;
  }

  static String sender(BuildContext context) {
    return AppLocalizations.of(context)!.sender;
  }

  static String weight(BuildContext context) {
    return AppLocalizations.of(context)!.weight;
  }

  static String height(BuildContext context) {
    return AppLocalizations.of(context)!.height;
  }

  static String length(BuildContext context) {
    return AppLocalizations.of(context)!.length;
  }

  static String width(BuildContext context) {
    return AppLocalizations.of(context)!.width;
  }

  static String chooseCountry(BuildContext context) {
    return AppLocalizations.of(context)!.chooseCountry;
  }

  static String returnedToSender(BuildContext context) {
    return AppLocalizations.of(context)!.returnedToSender;
  }

  static String notDelivered(BuildContext context) {
    return AppLocalizations.of(context)!.notDelivered;
  }

// unused
  static List<StepperModel> stepsStepper(EventsModel data) {
    List<String> steps = [
      "Label Created",
      "Picked Up",
      "In Customs",
      "Last Mile",
      "Delivered"
    ];

    List<StepperModel> stepperModelList = [];

    List<DataModel> reversedEvents = [];
    for (DataModel event in data.events) {
      reversedEvents.add(event);
    }

    reversedEvents = reversedEvents.reversed.toList();

    for (String step in steps) {
      int index = reversedEvents.indexWhere((element) {
        return element.status == step;
      });

      if (index > -1) {
        bool flag = false;
        for (StepperModel item in stepperModelList) {
          if (item.title == step) {
            flag = true;
            break;
          }
        }
        if (flag == false) {
          stepperModelList.add(StepperModel(step, true));
        }
      } else {
        break;
      }
    }

    final index = stepperModelList.length;

    for (int i = index; i < steps.length; i++) {
      stepperModelList.add(StepperModel(steps[i], false));
    }

    return stepperModelList;
  }

// the used one
  static List<DataModel> getStepperDataFormated(
      List<DataModel> data, BuildContext context) {
    final localization = AppLocalizations.of(context);

    int returnIndex = data.indexWhere((element) =>
        element.status == localization!.returnToSender ||
        element.status == localization.returnedToSender);

    if (returnIndex > -1) {
      return data;
    }

    List<String> steps = [
      localization!.labelCreated,
      localization.pickedUp,
      localization.enteredCustoms,
      localization.lastMile,
      localization.delivered
    ];

    List<DataModel> events = [];
    for (DataModel event in data) {
      events.add(event);
    }

    List<String> reversedStepsList = steps.reversed.toList();

    int index = -1;

    for (String step in reversedStepsList) {
      for (DataModel data in events) {
        if (data.status == step) {
          index = steps.indexOf(step);
          break;
        }
      }
      if (index > -1) {
        break;
      }
    }

    for (int i = index + 1; i < steps.length; i++) {
      events.insert(
        0,
        DataModel(
            description: null,
            status: steps[i],
            timestamp: DateTime.now().toIso8601String(),
            isActive: false),
      );
    }

    return events;
  }

  // Label Created - In Transit - Delivered/ReturedToSender/Not Delivered

  static List<HorizontalModel> simpleStepperList(
      List<DataModel> data, BuildContext context) {
    final localization = AppLocalizations.of(context);

    // start traversing from the end
    // creating deep copy
    List<DataModel> resversedDataList = [];
    for (DataModel dataModel in data) {
      resversedDataList.add(dataModel);
    }
    resversedDataList = resversedDataList.reversed.toList();

    // switch cases will be improved later
    // returnedToSender
    int returnedToSenderCase = resversedDataList.indexWhere(
        (element) => element.status == localization!.returnedToSender);

    // create model with the label name and isActive
    if (returnedToSenderCase > -1) {
      return [
        HorizontalModel(localization!.labelCreated, true),
        HorizontalModel(localization.inTransit, true),
        HorizontalModel(localization.returnedToSender, true)
      ];
    }

    // for just Not Delivered
    int notDeliveredcase = resversedDataList
        .indexWhere((element) => element.status == localization!.notDelivered);

    // create model with the label name and isActive
    if (notDeliveredcase > -1) {
      return [
        HorizontalModel(localization!.labelCreated, true),
        HorizontalModel(localization.inTransit, true),
        HorizontalModel(localization.notDelivered, true)
      ];
    }

    // Delivered Case

    int deliveredCase = resversedDataList
        .indexWhere((element) => element.status == localization!.delivered);

    // create model with the label name and isActive
    if (deliveredCase > -1) {
      return [
        HorizontalModel(localization!.labelCreated, true),
        HorizontalModel(localization.inTransit, true),
        HorizontalModel(localization.delivered, true)
      ];
    }

    int inTransitCase = resversedDataList
        .indexWhere((element) => element.status == localization!.inTransit);

    // create model with the label name and isActive
    if (inTransitCase > -1) {
      return [
        HorizontalModel(localization!.labelCreated, true),
        HorizontalModel(localization.inTransit, true),
        HorizontalModel(localization.delivered, false)
      ];
    }

    // just labeled created Case

    return [
      HorizontalModel(localization!.labelCreated, true),
      HorizontalModel(localization.inTransit, false),
      HorizontalModel(localization.delivered, false)
    ];
  }
}
