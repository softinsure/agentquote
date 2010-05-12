package org.linda.services
{
	import org.common.utils.XDateUtil;
	import org.ludo.utils.LudoUtils;

	public class Common
	{
		public function Common()
		{
		}
		public static function proRataCalculation():void
		{
			var endrEffDt:Date=new Date();
			var effDt:Date=XDateUtil.getDate(LudoUtils.modelController.quote.policy_effective_date);
			var expDt:Date=XDateUtil.getDate(LudoUtils.modelController.quote.policy_expiration_date);
			LudoUtils.modelController.quote.prorated_premium=(LudoUtils.modelController.quote.quoted_premium-(100*LudoUtils.modelController.quote.offset_premium*(XDateUtil.dateDiff("d",endrEffDt,expDt)/XDateUtil.dateDiff("d",effDt,expDt)))/100);
			LudoUtils.modelController.quote.policy.policyHeader.last_endorsed_dt=XDateUtil.formatDateToString(endrEffDt);
		}
	}
}