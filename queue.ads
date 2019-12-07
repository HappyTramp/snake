generic
	type T_Data is limited private;
package Queue is

	type T_Queue is record
		front: T_List;
		back:  T_List;
	end record;

	type T_List_Cell;
	type T_List is access T_List_Cell;
	type T_List_Cell is record
		data: T_Data;
		next: T_List;
	end record;

	procedure Enqueue(queue: T_Queue;
		              data: T_Data);
	procedure Dequeue(queue: T_Queue);

end Queue;
