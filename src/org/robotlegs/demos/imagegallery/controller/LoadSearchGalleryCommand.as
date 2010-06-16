package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;

	public class LoadSearchGalleryCommand
	{
		private var event:GallerySearchEvent;
		
		private var service:IGalleryImageService;

        public function LoadSearchGalleryCommand(event:GallerySearchEvent, service:IGalleryImageService)
        {
            this.event = event;
            this.service = service;
        }

        public function execute():void
		{
			service.search(event.searchTerm);
		}
	}
}