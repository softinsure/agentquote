package org.linda.services
{
	import org.ludo.utils.LudoUtils;

	public class Produce
	{
		/*
		public function CallAfterMakeProduce()
		{
		}
		*/
		public static function callAfterMakeProduce():void
		{
			LudoUtils.pageController.nextPage();
		}
	}
}