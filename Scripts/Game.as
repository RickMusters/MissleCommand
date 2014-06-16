package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Game extends MovieClip
	{
		private var player:Turret = new Turret();
		private var launcher:Turret = new Turret();
		private var sniper:Turret = new Turret();
		private var bullets:Vector.<Bullet> = new Vector.<Bullet>();
		private var bulletfac:BulletFactory = new BulletFactory();
		private var fireTimer:Timer;
		private var launchTimer:Timer;
		private var rifleTimer:Timer;
		private var canFire:Boolean = true;
		private var launchBool:Boolean = true;
		private var rifleBool:Boolean = true;
		private var qPressed:Boolean = false;
		private var wPressed:Boolean = false;
		private var background:RoadArt = new RoadArt();
		private var turrets:TurretsArt = new TurretsArt();
		public var lives:int = 3;
		private var sky:SkyArt = new SkyArt();
		
		
		[Embed(source="../lib/Grenade-SoundBible.com-2124844747.mp3")]
		private var Launch:Class;
		
		[Embed(source="../lib/Rifle Gun Shot-SoundBible.com-1143231822.mp3")]
		private var Shot:Class;
		
		[Embed(source="../lib/M 82 Barrett 50 Cal-SoundBible.com-1062134043.mp3")]
		private var Rifle:Class;
		
		private var launch:Sound;
		private var shot:Sound;
		private var rifle:Sound;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			
			launch = new Launch();
			shot = new Shot();
			rifle = new Rifle();
			
			fireTimer = new Timer(300, 1);
			launchTimer = new Timer(1000, 1);
			rifleTimer = new Timer(1300, 1);
			
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerHandler);
			launchTimer.addEventListener(TimerEvent.TIMER, launchHandler);
			rifleTimer.addEventListener(TimerEvent.TIMER, rifleHandler);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, shoot);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			player.addEventListener(Event.ENTER_FRAME, loop);
			
			addChild(sky);
			addChild(player);
			addChild(launcher);
			addChild(sniper);
			addChild(turrets);
			addChild(background);
			
			sky.x = 512;
			sky.y = 320;
			
			turrets.x = 512;
			turrets.y = 660;
			background.x = 512;
			background.y = 720;
			
			launcher.x = 185;
			sniper.x = 835;
			player.x = 512;
			

			
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 81)
			{
				qPressed = false;
			}
			if (e.keyCode == 87)
			{
					wPressed = false;
			}
			
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 81)
			{
				qPressed = true;
			}
			if (e.keyCode == 87)
			{
				wPressed = true;
			}
		}
		
		private function rifleHandler(e:TimerEvent):void 
		{
			rifleBool = true;
		}
		
		private function launchHandler(e:TimerEvent):void 
		{
			launchBool = true;
		}
		
		private function fireTimerHandler(e:TimerEvent):void 
		{
			canFire = true;
		}
		
		
		private function loop(e:Event):void
		{
			/*if (Math.random() < 0.1)
			{
				var enemy:MovieClip = new Missle();
				enemy.x = 700 * Math.random() + 50;
				enemy.y = -300;
				addChild(enemy);
				enemy.addEventListener(Event.ENTER_FRAME, fall);
			}*/
			
			
			
			
			launcher.rotate();
			sniper.rotate();
			player.rotate();
			
		}
		
		/*private function fall(e:Event):void 
		{
			var target:MovieClip = MovieClip(e.target);
			target.y = Math.random() * 25 + 5;
		}*/
		
		private function shoot(e:MouseEvent):void
		{
			if (canFire && qPressed==false && wPressed == false)
			{
				shot.play();
				bullets.push(bulletfac.MakeBullets(1, player.x, player.y, player.angle,10,10));
				addChild(bullets[bullets.length -1]);
				canFire = false;
				fireTimer.start();
			}
			
			if (launchBool && qPressed && wPressed == false)
			{
				launch.play();
				bullets.push(bulletfac.MakeBullets(1, launcher.x, launcher.y, launcher.angle,8,25));
				addChild(bullets[bullets.length - 1]);
				launchBool = false;
				launchTimer.start();
			}
			
			if (rifleBool && wPressed && qPressed == false)
			{
				rifle.play();
				bullets.push(bulletfac.MakeBullets(1, sniper.x, sniper.y, sniper.angle,25,100));
				addChild(bullets[bullets.length -1]);
				rifleBool = false;
				rifleTimer.start();
			}
			
			
		}
		
	}

}