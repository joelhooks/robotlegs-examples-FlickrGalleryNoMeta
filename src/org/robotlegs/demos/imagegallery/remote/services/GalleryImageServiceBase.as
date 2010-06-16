package org.robotlegs.demos.imagegallery.remote.services
{
    import org.robotlegs.demos.imagegallery.remote.services.adapters.IServiceAdapter;
    
    public class GalleryImageServiceBase implements IGalleryImageService
    {
        private var adapter:IServiceAdapter;

        public function GalleryImageServiceBase(adapter:IServiceAdapter)
        {
            this.adapter = adapter;
        }

        public function loadGallery():void
        {
            adapter.loadGallery();
        }

        public function search(searchTerm:String):void
        {
            adapter.search(searchTerm);
        }

        public function get searchAvailable():Boolean
        {
            return true;
        }
    }
}