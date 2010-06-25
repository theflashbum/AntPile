package  
{
	import flash.display.Bitmap;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;

	/**
	 * @author jessefreeman
	 */
	public class FlashTDDProject extends Sprite 
	{

		[Embed(source="../build/assets/hello_world.png")]

		private var HelloWorldImage : Class;

		public function FlashTDDProject() 
		{
			
			configureStage();
			
			var img : Bitmap = addChild(Bitmap(new HelloWorldImage())) as Bitmap;
			img.x = (stage.stageWidth * .5) - (img.width * .5);			img.y = (stage.stageHeight * .5) - (img.height * .5);
		}

		private function configureStage() : void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}
