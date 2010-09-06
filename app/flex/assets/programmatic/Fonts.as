package assets.programmatic
{
	import flash.display.Sprite;
	import flash.text.Font;
	import flash.system.Security;
	
	public dynamic class Fonts extends Sprite
	{
		/**
		 *  Embed the fonts in all of their different variations that we want to have accessible.
		 *  Remeber that bold is a 'fontWeight' and italic is a 'fontStyle'.
		 *  The unicode range is the basic Latin 1 character set.
		 */    
		[Embed(source='assets/fonts/MYRIADAS.TTF', fontFamily='regular', fontName='regular', fontWeight="normal", mimeType="application/x-font-truetype", unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var regular:Class;  
		
		[Embed(source='assets/fonts/MYRIADAB.TTF', fontFamily='regularBold', fontName='regularBold',  fontWeight="bold", unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var regularBold:Class;
		
		[Embed(source='assets/fonts/MYRIAAMI.TTF', fontFamily='italic', fontName='italic',  fontStyle='italic', unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var italic:Class;
		
		[Embed(source='assets/fonts/MYRIAABI.TTF', fontFamily='italicBold', fontName='italicBold', fontWeight="bold",  fontStyle='italic', unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var italicBold:Class;
		
		[Embed(source='assets/fonts/PT_Sans_Caption.ttf', fontFamily='caption', fontName='caption', fontWeight="bold", unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var caption:Class;
		
		[Embed(source='assets/fonts/PT_Sans_Caption_Bold.ttf', fontFamily='captionBold', fontName='captionBold', fontWeight="bold", unicodeRange='U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E')]  
		public static var captionBold:Class;
		
		public function Fonts()
		{
			super();
			Security.allowDomain("*");
			registerFonts();
		}
		
		/**
		 *  Flash keeps a table of fonts available for embedding.
		 *  In order to let Flash know that we have loaded a new font
		 *  available for embedding, we need to register that font's class reference
		 *  with the Font class. 
		 * 
		 */  
		public function registerFonts():void{
			Font.registerFont(regular)
			Font.registerFont(regularBold)
			Font.registerFont(italicBold)
			Font.registerFont(italicBold)
			Font.registerFont(caption)
			Font.registerFont(captionBold)
		}
		
	}
}