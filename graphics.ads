with SDL;

-- with Game;
-- use  Game;

with SDL.Video.Windows.Makers;
use  SDL.Video.Windows.Makers;

with SDL.Video.Renderers.Makers;
use  SDL.Video.Renderers.Makers;

with SDL.Video.Renderers;
use  SDL.Video.Renderers;

with SDL.Video.Windows;
use  SDL.Video.Windows;

package Graphics is

	WINDOW_TITLE:  constant String := "Snake";
	WINDOW_X:      constant SDL.Natural_Coordinate := 10;
	WINDOW_Y:      constant SDL.Natural_Coordinate := 10;
	WINDOW_WIDTH:  constant SDL.Positive_Dimension := 400;
	WINDOW_HEIGHT: constant SDL.Positive_Dimension := 400;

	type T_State is record
		running:  Boolean;
		-- game:     T_Game;
		window:   SDL.Video.Windows.Window;
		renderer: SDL.Video.Renderers.Renderer;
	end record;

	procedure Init(state: out T_State);
	procedure Quit(state: T_State);
	procedure Run(state: in out T_State);
	procedure Event_Handler(state: in out T_State);
	procedure Update(state: T_State);
end Graphics;
