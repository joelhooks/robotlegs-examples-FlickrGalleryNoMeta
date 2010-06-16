package org.robotlegs.demos.imagegallery.remote.services.adapters
{
    import com.adobe.webapis.flickr.FlickrService;
    import com.adobe.webapis.flickr.Photo;
    import com.adobe.webapis.flickr.events.FlickrResultEvent;
    import com.adobe.webapis.flickr.methodgroups.Photos;
    import com.adobe.webapis.flickr.methodgroups.helpers.PhotoSearchParams;

    import flash.events.IEventDispatcher;

    import org.robotlegs.demos.imagegallery.events.GalleryEvent;
    import org.robotlegs.demos.imagegallery.models.vo.Gallery;
    import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;

    public class FlickrLibAdapter implements IServiceAdapter
    {
        private var service:FlickrService;
        private var photos:Photos;
        private var dispatcher:IEventDispatcher;

        protected static const FLICKR_API_KEY:String = "516ab798392cb79523691e6dd79005c2";

        public function FlickrLibAdapter(dispatcher:IEventDispatcher)
        {
            this.dispatcher = dispatcher;
            service = new FlickrService(FLICKR_API_KEY);
        }

        public function loadGallery():void
        {
            service.addEventListener(FlickrResultEvent.INTERESTINGNESS_GET_LIST, handleSearchResult);
            service.interestingness.getList(null,"",20)
        }

        public function search(searchTerm:String):void
        {
            if(!photos)
                photos = new Photos(service);
            service.addEventListener(FlickrResultEvent.PHOTOS_SEARCH, handleSearchResult);
            var p:PhotoSearchParams = new PhotoSearchParams()
            p.text = searchTerm;
            p.per_page = 20;
            p.content_type = 1;
            p.media = "photo";
            p.sort = "date-posted-desc";
            photos.searchWithParamHelper(p);
        }

        protected function handleSearchResult(event:FlickrResultEvent):void
        {
            processFlickrPhotoResults(event.data.photos.photos);
        }

        protected function processFlickrPhotoResults(results:Array):void
        {
            var gallery:Gallery = new Gallery();

            for each(var flickrPhoto:Photo in results)
            {
                var photo:GalleryImage = new GalleryImage()
                var baseURL:String = 'http://farm' + flickrPhoto.farmId + '.static.flickr.com/' + flickrPhoto.server + '/' + flickrPhoto.id + '_' + flickrPhoto.secret;
                photo.thumbURL = baseURL + '_s.jpg';
                photo.URL = baseURL + '.jpg';
                gallery.photos.addItem( photo );
            }

            dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
        }
    }
}