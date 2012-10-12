package
{
  import org.flixel.*;
  import flash.display.StageDisplayState;

  public class MenuState extends FlxState
  {
    override public function create():void {
      FlxG.log("* initialized *");

      var b:FlxButton = new FlxButton(0,10, "Feed Post (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showFeedPostBox with object");
          G.api.kongregate.services.showFeedPostBox({content: "Mon groupe a atteint un nouveau lieu : la Croisée du Moulin ! Cliquez ici pour obtenir votre récompense !", image_uri: "http://i.imgur.com/zKOid.gif", kv_params:{kavinsky:"nightcall", black:"beans"}}, generateShoutCallback("Feed Post (O)"));
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height, "Feed Post (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showFeedPostBox with string");
          G.api.kongregate.services.showFeedPostBox("Super Feed Post! (S)", generateShoutCallback("Feed Post (S)"));
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height + 10, "PM Box (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showInvitationBox with object");
          G.api.kongregate.services.showInvitationBox({content: "Test PM (O)", image_uri: "http://i.imgur.com/zKOid.gif"}, generateShoutCallback("PM Box (O)"));
        });
      });
      add(b);

      b = new FlxButton(0, b.y + b.height, "PM Box (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showInvitationBox with string");
          G.api.kongregate.services.showInvitationBox("Test PM (S)", generateShoutCallback("PM Box (O)"));
        });
      });
      add(b);

      b = new FlxButton(100, 10, "Shout Box (O)", function():void {
        printTheError(function():void {
          FlxG.log("* showShoutBox with object");
          G.api.kongregate.services.showShoutBox({content: "Test Shout (O)"}, generateShoutCallback("Shout Box (O)"));
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height, "Shout Box (S)", function():void {
        printTheError(function():void {
          FlxG.log("* showShoutBox with string");
          G.api.kongregate.services.showShoutBox("Test Shout (S)", generateShoutCallback("Shout Box (S)"));
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height + 10, "PM (O)", function():void {
        printTheError(function():void {
          FlxG.log("* privateMessage with object");
          G.api.kongregate.services.privateMessage({content: "Test PM (O)"}, generateShoutCallback("PM (O)"));
        });
      });
      add(b);

      b = new FlxButton(b.x, b.y + b.height, "PM (S)", function():void {
        printTheError(function():void {
          FlxG.log("* privateMessage with string");
          G.api.kongregate.services.privateMessage("Test PM (S)", generateShoutCallback("PM (S)"));
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

      b = new FlxButton(FlxG.width/2 - b.width/2, b.y + b.height + 2, "FULLSCREEN!", function():void {
        printTheError(function():void {
          FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
        });
      });
      add(b);

      b = new FlxButton(FlxG.width/2 - b.width/2, b.y + b.height + 2, "Buy \"test\"", function():void {
        printTheError(function():void {
          G.api.kongregate.mtx.purchaseItems(["test"], onPurchaseResult);
        });
      });
      add(b);

      b = new FlxButton(FlxG.width - b.width, 10, "Shared Link", function():void {
        printTheError(function():void {
          var id:Number = Math.random();
          G.api.kongregate.services.sendSharedLink("8u77 " + id, "kv_softness=2&kv_roundness=6", "Little Big", "Butt", "July 11, 2021", {"Difficulty": "Hard", "Arena": "The Buttopolis"});
          FlxG.log("Created shared link with id '8u77 " + id + "'");
        });
      });
      add(b);


      b = new FlxButton(FlxG.width - b.width, b.y + b.height, "Print Params", function():void {
        printTheError(function():void {
          FlxG.log("params: " + G.api.paramObj);
          if(G.api.paramObj.kv_roundness && G.api.paramObj.kv_softness) {
            FlxG.log("Roundness: " + G.api.paramObj.kv_roundness);
            FlxG.log("Softness: " + G.api.paramObj.kv_softness);
          }
        });
      });
      add(b);

      FlxG.mouse.show();
    }

    public function generateShoutCallback(title:String):Function {
      return function(msg:Object):void {
        FlxG.log("=* Callback *=");
        FlxG.log(title);
        FlxG.log("type: " + msg.type);
        FlxG.log("recipients: " + msg.recipients);
        FlxG.log("success: " + msg.success);
        FlxG.log("error: " + msg.error);
      }
    }

    public function onPurchaseResult(result:Object):void {
      FlxG.log("Purchase success:" + result.success);
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
