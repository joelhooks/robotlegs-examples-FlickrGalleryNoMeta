package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.mvcs.Command;

	public class SetSelectedImageCommand extends Command
	{
		private var event:GalleryImageEvent;
		
		private var proxy:GalleryModel;

        public function SetSelectedImageCommand(event:GalleryImageEvent, proxy:GalleryModel)
        {
            this.event = event;
            this.proxy = proxy;
        }

        override public function execute():void
		{
			if(event.image)
				proxy.setSelectedImage(event.image);
		}
	}
}