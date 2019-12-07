package body Queue is

	procedure Enqueue(queue: in out T_Queue; data: T_Data) is
		element: T_List_Node;
		new_back: T_List;
	begin
		element.data := data;
		element.next := null;
		new_back := new T_List_Node'(element);

		if Empty(queue) then
			queue.front := new_back;
			queue.back := new_back;
			return;
		end if;

		queue.back.next := new_back;
		queue.back := new_back;
	end Enqueue;

	procedure Dequeue(queue: in out T_Queue) is
	begin
		if Empty(queue) then
			return;
		end if;
		if queue.front.next = null then
			queue.front := null;
			queue.back := null;
			return;
		end if;
		queue.front := queue.front.next;
	end Dequeue;

	function Length(queue: T_Queue) return Natural is
		tmp: T_List := queue.front;
		i:   Natural := 0;
	begin
		while tmp /= null loop
			tmp := tmp.next;
			i := i + 1;
		end loop;
		return i;
	end Length;

	function Empty(queue: T_Queue) return Boolean is
	begin
		return queue.front = null and queue.back = null;
	end Empty;

end Queue;
