package org.linda.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.linda.controllers.ContainerController;
	import org.ludo.controllers.ErrorController;
	import org.ludo.utils.ConfigLoder;
	import org.ludo.utils.XmlLoder;
	
	public class LoadStartCommand implements ICommand
	{
		public function LoadStartCommand()
		{
		}

		public function execute(event : CairngormEvent) : void
		{
			//new ConfigLoder().loadXmlxByConfig("xmlstores/config/initialxmlstoload.xml",loadScreen);
            var xmlloader:XmlLoder=new XmlLoder();
            xmlloader.setFuncToBeCalledAfterLoad(loadScreen);
            //xmlloader.loadXmlxByConfig("xmlstores/initialxmlstoload.xml");              
			xmlloader.loadXmlxByConfig("config/initializers/initialxmlstoload.xml");              
        }

		public function loadScreen():void
		{
			//load top right bar
			ContainerController.getInstance().startheader.topLinkBar.addNavigator("toplinkbar");
			
			//.addNavigation(ChildInstanceManager.getNewInstanceByName("toplinkbar"));
       }
		public function fault(event : Object) : void
		{
			ErrorController.logErrorTwo("LoadStartCommand at fault: " + event.toString(),"Command","LoadStartCommand");
			ErrorController.showErrorMeassage("LoadStartCommand at fault: " + event);
		}
	}
}
