
import 'package:Remember/app/app.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateTheApp {
  static void showDialog(BuildContext context) {
    RateMyApp rateMyApp = RateMyApp(
      preferencesPrefix: 'Remember',
      minDays: 7,
      minLaunches: 10,
      remindDays: 7,
      remindLaunches: 10,
      googlePlayIdentifier: 'eu.gebes.remember.Remember',
      appStoreIdentifier: '1513544998',
    );
    
     rateMyApp.showRateDialog(
      context,
      title: Path('rate.title').get,
      message: Path('rate.message').get,
      rateButton: Path('rate.rateButton').get,
      noButton: Path('rate.noButton').get,
      laterButton: Path('rate.laterButton').get,
      listener: (button) { // The button click listener (useful if you want to cancel the click event).
        switch(button) {
          case RateMyAppDialogButton.rate:
            print('Clicked on "Rate".');
            break;
          case RateMyAppDialogButton.later:
            print('Clicked on "Later".');
            break;
          case RateMyAppDialogButton.no:
            print('Clicked on "No".');
            break;
        }
        
        return true; // Return false if you want to cancel the click event.
      },
      ignoreIOS: false, // Set to false if you want to show the Apple's native app rating dialog on iOS.
      dialogStyle: DialogStyle(), // Custom dialog styles.
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
      // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
      // actionsBuilder: (context) => [], // This one allows you to use your own buttons. 
    );
  }
}
