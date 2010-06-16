package org.robotlegs.demos.imagegallery.remote.services.adapters
{
    public interface IServiceAdapter
    {
        function loadGallery():void;
        function search(searchTerm:String):void;
    }
}