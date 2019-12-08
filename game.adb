with Ada.Numerics.Discrete_Random;


package body Game is

	procedure Init(game: out T_Game;
		           width: Positive;
				   height: Positive) is
	begin
		game.width := width;
		game.height := height;
		game.direction := DIRECTION_RIGHT;
		Enqueue(game.snake, (2, 2));
		Enqueue(game.snake, (2, 3));
		game.food := (1, 1);
		Reset(game.width_generator);
		Reset(game.height_generator);
		Spawn_Food(game);
	end Init;

	function Next(game: in out T_Game) return Boolean is
		new_head: constant T_Position := Next_Head(game);
	begin
		if not In_Border(game, new_head) then
			return false;
		end if;
		Enqueue(game.snake, new_head);
		if new_head /= game.food then
			Dequeue(game.snake);
		else
			Spawn_Food(game);
		end if;
		return true;
	end Next;
	procedure Change_Direction(game: in out T_Game;
		                       direction: T_Direction) is
	begin
		case direction is
			when DIRECTION_UP =>
				if game.direction /= DIRECTION_DOWN then
					game.direction := direction;
				end if;
			when DIRECTION_DOWN =>
				if game.direction /= DIRECTION_UP then
					game.direction := direction;
				end if;
			when DIRECTION_LEFT =>
				if game.direction /= DIRECTION_RIGHT then
					game.direction := direction;
				end if;
			when DIRECTION_RIGHT =>
				if game.direction /= DIRECTION_LEFT then
					game.direction := direction;
				end if;
		end case;
	end Change_Direction;

	procedure Spawn_Food(game: in out T_Game) is
		function Valid_Food(game: T_Game; food: T_Position) return Boolean is
			cursor: T_List := game.snake.front;
		begin
			while cursor /= null loop
				if food = cursor.data then
					return false;
				end if;
				cursor := cursor.next;
			end loop;
			return true;
		end Valid_Food;

		food: T_Position;
	begin
		loop
			food := (random(game.height_generator), random(game.width_generator));
			exit when Valid_Food(game, food);
		end loop;
		game.food := food;
	end Spawn_Food;

	function Next_Head(game: T_Game) return T_Position is
		head: T_Position := game.snake.back.data;
	begin
		case game.direction is
			when DIRECTION_UP    => head.y := head.y - 1;
			when DIRECTION_DOWN  => head.y := head.y + 1;
			when DIRECTION_LEFT  => head.x := head.x - 1;
			when DIRECTION_RIGHT => head.x := head.x + 1;
		end case;
		return head;
	end Next_Head;

	function In_Border(game: T_Game; pos: T_Position) return Boolean is
	begin
		return pos.y >= 1 and pos.y <= game.height and pos.x >= 1 and pos.x <= game.width;
	end In_Border;

end Game;
