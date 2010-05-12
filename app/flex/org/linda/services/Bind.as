package org.linda.services
{
	import org.frest.Fr;
	import org.ludo.models.Policy;
	import org.ludo.models.PolicyHeader;
	import org.ludo.utils.LudoUtils;

	public class Bind
	{
		/*
		public function CallAfterBind()
		{
		}
		*/
		public static function callAfterBindPolicy():void
		{
			createPolicy();
		}
		private static function createPolicy():void
		{
			//issue
			//get a new policy header for the new policy
			var aPolicyHeader:PolicyHeader=PolicyHeader.newPolicyHeader(Policy.newPolicy(LudoUtils.modelController.quote,true));
			LudoUtils.pageController.pageChanged=true;
			LudoUtils.modelController.quote.xmlstore.changed=true;
			LudoUtils.modelController.quote.bind();
			LudoUtils.modelController.policyHeader=aPolicyHeader;
			Fr.crudTransactionQueue.actionAfterAllTransactions=actionAfterBind;
			LudoUtils.pageController.updatePolicyHeaderToDB(aPolicyHeader);
			//LudoUtils.pageController.resetPage();
		}
		private static function actionAfterBind():void
		{
			LudoUtils.pagesAndPropsController.setCutrrentPageAndProperties();
			LudoUtils.pageController.redrawAllPages();
			LudoUtils.pageController.nextPageAfterIssue();
		}
	}
}