package  
{
	/**
	 * ...
	 * @author Rick musters
	 */
	public class PlayerFactory 
	{
		
		public function PlayerFactory() 
		{
			
		}
		
		public function makePlayers(type:int, posX:Number, posY:Number, rot:Number):Turret
		{
			var player:Turret;
			if (type == 1)
			{
				player = new Turret;
			}
			
			player.x = posX;
			player.y = posY;
			player.rotation = rot;
			
		}
		
	}

}