with Ada.Text_IO;
use  Ada.Text_IO;

with Graphics;
use  Graphics;

with Queue;

with Game;

procedure Main is
	state: T_State;
begin
	-- SDL.Initialise;
	-- Create(window, "bonjour", 10, 10, 400, 400);
	-- Create(renderer, window);
	-- Set_Draw_Colour(renderer, (0, 0, 0, 255));
	-- Clear(renderer);
	-- Set_Draw_Colour(renderer, (255, 255, 255, 255));
	-- r := (10, 10, 100, 100);
	-- Fill(renderer, r);
	-- Present(renderer);
	-- SDL.Timers.Wait_Delay(1000);
	-- SDL.Finalise;
	--
	Init(state);
	Run(state);
	Quit(state);
end Main;
