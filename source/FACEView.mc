import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class FACEView extends WatchUi.WatchFace {
  var font;
  var geist;
  var x;
  var y;

  function initialize() { WatchFace.initialize(); }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    // font = WatchUi.loadResource(Rez.Fonts.plantV);
    // geist = WatchUi.loadResource(Rez.Fonts.geist);
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {}

  // Update the view
  function onUpdate(dc as Dc) as Void {
    // dc.drawText(x, y,
    //             font,
    //             "12:34", Graphics.TEXT_JUSTIFY_CENTER);
    // Get and show the current time
    var clockTime = System.getClockTime();
    var timeHourString = Lang.format("$1$", [clockTime.hour.format("%02d")]);
    var timeMinString = Lang.format("$1$", [clockTime.min.format("%02d")]);

    // var hourView = View.findDrawableById("TimeHourLabel") as Text;
    // var minView = View.findDrawableById("TimeMinLabel") as Text;

    // hourView.setText(timeHourString);
    // minView.setText(timeMinString);

    // Call the parent onUpdate function to redraw the layout
    View.onUpdate(dc);

    drawReferenceLines(dc);
  }

 private
  function drawReferenceLines(dc as Dc) as Void {
    var WIDTH = dc.getWidth();
    var HEIGHT = dc.getHeight();

    dc.setPenWidth(1);

    // dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    // dc.drawRectangle(0.2 * WIDTH, 0.1 * HEIGHT, 0.6 * WIDTH, 0.8 * HEIGHT);
    // dc.drawRectangle(0.15 * WIDTH, 0.15 * HEIGHT, 0.7 * WIDTH, 0.7 * HEIGHT);
    // dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
    // dc.drawRectangle(0.1 * WIDTH, 0.2 * HEIGHT, 0.8 * WIDTH, 0.6 * HEIGHT);
    // dc.drawRectangle(0.05 * WIDTH, 0.3 * HEIGHT, 0.9 * WIDTH, 0.4 * HEIGHT);

    dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    // dc.fillRectangle(0, 0.3 * HEIGHT, WIDTH, 1);
    // dc.fillRectangle(0, 0.5 * HEIGHT, WIDTH, 1);
    // dc.fillRectangle(0, 0.7 * HEIGHT, WIDTH, 1);
    // dc.fillRectangle(0.25 * WIDTH, 0, 1, HEIGHT);

    // dc.fillRectangle(0.1 * WIDTH, 0, 1, HEIGHT);
    // dc.fillRectangle(0.9 * WIDTH, 0, 1, HEIGHT);

    // dc.fillRectangle(0.5 * WIDTH, 0, 1, HEIGHT);
    // dc.fillRectangle(0.75 * WIDTH, 0, 1, HEIGHT);

    // dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    // dc.fillRectangle(0.3333 * WIDTH, 0, 1, HEIGHT);
    // dc.fillRectangle(0.6666 * WIDTH, 0, 1, HEIGHT);
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}

  // The user has just looked at their watch. Timers and animations may be
  // started here.
  function onExitSleep() as Void {}

  // Terminate any active timers and prepare for slow updates.
  function onEnterSleep() as Void {}
}
