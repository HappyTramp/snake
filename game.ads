with Ada.Numerics.Discrete_Random;

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

	subtype T_Width_Random_Range is Positive range 1..10;
	subtype T_Height_Random_Range is Positive range 1..10;
	package P_Width_Random is new Ada.Numerics.Discrete_Random(T_Width_Random_Range);
	package P_Height_Random is new Ada.Numerics.Discrete_Random(T_Height_Random_Range);
	use P_Width_Random;
	use P_Height_Random;

	type T_Game is record
		height:    Positive;
		width:     Positive;
		snake:     T_Queue;
		direction: T_Direction;
		food:      T_Position;
		width_generator: P_Width_Random.Generator;
		height_generator: P_Height_Random.Generator;

	end record;

	procedure Init(game: out T_Game;
		           width: Positive;
				   height: Positive);
	function Next(game: in out T_Game) return Boolean;
	procedure Change_Direction(game: in out T_Game;
		                       direction: T_Direction);

private

	procedure Spawn_Food(game: in out T_Game);
	function Next_Head(game: T_Game) return T_Position;
	function In_Border(game: T_Game; pos: T_Position) return Boolean;

end Game;
