package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Bullet extends MovieClip
	{
		private var bullet:BulletArt = new BulletArt();
		private var player:Turret = new Turret();
		public var speed:int = 8;
		public var damage:int = 1;
		public function Bullet() 
		{
			addChild(bullet);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			bullet.x += Math.cos(player.angle) * speed;
			bullet.y += Math.sin(player.angle) * speed;
			
		}
		
	}

}