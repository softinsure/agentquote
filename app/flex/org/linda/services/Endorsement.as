package org.linda.services
{
	import org.frest.Fr;
	import org.ludo.utils.LudoUtils;

	public class Endorsement
	{
		public function Endorsement()
		{
		}
		public static function confirmEndorsement():void
		{
			LudoUtils.pageController.pageChanged=true;
			LudoUtils.modelController.quote.xmlstore.changed=true;
			LudoUtils.modelController.quote.bind();
			LudoUtils.modelController.quote.policy.endorsePolicy(LudoUtils.modelController.quote);
			Fr.crudTransactionQueue.actionAfterAllTransactions=actionAfterconfirm;
			//LudoUtils.modelController.quote.policy.changed=true;
			LudoUtils.pageController.updatePolicyHeaderToDB(LudoUtils.modelController.quote.policy.policyHeader,"update");
		}
		public static function rejectEndorsement():void
		{
			
		}
		public static function actionAfterconfirm():void
		{
			LudoUtils.pagesAndPropsController.setCutrrentPageAndProperties();
			LudoUtils.pageController.redrawAllPages();
			LudoUtils.pageController.redirectToPage("policyconfirmation");
		}
	}
}