package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.mvcs.Command;

	public class LoadGalleryCommand
	{
		public var event:GalleryEvent;
		
		public var service:IGalleryImageService;

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