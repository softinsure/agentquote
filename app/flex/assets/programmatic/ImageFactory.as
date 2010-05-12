package assets.programmatic
{
	import flash.utils.getDefinitionByName;
	
	import mx.controls.Alert;
	
	public dynamic class ImageFactory
	{
		/*(
		public function Images()
		{
		}
		*/
		[Bindable]
		[Embed(source="/assets/logo/logomain.png")]
		public static var companyLogo:Class;
		[Bindable]
		[Embed(source="/assets/icons/edit16.png")]
		public static var editsmall:Class;
		
		[Bindable]
		[Embed(source="/assets/icons/view16.png")]
		public static var viewsmall:Class;

		[Bindable]
		[Embed(source="/assets/icons/delete16.png")]
		public static var deletesmall:Class;

		[Bindable]
		[Embed(source="/assets/icons/home.png")]
		public static var home:Class;

		[Bindable]
		[Embed(source="/assets/icons/comment.png")]
		public static var comment:Class;

		[Bindable]
		[Embed(source="/assets/icons/work.png")]
		public static var work:Class;

		[Bindable]
		[Embed(source="/assets/icons/quote.png")]
		public static var quote:Class;

		[Bindable]
		[Embed(source="/assets/icons/admin.png")]
		public static var admin:Class;

		[Bindable]
		[Embed(source="/assets/icons/error.png")]
		public static var error:Class;

		[Bindable]
		[Embed(source="/assets/icons/cross.png")]
		public static var cross:Class;

		[Bindable]
		[Embed(source="/assets/icons/validation.png")]
		public static var validation:Class;

		[Bindable]
		[Embed(source="/assets/icons/info.png")]
		public static var information:Class

		[Bindable]
		[Embed(source="/assets/icons/warning.png")]
		public static var warning:Class

		[Bindable]
		[Embed(source="/assets/icons/success.png")]
		public static var success:Class

		[Bindable]
		[Embed(source="/assets/icons/add.png")]
		public static var addfile:Class;

		[Bindable]
		[Embed(source="/assets/icons/delete.png")]
		public static var deletefile:Class;

		[Bindable]
		[Embed(source="/assets/icons/cancel.png")]
		public static var cancelfile:Class;

		[Bindable]
		[Embed(source="/assets/icons/get.png")]
		public static var getfile:Class;

		[Bindable]
		[Embed(source="/assets/icons/put.png")]
		public static var putfile:Class;

		[Bindable]
		[Embed(source="/assets/icons/go.png")]
		public static var gofile:Class;

		[Bindable]
		[Embed(source="/assets/icons/debug.png")]
		public static var debug:Class

		[Bindable]
		[Embed(source="/assets/icons/finder.png")]
		public static var finder:Class

		[Bindable]
		[Embed(source="/assets/icons/feedback.png")]
		public static var feedback:Class

		[Bindable]
		[Embed(source="/assets/icons/signout.png")]
		public static var signout:Class

		public static function getImageByName(imageName:String):Class
        {
        	switch(imageName.toLowerCase())//do a lowercase
        	{
        		case "validation":
        			return validation;
        			break;
        		case "information":
        			return information;
        			break;
        		case "warning":
        			return warning;
        			break;
        		case "success":
        			return success;
        			break;
        		case "error":
        			return error;
        			break;
        		case "companylogo":
        			return companyLogo;
        			break;
         		case "nochange":
        			return information;
        			break;
         		case "finder":
        			return finder;
        			break;
				case "home":
					return home;
					break;
				case "work":
					return work;
					break;
				case "quote":
					return quote;
					break;
				case "admin":
					return admin;
					break;
				case "cross":
					return cross;
					break;
				case "debug":
					return debug;
					break;
				case "comment":
					return comment;
					break;
				case "feedback":
					return feedback;
					break;
				case "signout":
					return signout;
					break;
				case "editsmall":
					return editsmall;
					break;
				case "viewsmall":
					return viewsmall;
					break;
				case "deletesmall":
					return deletesmall;
					break;
        		default:
         			var img:Class=getDefinitionByName(imageName) as Class;
         			if(img==null)
         			{
        				Alert.show(imageName+" not available in factory. Please add there to use!!");
               			throw new Error(imageName+" not available in factory. Please add there to use!!");
         			}
         			else
         			{
         				return img;
         			}
 					break;
        	}
        }

	}
}