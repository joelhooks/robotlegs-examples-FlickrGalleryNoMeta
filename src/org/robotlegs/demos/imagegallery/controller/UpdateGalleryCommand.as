package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;

	public class UpdateGalleryCommand
	{
		private var event:GalleryEvent;
		
		private var galleryModel:GalleryModel;

        public function UpdateGalleryCommand(event:GalleryEvent, galleryModel:GalleryModel)
        {
            this.event = event;
            this.galleryModel = galleryModel;
        }

        public function execute():void
		{			
			this.galleryModel.gallery = event.gallery;
		}
	}
}