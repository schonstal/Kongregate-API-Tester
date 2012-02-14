package
{
  import org.flixel.*;
  [SWF(width="640", height="480", backgroundColor="#000000")]
  [Frame(factoryClass="Preloader")]

  public class DerpGame extends FlxGame
  {
    public function DerpGame() {
      FlxG.debug = true;
      forceDebugger = true;
      FlxG.level = 0;
      super(320,240,MenuState,2);
    }
  }
}
