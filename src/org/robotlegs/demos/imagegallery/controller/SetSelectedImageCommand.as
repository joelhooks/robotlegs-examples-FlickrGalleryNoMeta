package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;

	public class SetSelectedImageCommand
	{
		private var event:GalleryImageEvent;
		
		private var proxy:GalleryModel;

        public function SetSelectedImageCommand(event:GalleryImageEvent, proxy:GalleryModel)
        {
            this.event = event;
            this.proxy = proxy;
        }

        public function execute():void
		{
			if(event.image)
				proxy.setSelectedImage(event.image);
		}
	}
}