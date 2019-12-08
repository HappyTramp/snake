with Ada.Text_IO;
use  Ada.Text_IO;

with SDL;
with SDL.Timers;
with SDL.Video.Rectangles;
with SDL.Events;
with SDL.Events.Events;
with SDL.Video.Windows;
with SDL.Video.Windows.Makers;
with SDL.Video.Renderers;
with SDL.Video.Renderers.Makers;
use SDL.Video;

with Graphics, Game;
use  Graphics, Game;

with Interfaces.C;
use Interfaces.C;

package body Graphics is

	use P_Position_Queue;

	procedure Init(state: out T_State) is
	begin
		if not SDL.Initialise then
			Put("Error");
		end if;
		Windows.Makers.Create(state.window, WINDOW_TITLE, WINDOW_X, WINDOW_Y,
		                         WINDOW_WIDTH, WINDOW_HEIGHT);
		Renderers.Makers.Create(state.renderer, state.window);
		state.running := true;
		Init(state.game, 10, 10);
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

	procedure Update(state: in out T_State) is
		cursor: T_List := state.game.snake.front;
	begin
		Renderers.Set_Draw_Colour(state.renderer, COLOR_BLACK);
		Renderers.Clear(state.renderer);

		Renderers.Set_Draw_Colour(state.renderer, COLOR_WHITE);
		while cursor /= null loop
			Draw_Square(state, cursor.all.data);
			cursor := cursor.all.next;
		end loop;
		Renderers.Present(state.renderer);
	end Update;

	procedure Draw_Square(state: in out T_State;
		                  pos: T_Position) is
		rect: Rectangles.Rectangle;
	begin
		rect := ((C.int(pos.y) - 1) * 20, (C.int(pos.x) - 1) * 20, 20, 20);
		Renderers.Fill(state.renderer, rect);
	end Draw_Square;

end Graphics;
