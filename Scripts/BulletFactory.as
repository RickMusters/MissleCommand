package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class BulletFactory extends MovieClip 
	{
		public function BulletFactory()
		{
			
		}
		
		public function MakeBullets(type : int, xpos:Number, ypos:Number, rot:Number,speed:int,damage:int) :Bullet
		{
			var bullet:Bullet;
			
			if (type == 1)
			{
				bullet = new Bullet();
			}
			
			bullet.x = xpos;
			bullet.y = ypos;
			bullet.rotation = rot;
			bullet.speed = speed;
			bullet.damage = damage;
			
			return bullet;
		}
		
		
	}

}