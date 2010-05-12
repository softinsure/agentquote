package org.linda.controllers
{
	import org.ludo.controllers.ActionController;
	import org.ludo.models.*;
	import org.ludo.utils.CurrentPage;
	import org.ludo.utils.LudoUtils;
	
	public dynamic class AdminController extends ActionController
	{
		public static function userAddInit():void
		{
			//check if new user 
			var user:User = LudoUtils.modelController.getModelToUpdate("user") as User;
			if(user.id==0)
			{
				CurrentPage.title="Create User";
				//CurrentPage.ediatableByID("login",true);
				CurrentPage.setRequiredFlag("password",true);
				CurrentPage.setRequiredFlag("passwordConf",true);
				CurrentPage.setValidationByID("password","string|required=true");
			}
			else
			{
				CurrentPage.title="Update User";
				//CurrentPage.ediatableByID("login",false);				
				CurrentPage.setRequiredFlag("password",false);
				CurrentPage.setRequiredFlag("passwordConf",false);
				CurrentPage.setValidationByID("password","string|required=false");
				CurrentPage.setValidationByID("passwordConf","string|required=false");
			}
		}
		public static function agencyAddInit():void
		{
			var agency:Agency = LudoUtils.modelController.getModelToUpdate("agency") as Agency;
			if(agency.id==0)
			{
				CurrentPage.title="Create Agency";
			}
			else
			{
				CurrentPage.title="Update Agency";
			}
		}
		public static function groupActivityAddInit():void
		{
			var groupactivity:GroupActivity = LudoUtils.modelController.getModelToUpdate("groupactivity") as GroupActivity;
			if(groupactivity.id==0)
			{
				//
				CurrentPage.title="Create Group";
			}
			else
			{
				if(groupactivity.editable=="N")
				{
					CurrentPage.enableByID("status",false);
					CurrentPage.enableByID("editable",false);
					CurrentPage.ediatableByID("description",false);
				}
				CurrentPage.ediatableByID("activity_code",false);
				CurrentPage.title="Update Agency";
			}
		}
		public static function agentAddInit():void
		{
			var agency:Agent = LudoUtils.modelController.getModelToUpdate("agent") as Agent;
			if(agency.id==0)
			{
				CurrentPage.title="Create Agent";
			}
			else
			{
				CurrentPage.title="Update Agent";
			}
		}
	}
}