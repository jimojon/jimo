package;

import com.jimo.comps.SolidRect;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Sprite;

class Main extends Sprite
{
    var rect1:SolidRect;
    var rect2:SolidRect;

	public function new () {

		super ();

        rect1 = new SolidRect();
        rect1.name = "rect1";
        rect1.addEventListener(MouseEvent.CLICK, onClick);
        rect1.x = 20;
        rect1.y = 20;
        rect1.width = 100;
        rect1.height = 100;
        rect1.color = 0xff0000;
        addChild(rect1);

        rect2 = new SolidRect();
        rect2.name = "rect2";
        rect2.addEventListener(MouseEvent.CLICK, onClick);
        rect2.x = 140;
        rect2.y = 20;
        rect2.width = 100;
        rect2.height = 100;
        rect2.color = 0xffaa00;
        addChild(rect2);
	}

    private function onClick(e:Event):Void
    {
        var c:SolidRect = cast(e.currentTarget, SolidRect);
        trace("draw call(s) on " + c.name + ": " + c.drawCount);

        c.width = 50 + (Math.random() * 50);
        c.height = 50 + (Math.random() * 50);
        c.elipse = Math.random() * 20;
    }


}