package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Main extends MovieClip
	{
		private var game:Game = new Game();
		private var startScherm:Startscherm = new Startscherm();
		private var start:Start = new Start();
		private var controls:Controls = new Controls();
		private var back:Back = new Back();
		private var controll:Controll = new Controll();
		public function Main() 
		{
			startScherm.x = 512
			startScherm.y = 390;
			start.x = 550;
			start.y = 390;
			controls.x = 530;
			controls.y = 480;
			back.x = 530;
			back.y = 620;
			controll.x = 512;
			controll.y = 300;
			
			
			addChild(startScherm);
			addChild(start);
			addChild(controls);
			
			start.addEventListener(MouseEvent.CLICK, startgame);
			controls.addEventListener(MouseEvent.CLICK, controlls);
			back.addEventListener(MouseEvent.CLICK, backk);
		}
		
		private function backk(e:MouseEvent):void 
		{
			if (contains(controll) && contains(back))
			{
				removeChild(controll);
				removeChild(back);
				addChild(start);
				addChild(controls);
			}
		}
		
		private function controlls(e:MouseEvent):void 
		{
			if (contains(start) && contains(controls))
			{
				removeChild(start);
				removeChild(controls);
				addChild(back);
				addChild(controll);
				
			}
		}
		
		private function startgame(e:MouseEvent):void 
		{
			if (contains(startScherm) && contains(start) && contains(controls))
			{
				removeChild(start);
				removeChild(controls);
				removeChild(startScherm);
				addChild(game);
			}
		}
		
	}

}