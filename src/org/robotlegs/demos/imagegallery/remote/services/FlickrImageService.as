/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.remote.services
{
    import org.robotlegs.demos.imagegallery.remote.services.adapters.IServiceAdapter;

	public class FlickrImageService extends GalleryImageServiceBase implements IGalleryImageService
	{
        public function FlickrImageService(adapter:IServiceAdapter)
        {
            super(adapter);
        }

        override public function get searchAvailable():Boolean
		{
			return true;
		}
	}
}