package org.linda.connectors
{
	import assets.programmatic.ImageFactory;
	
	import org.linda.controllers.AdminController;
	import org.linda.controllers.ExtendedActionController;
	import org.linda.services.Bind;
	import org.linda.services.Endorsement;
	import org.linda.services.Application;
	import org.linda.services.RaterService;
	import org.linda.services.Common;
	import org.ludo.connectors.ImageConnector;
	import org.ludo.controllers.ActionController;
	import org.ludo.utils.LudoUtils;
	
	public class ParentConnector
	{
		//define class references here
		private var imageFactory:ImageFactory;
		private var dummAdmin:AdminController;
		private var dummExtendedAC:ExtendedActionController;
		private var dummCommon:Common;
		public static function setConnectors():void
		{
			//ImageConnector.setMyFunction=ImageFactory.getImageByName;//LudoUtils.getFunctionReferenceByFullPath("childclass.ImageFactory.getImageByName");
			//ActionController.setAfterMakeApplicationFunction=CallAfterMakeApplication.callAfterMakeApplication; //LudoUtils.getFunctionReferenceByFullPath("org.linda.services.CallRaterService.callRater");
			//ActionController.setMyRaterFunction=CallRaterService.callRater; //LudoUtils.getFunctionReferenceByFullPath("org.linda.services.CallRaterService.callRater");
			//ActionController.setAfterBindFunction=CallAfterBind.callAfterBindPolicy; //LudoUtils.getFunctionReferenceByFullPath("org.linda.services.CallRaterService.callRater");
			referencedMethods();
		}
		private static function referencedMethods():void
		{
			//image connector
			LudoUtils.referencedMethods.referenceMethod("getimage",ImageFactory.getImageByName);
			//after produce
			LudoUtils.referencedMethods.referenceMethod("produce",Application.callAfterMakeApplication);
			//after bind
			LudoUtils.referencedMethods.referenceMethod("bind",Bind.callAfterBindPolicy);
			//call rater
			LudoUtils.referencedMethods.referenceMethod("rate",RaterService.callRater);
			//accept endorse ment
			LudoUtils.referencedMethods.referenceMethod("confirmendorsement",Endorsement.confirmEndorsement);
			//reject endorse ment
			LudoUtils.referencedMethods.referenceMethod("rejectendorsement",Endorsement.rejectEndorsement);
		}
	}
}