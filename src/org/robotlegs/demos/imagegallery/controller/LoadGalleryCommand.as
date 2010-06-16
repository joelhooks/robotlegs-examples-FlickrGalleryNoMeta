package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;

	public class LoadGalleryCommand
	{
		private var event:GalleryEvent;
		
		private var service:IGalleryImageService;

        public function LoadGalleryCommand(event:GalleryEvent, service:IGalleryImageService)
        {
            this.event = event;
            this.service = service;
        }

        public function execute():void
		{
			service.loadGallery();
		}
	}
}