package org.linda.controllers
{
	import org.linda.commands.LoadStartCommand;
	import org.ludo.controllers.EventController;

	public class ExtendedEventController extends EventController
	{
		public function ExtendedEventController()
		{
			super();
			initializeCommands();
		}

		private function initializeCommands() : void
		{
			addCommand(EventNames.LOAD_START, LoadStartCommand);
		}
	}
}
