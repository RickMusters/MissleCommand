package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Turret extends MovieClip
	{
		public var angleRadian:Number;
		public var angleDegree:Number;
		private var turret:TurretArt = new TurretArt();
		public function Turret() 
		{
			addChild(turret);
			this.y = 600;

		}
		
		public function rotate():void
		{
			turret.rotation = angleDegree;
			angleRadian = Math.atan2(mouseY - turret.y, mouseX - turret.x);
			angleDegree = angleRadian * 180 / Math.PI;
			
		
		}
		
		public function get angle() : Number
		{
			return turret.rotation;
		}
		
	}

}