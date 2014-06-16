package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Missle extends MovieClip
	{
		private var enemy:MissleArt = new MissleArt();
		public var lijst:Array = new Array();
		public var life:int = 100;
		public function Missle() 
		{
			lijst.push(enemy);
			addChild(lijst[Math.floor(Math.random() * 4 )]);
			
		}
		
	}

}