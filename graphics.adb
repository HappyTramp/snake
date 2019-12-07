with Ada.Text_IO;
use  Ada.Text_IO;

with Graphics;
use  Graphics;

with SDL;
with SDL.Timers;
with SDL.Events;
with SDL.Events.Events;
with SDL.Video.Windows;
with SDL.Video.Windows.Makers;
with SDL.Video.Renderers;
with SDL.Video.Renderers.Makers;

package body Graphics is

	procedure Init(state: out T_State) is
	begin
		if not SDL.Initialise then
			Put("Error");
		end if;
		SDL.Video.Windows.Makers.Create(state.window, WINDOW_TITLE, WINDOW_X, WINDOW_Y,
		                         WINDOW_WIDTH, WINDOW_HEIGHT);
		SDL.Video.Renderers.Makers.Create(state.renderer, state.window);
		state.running := true;
	end Init;

	procedure Quit(state: T_State) is
	begin
		SDL.Finalise;
	end Quit;

	procedure Run(state: in out T_State) is
	begin
		while state.running loop
			Event_Handler(state);
			Update(state);
			SDL.Timers.Wait_Delay(3);
		end loop;
	end Run;

	procedure Event_Handler(state: in out T_State) is
		event: SDL.Events.Events.Events;
	begin
		while SDL.Events.Events.Poll(event) loop
			case event.common.event_type is
				when SDL.Events.Quit => state.running := false;
				when others => null;
			end case;
		end loop;
		null;
	end Event_Handler;

	procedure Update(state: T_State) is
	begin
		null;
	end Update;

end Graphics;
