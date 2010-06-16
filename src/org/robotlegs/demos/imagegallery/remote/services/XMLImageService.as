package org.robotlegs.demos.imagegallery.remote.services
{
    import org.robotlegs.demos.imagegallery.remote.services.adapters.IServiceAdapter;

	public class XMLImageService extends GalleryImageServiceBase implements IGalleryImageService
	{
        public function XMLImageService(adapter:IServiceAdapter)
        {
            super(adapter);
        }

        override public function get searchAvailable():Boolean
		{
			return false;
		}
	}
}