package org.linda.services
{
	import org.common.utils.XDateUtil;
	import org.frest.Fr;
	import org.ludo.controllers.ActionController;
	import org.ludo.utils.LudoUtils;
	import org.ludo.utils.XMLMapper;

	public class RaterService
	{
		/*
		public function CallRaterService()
		{
		}
		*/
		public static function callRater():void
		{
			//use here to call actual rater
			//the following codes are only for demo purpose
			//premiums are generated using some random number generation
			var totPrem:Number=0.00;
			for each(var coverage:XML in LudoUtils.xmlMapper.getNodeByXpath("PersAutoLineBusiness/PersVeh/Coverage"))
			{
				var prem:Number=Math.ceil(Math.random()*100);
				XMLMapper.setValueToNode(XMLMapper.getNodeByXpathAndRootNode(coverage,"CurrentTermAmt/Amt")[0],prem.toString());
				totPrem=totPrem+prem;
			}
			LudoUtils.modelController.quote.quoted_premium=totPrem;
			//save after rating
			if(!LudoUtils.pageController.changeDetail)
			{
				ActionController.setPaymentPlan();
			}
			updateQuoteWithPrem();
		}
		private static function updateQuoteWithPrem():void
		{
			//rated
			LudoUtils.modelController.quote.rated=true;
			LudoUtils.modelController.quote.needs_rating=false;
			LudoUtils.modelController.quote.last_rated_at=XDateUtil.getCurrentDate();
			LudoUtils.modelController.quote.changed=true;
			LudoUtils.modelController.quote.xmlstore.changed=true;
			//LudoUtils.modelController.quote.payment.changed=true;
			LudoUtils.pageController.pageChanged=true;
			Fr.crudTransactionQueue.actionAfterAllTransactions=LudoUtils.pageController.nextPageAfterRate;
			LudoUtils.pageController.updateQuoteToDB();
			LudoUtils.pageController.resetPage();
		}
	}
}