package org.robotlegs.demos.imagegallery.remote.services.adapters
{
import flash.events.IEventDispatcher;

import mx.rpc.AsyncToken;
    import mx.rpc.Responder;
    import mx.rpc.http.HTTPService;

    import org.robotlegs.demos.imagegallery.events.GalleryEvent;
    import org.robotlegs.demos.imagegallery.models.vo.Gallery;
    import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;

    public class XMLAdapter implements IServiceAdapter
    {
        protected static const BASE_URL:String = "assets/gallery/";

        private var dispatcher:IEventDispatcher;

        public function XMLAdapter(dispatcher:IEventDispatcher)
        {
            this.dispatcher = dispatcher;
        }

        public function loadGallery():void
        {
            var service:HTTPService = new HTTPService();
            var responder:Responder = new Responder(handleServiceResult, handleServiceFault);
            var token:AsyncToken;
            service.resultFormat = "e4x";
            service.url = BASE_URL+"gallery.xml";
            token = service.send();
            token.addResponder(responder);
        }

        public function search(searchTerm:String):void
        {
            trace("search is not available");
        }

        protected function handleServiceResult(event:Object):void
        {
            var gallery:Gallery = new Gallery();

            for each(var image:XML in event.result.image)
            {
                var photo:GalleryImage = new GalleryImage()
                photo.thumbURL = BASE_URL + "images/" + image.@name + '_s.jpg';
                photo.URL = BASE_URL + "images/" + image.@name + '.jpg';
                gallery.photos.addItem( photo );
            }

            dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
        }

        protected function handleServiceFault(event:Object):void
        {
            trace(event);
        }
    }
}