with Queue;

package Game is

	type T_Position is record
		x: Natural;
		y: Natural;
	end record;

	package P_Position_Queue is new Queue(T_Position);
	use P_Position_Queue;

	type T_Direction is (
		DIRECTION_UP,
		DIRECTION_DOWN,
		DIRECTION_LEFT,
		DIRECTION_RIGHT
	);

	type T_Game is record
		height:    Positive;
		width:     Positive;
		snake:     T_Queue;
		direction: T_Direction;
		food:      T_Position;
	end record;

	procedure Init(game: out T_Game;
		           width: Positive;
				   height: Positive);
	function Next(game: in out T_Game) return Boolean;

private

	procedure Spawn_Food(game: in out T_Game);
	function Next_Head(game: T_Game) return T_Position;
	function In_Border(game: T_Game; pos: T_Position) return Boolean;

end Game;
