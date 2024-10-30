import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class FACEView extends WatchUi.WatchFace {
  var isHighPower = true;

  function initialize() { WatchFace.initialize(); }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {}

  // Update the view
  function onUpdate(dc as Dc) as Void {
    View.onUpdate(dc);
    drawTime(dc);
    drawHeartRate(dc);
    drawSteps(dc);
    drawBattery(dc);
    drawDate(dc);
    // drawReferenceLines(dc);
  }

  function drawHeartRate(dc) {
    var geistFont = WatchUi.loadResource(Rez.Fonts.geist_26);
    var heartIcon = WatchUi.loadResource(Rez.Drawables.heartIcon);
    var heartRate = getHeartRateString();

    var centerX = dc.getWidth() / 2;
    var centerY = dc.getHeight() / 2;

    var iconWidth = 14;
    var spacing = 10;

    var textDimensions = dc.getTextDimensions(heartRate, geistFont);
    var textWidth = textDimensions[0];
    var textHeight = textDimensions[1];

    var totalWidth = iconWidth + spacing + textWidth;
    var startX = centerX - totalWidth / 2;

    var iconY = centerY - iconWidth / 2;
    var textY = centerY - textHeight / 2;
    var offsetY = 65;

    dc.drawBitmap(startX, iconY + offsetY, heartIcon);

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX + iconWidth + spacing, textY + offsetY, geistFont,
                heartRate, Graphics.TEXT_JUSTIFY_LEFT);
  }

  function drawSteps(dc) {
    var geistFont = WatchUi.loadResource(Rez.Fonts.geist_26);
    var stepsIcon = WatchUi.loadResource(Rez.Drawables.stepsIcon);
    var steps = getStepsString();

    var centerX = dc.getWidth() / 2;
    var centerY = dc.getHeight() / 2;

    var iconWidth = 14;
    var spacing = 10;

    var textDimensions = dc.getTextDimensions(steps, geistFont);
    var textWidth = textDimensions[0];
    var textHeight = textDimensions[1];

    var totalWidth = iconWidth + spacing + textWidth;
    var startX = centerX - totalWidth / 2;

    var iconY = centerY - iconWidth / 2;
    var textY = centerY - textHeight / 2;
    var offsetY = 107;

    dc.drawBitmap(startX, iconY + offsetY, stepsIcon);

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX + iconWidth + spacing, textY + offsetY, geistFont, steps,
                Graphics.TEXT_JUSTIFY_LEFT);
  }

  function drawBattery(dc) {
    var geistFont = WatchUi.loadResource(Rez.Fonts.geist_20);
    var lightIcon = WatchUi.loadResource(Rez.Drawables.lightIcon);
    var battery = getBatteryString();

    var centerX = dc.getWidth() / 2;
    var centerY = dc.getHeight() / 2;

    var iconWidth = 14;
    var spacing = 5;

    var textDimensions = dc.getTextDimensions(battery, geistFont);
    var textWidth = textDimensions[0];
    var textHeight = textDimensions[1];

    var totalWidth = iconWidth + spacing + textWidth;
    var startX = centerX - totalWidth / 2;

    var iconY = centerY - iconWidth / 2;
    var textY = centerY - textHeight / 2;
    var offsetY = 170;

    dc.drawBitmap(startX, iconY + offsetY, lightIcon);

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX + iconWidth + spacing, textY + offsetY, geistFont,
                battery, Graphics.TEXT_JUSTIFY_LEFT);
  }

  function drawDate(dc) {
    var geistFont = WatchUi.loadResource(Rez.Fonts.geist_26);
    var date = getDateString();

    var centerX = dc.getWidth() / 2;
    var centerY = dc.getHeight() / 2;

    var textDimensions = dc.getTextDimensions(date, geistFont);
    var textWidth = textDimensions[0];
    var textHeight = textDimensions[1];

    var totalWidth = textWidth;
    var startX = centerX - totalWidth / 2;

    var textY = centerY - textHeight / 2;
    var offsetY = -97;

    dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX, textY + offsetY, geistFont, date,
                Graphics.TEXT_JUSTIFY_LEFT);
  }

  function drawTime(dc) {
    var clockTime = System.getClockTime();
    var timeHourString = clockTime.hour.format("%02d");
    var timeMinString = clockTime.min.format("%02d");
    var timeSecString = clockTime.sec.format("%02d");


    var centerX = dc.getWidth() / 2;
    var centerY = dc.getHeight() / 2;

    var geistFont = WatchUi.loadResource(Rez.Fonts.geist_110);
    var geistFont20 = WatchUi.loadResource(Rez.Fonts.geist_20);


    var hourDimensions = dc.getTextDimensions(timeHourString, geistFont);
    var minDimensions = dc.getTextDimensions(timeMinString, geistFont);
    var secDimensions = dc.getTextDimensions(timeSecString, geistFont20);


    var spacing = 15;  
    var totalWidth = hourDimensions[0] + spacing + minDimensions[0];

    var startX = centerX - (totalWidth / 2) - 10;
    var offsetY = -70;
    var secOffsetY = -22;


    dc.setColor(0xAFCFFF, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX, centerY + offsetY, geistFont, timeHourString,
                Graphics.TEXT_JUSTIFY_LEFT);

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(startX + hourDimensions[0] + spacing, centerY + offsetY, geistFont,
                 timeMinString, Graphics.TEXT_JUSTIFY_LEFT);

    if(isHighPower) {
      dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
      dc.drawText(startX + hourDimensions[0] + spacing + minDimensions[0] + 10, centerY + secOffsetY, geistFont20,
                   timeSecString, Graphics.TEXT_JUSTIFY_LEFT);
    }
  }

 private
  function drawReferenceLines(dc as Dc) as Void {
    var WIDTH = dc.getWidth();
    var HEIGHT = dc.getHeight();

    dc.setPenWidth(1);

    dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    dc.fillRectangle(0, 0.5 * HEIGHT, WIDTH, 1);
    dc.fillRectangle(0.25 * WIDTH, 0, 1, HEIGHT);

    dc.fillRectangle(0.5 * WIDTH, 0, 1, HEIGHT);
    dc.fillRectangle(0.75 * WIDTH, 0, 1, HEIGHT);
  }

 private
  function getHeartRate() as Number {
    var heartrateIterator = Toybox.ActivityMonitor.getHeartRateHistory(1, true);
    return heartrateIterator.next().heartRate;
  }

 private
  function getHeartRateString() as String {
    return getHeartRate().format("%d");
  }

 private
  function getSteps() as Lang.Number ? {
    return Toybox.ActivityMonitor.getInfo().steps;
  }

 private
  function getStepsString() as String {
    var steps = getSteps();
    if (steps == null) {
      return "-";
    }
    return getSteps().format("%d");
  }

 private
  function getBattery() {
    var stats = System.getSystemStats();
    return stats.battery;
  }

 private
  function getBatteryString() as String {
    var battery = getBattery();
    if (battery == null) {
      return "-";
    }
    return getBattery().format("%d") + "%";
  }
 private
  function getDateString() as String {
    var timeOptions = { :currentTimeType => Time.CURRENT_TIME_DEFAULT};
    var now = Time.getCurrentTime(timeOptions);
    var info = Time.Gregorian.info(now, Time.FORMAT_SHORT);
    var months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    var days = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ];
    return Lang.format(
        "$1$ $2$. $3$",
        [ info.day, months[info.month - 1], days[info.day_of_week] ]);
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}

  // The user has just looked at their watch. Timers and animations may be
  // started here.
  function onExitSleep() as Void {
    isHighPower = true;
  }

  // Terminate any active timers and prepare for slow updates.
  function onEnterSleep() as Void {
    isHighPower = false;
  }
}
