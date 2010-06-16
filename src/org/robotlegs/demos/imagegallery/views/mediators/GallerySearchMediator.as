/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.views.mediators
{
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Mediator;

	public class GallerySearchMediator extends Mediator implements IMediator
	{
		private var gallerySearch:GallerySearch;

		private var service:IGalleryImageService;

        public function GallerySearchMediator(gallerySearch:GallerySearch, service:IGalleryImageService)
        {
            this.gallerySearch = gallerySearch;
            this.service = service;
        }

        override public function onRegister():void
		{
			eventMap.mapListener( gallerySearch, GallerySearchEvent.SEARCH, handleSearch );
			
			gallerySearch.visible = gallerySearch.includeInLayout = service.searchAvailable;
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			eventDispatcher.dispatchEvent( event );
		}
	}
}