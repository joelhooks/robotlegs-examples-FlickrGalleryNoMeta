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
	import org.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Mediator;

	public class GalleryLabelMediator extends Mediator implements IMediator
	{
		private var view:GalleryLabel;

		private var service:IGalleryImageService;

        public function GalleryLabelMediator(galleryLabel:GalleryLabel, service:IGalleryImageService)
        {
            view = galleryLabel;
            this.service = service;
        }

        override public function onRegister():void
		{
            addContextListener(GallerySearchEvent.SEARCH, handleSearch );

            view.text = "interestingness";
			view.setVisibility(service.searchAvailable);
		}
		
		protected function setLabelText(value:String):void
		{
			view.text = value;
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			setLabelText(event.searchTerm);
		}
	}
}