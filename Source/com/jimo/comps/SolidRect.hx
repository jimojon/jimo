package com.jimo.comps;

import UInt;
import com.jimo.core.UIComponent;

class SolidRect extends UIComponent
{
    @:isVar
    public var color(get, set):UInt = 0xcccccc;

    @:isVar
    public var elipse(get, set):Float = 0;


    public function new()
    {
        super();
    }

    function get_color():UInt {
        return color;
    }
    function set_color(value:UInt) {
        this.color = value;
        super.invalidate();
        return this.color;
    }

    function get_elipse():Float {
        return elipse;
    }
    function set_elipse(value:Float) {
        this.elipse = value;
        super.invalidate();
        return this.elipse;
    }

    override public function draw():Void
    {
        graphics.clear();
        graphics.beginFill(color);

        if(elipse == 0)
            graphics.drawRect(0, 0, width, height);
        else
            graphics.drawRoundRect(0, 0, width, height, elipse, elipse);

        graphics.endFill();

        super.draw();
        super.measure();
    }
}
