package com.jimo.core;

import flash.events.IEventDispatcher;
import flash.display.Sprite;
import flash.events.Event;

class UIComponent extends Sprite implements IEventDispatcher
{
    @:isVar
    public var measuredWidth(get, set):Float;

    @:isVar
    public var measuredHeight(get, set):Float;


    public var drawCount:UInt = 0;


    private var _width:Float = 100;
    private var _height:Float = 100;
    private var _color:Int = 0xCCCCCC;


    public function new()
    {
        super();

        if(stage != null){
            invalidate();
        }else{
            this.addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
        }
    }

    public function draw():Void
    {
        drawCount++;
        this.removeEventListener(Event.ENTER_FRAME, _invalidateCallback);
    }

    public function invalidate():Void
    {
        //trace(this, this.name, "invalidate");
        if(stage != null){
            if(!this.hasEventListener(Event.ENTER_FRAME))
                this.addEventListener(Event.ENTER_FRAME, _invalidateCallback);
        }
    }

    ////////////////////
    //
    // PROTECTED
    //
    ////////////////////

    private function measure():Void
    {
        measuredWidth = super.width;
        measuredHeight = super.height;
    }



    ////////////////////
    //
    // PRIVATE
    //
    ////////////////////

    private function _invalidateCallback(e:Event):Void {
        this.removeEventListener(Event.ENTER_FRAME, _invalidateCallback);
        draw();
    }

    private function _onAddedToStage(event:Event):Void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
        invalidate();
    }




    ////////////////////
    //
    // SPRITE NATIVE GETTERS / SETTERS
    //
    ////////////////////

    private function _setWidth(value:Float):Float
    {
        _width = value;
        invalidate();
        return _width;
    }

    private function _getWidth():Float
    {
        return _width;
    }


    private function _setHeight(value:Float):Float
    {
        _height = value;
        invalidate();
        return _height;
    }

    private function _getHeight():Float
    {
        return _height;
    }


    ////////////////////
    //
    // GETTERS / SETTERS
    //
    ////////////////////


    function set_measuredWidth(value:Float) {
        return this.measuredWidth = value;
    }
    function get_measuredWidth():Float {
        return measuredWidth;
    }


    function get_measuredHeight():Float {
        return measuredHeight;
    }
    function set_measuredHeight(value:Float) {
        return this.measuredHeight = value;
    }

    ////////////////////
    //
    // INTERNAL
    //
    ////////////////////

    /*
    * if you need to override width or height getter / setter
    * you will have to override _setWidth / _getWidth or _setHeight / _getHeight
    */

    @:getter(width) #if !flash override #end function get_width():Float {
        return _getWidth();
    }

    @:setter(width) #if !flash override #end function set_width(value:Float) {
        var f:Float = _setWidth(value);
        #if !flash return f;#end
    }

    @:getter(height) #if !flash override #end function get_height ():Float {
        return _height;
    }

    @:setter(height) #if !flash override #end function set_height (value:Float) {
        this._height = value;
        invalidate();
        #if !flash return this._height; #end
    }

}