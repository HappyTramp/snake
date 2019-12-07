generic
	type T_Data is private;
package Queue is

	type T_List_Node;
	type T_List is access all T_List_Node;
	type T_List_Node is record
		data: T_Data;
		next: T_List;
	end record;

	type T_Queue is record
		front: T_List := null;
		back:  T_List := null;
	end record;

	procedure Enqueue(queue: in out T_Queue; data: T_Data);
	procedure Dequeue(queue: in out T_Queue);
	function Length(queue: T_Queue) return Natural;

private

	function Empty(queue: T_Queue) return Boolean;

end Queue;
