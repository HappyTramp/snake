with SDL;

with Game;


package Graphics is

	type T_State is record
		running:  Boolean;
		window:   SDL.Window;
		renderer: SDL.Renderer;
		game:     T_Game;
	end record;

	procedure EventHandler(

end Graphics;
