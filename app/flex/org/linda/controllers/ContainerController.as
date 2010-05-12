package org.linda.controllers
{
	import org.linda.containers.StartContainer;
	
	import org.linda.layouts.StartHeader;
	
	public class ContainerController
	{
		private static var containerController:ContainerController;
		public var startbox:StartContainer;
		public var startheader:StartHeader;
  		public static function getInstance():ContainerController
        {
            if (containerController == null)
            {
                containerController = new ContainerController();
            }
            return containerController;
        }
		public function ContainerController()
		{
			if (containerController!=null)
			{
                throw new Error("Only one containerController instance may be instantiated.");
   			}
		}

	}
}