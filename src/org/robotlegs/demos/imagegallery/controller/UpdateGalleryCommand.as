package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.mvcs.Command;

	public class UpdateGalleryCommand extends Command
	{
		private var event:GalleryEvent;
		
		private var galleryModel:GalleryModel;

        public function UpdateGalleryCommand(event:GalleryEvent, galleryModel:GalleryModel)
        {
            this.event = event;
            this.galleryModel = galleryModel;
        }

        override public function execute():void
		{			
			this.galleryModel.gallery = event.gallery;
		}
	}
}