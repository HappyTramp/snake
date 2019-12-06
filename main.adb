with Ada.Text_IO;
use  Ada.Text_IO;

with SDL;

procedure Main is
begin
	if not SDL.Initialise then
		Put("Error");
	end if;
end Main;
