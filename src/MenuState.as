package
{
  import org.flixel.*;

  public class MenuState extends FlxState
  {
    override public function create():void {
      FlxG.log("* initialized *");

      var b:FlxButton = new FlxButton(0,10, "Feed Post (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showFeedPostBox with object");
          G.api.kongregate.services.showFeedPostBox({content: "Super Feed Post! (O)", image_uri: "http://i.imgur.com/zKOid.gif"});
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height, "Feed Post (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showFeedPostBox with string");
          G.api.kongregate.services.showFeedPostBox("Super Feed Post! (S)");
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height + 10, "PM Box (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showPrivateMessageBox with object");
          G.api.kongregate.services.showPrivateMessageBox({content: "Test PM (O)", image_uri: "http://i.imgur.com/zKOid.gif"});
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height, "PM Box (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showPrivateMessageBox with string");
          G.api.kongregate.services.showPrivateMessageBox("Test PM (S)");
        });
      });
      add(b);

      b = new FlxButton(100, 10, "Shout Box (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showShoutBox with string");
          G.api.kongregate.services.showShoutBox({content: "Test Shout (O)"});
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height, "Shout Box (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showShoutBox with object");
          G.api.kongregate.services.showShoutBox("Test Shout (S)");
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height + 10, "PM (O)", function():void {
        printTheError(function():void {
          FlxG.log("* privateMessage with object");
          G.api.kongregate.services.privateMessage({content: "Test PM (O)"});
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height, "PM (S)", function():void {
        printTheError(function():void {
          FlxG.log("* privateMessage with string");
          G.api.kongregate.services.privateMessage("Test PM (S)");
        });
      });
      add(b);

      b = new FlxButton(FlxG.width/2 - b.width/2, b.y + b.height + 20, "API Status", function():void {
        printTheError(function():void {
          FlxG.log("* KONGREGATE API STATUS *");
          FlxG.log("* kongregate:");
          FlxG.log(G.api.kongregate);
          FlxG.log("* kongregate.services:");
          FlxG.log(G.api.kongregate.services);
          FlxG.log("* ==== *\n");
        });
      });
      add(b);

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
