package org.linda.controllers
{
	import org.frest.collections.DataContainer;
	
	import mx.controls.Alert;
	
	import org.linda.navigators.TopLinkBar;
	
	//add class instance here here to get by name
	public dynamic class InstanceController extends InstanceManager
	{
		private static var classcontainer:DataContainer=new DataContainer();
		
		/*
		private static factory:Factory;
		public function Factory()
		{
		}
        public static function getInstance():Factory
        {
            if (factory == null)
            {
                factory = new Factory();
                classcontainer=new DataContainer();
            }
            return factory;
        }
        public function Factory()
		{
			if (factory!=null)
			{
                throw new Error("Only one Factory instance may be instantiated.");
            }
        }
        */
        public static function getNewInstanceByName(dynamicClass:String):*
        {
        	switch(dynamicClass.toLowerCase())//do a lowercase
        	{
        		case "toplinkbar":
        			return new TopLinkBar();
        			break;
        		default:
        			Alert.show(dynamicClass+" not available in factory. Please add there to use!!");
        			throw new Error(dynamicClass+" not available in factory. Please add there to use!!");
        		break;
        	}
        }
	}
}