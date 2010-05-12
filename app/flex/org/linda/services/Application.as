package org.linda.services
{
	import org.ludo.utils.LudoUtils;

	public class Application
	{
		/*
		public function CallAfterMakeApplication()
		{
		}
		*/
		public static function callAfterMakeApplication():void
		{
			LudoUtils.pageController.nextPage();
		}
	}
}