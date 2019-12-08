with SDL;
with SDL.Video.Windows;
with SDL.Video.Renderers;
with SDL.Video.Palettes;

with Game;
use  Game;

package Graphics is

	WINDOW_TITLE:  constant String := "Snake";
	WINDOW_X:      constant SDL.Natural_Coordinate := 10;
	WINDOW_Y:      constant SDL.Natural_Coordinate := 10;
	WINDOW_WIDTH:  constant SDL.Positive_Dimension := 400;
	WINDOW_HEIGHT: constant SDL.Positive_Dimension := 400;

	COLOR_WHITE:   constant SDL.Video.Palettes.Colour := (255, 255, 255, 255);
	COLOR_BLACK:   constant SDL.Video.Palettes.Colour := (0, 0, 0, 255);
	COLOR_RED:     constant SDL.Video.Palettes.Colour := (255, 0, 0, 255);
	COLOR_GREEN:   constant SDL.Video.Palettes.Colour := (0, 255, 0, 255);

	type T_State is record
		running:  Boolean;
		game:     T_Game;
		window:   SDL.Video.Windows.Window;
		renderer: SDL.Video.Renderers.Renderer;
	end record;

	procedure Init(state: out T_State);
	procedure Quit(state: T_State);
	procedure Run(state: in out T_State);

private

	procedure Event_Handler(state: in out T_State);
	procedure Update(state: in out T_State);
	procedure Draw_Square(state: in out T_State;
		                  pos: T_Position);
end Graphics;
