package
{
  import org.flixel.*;

  public class MenuState extends FlxState
  {
    override public function create():void {
      var button:FlxButton = new StartButton(0,0);
      FlxG.log("initialized");
      button.onUp = function():void {
        printTheError(function():void {
          G.api.kongregate.services.showFeedPostBox("TEST Feed Post", "http://i.imgur.com/zKOid.gif");
        });
      }
      add(button);

      button = new StartButton(0, 50);
      button.onUp = function():void {
        printTheError(function():void {
          G.api.kongregate.services.showWhisperBox("TEST Whisper");
        });
      }
      add(button);

      button = new StartButton(0, 100);
      button.onUp = function():void {
        printTheError(function():void {
          FlxG.log("**kongregate:");
          FlxG.log(G.api.kongregate);
          FlxG.log("**kongregate.services:");
          FlxG.log(G.api.kongregate.services);
          FlxG.log("**calling showShoutBox:");
          G.api.kongregate.services.showShoutBox("TEST Shout");
        });
      }
      add(button);

      FlxG.mouse.show();
    }

    public function printTheError(callback:Function):void {
      try {
        callback();
      } catch(e:Error) {
        FlxG.log(e.getStackTrace());
      }
    }

    override public function update():void {
      printTheError(function():void {
        if(!G.api) (G.api = FlxG.stage.addChild(new KongApi()) as KongApi).init();
      });
      super.update();
    }
  }
}
