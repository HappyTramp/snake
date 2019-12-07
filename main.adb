with Ada.Text_IO;
use  Ada.Text_IO;

with SDL;
with SDL.Error;
with SDL.Video.Renderers;
with SDL.Video.Windows;

with SDL.Timers;

with SDL.Video.Windows.Makers;
use  SDL.Video.Windows.Makers;

with SDL.Video.Renderers.Makers;
use  SDL.Video.Renderers.Makers;


procedure Main is
	window:   SDL.Video.Windows.Window;
	renderer: SDL.Video.Renderers.Renderer;
begin
	if not SDL.Initialise then
		Put(SDL.Error.Get);
		return;
	end if;

	Create(window, "bonjour", 10, 10, 400, 400);
	Create(renderer, window);

	SDL.Timers.Wait_Delay(1000);




	SDL.Finalise;
end Main;
