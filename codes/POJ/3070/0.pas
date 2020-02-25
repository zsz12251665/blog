var
	matrix,power,tmp:array[1..4]of integer;
	n:longint;
begin
	read(n);
	while n<>-1 do
		begin
			matrix[1]:=1;// Initialize the matrixes
			matrix[2]:=1;
			matrix[3]:=1;
			matrix[4]:=0;
			power[1]:=1;
			power[2]:=0;
			power[3]:=0;
			power[4]:=1;
			while n>0 do// The fast power of matrix
				begin
					if n mod 2=1 then// Divide n into binary
						begin
							tmp[1]:=(power[1]*matrix[1]+power[2]*matrix[3]) mod 10000;// The multiplication of matrix
							tmp[2]:=(power[1]*matrix[2]+power[2]*matrix[4]) mod 10000;
							tmp[3]:=(power[3]*matrix[1]+power[4]*matrix[3]) mod 10000;
							tmp[4]:=(power[3]*matrix[2]+power[4]*matrix[4]) mod 10000;
							power[1]:=tmp[1];
							power[2]:=tmp[2];
							power[3]:=tmp[3];
							power[4]:=tmp[4];
						end;
					tmp[1]:=(matrix[1]*matrix[1]+matrix[2]*matrix[3]) mod 10000;// Square the matrix
					tmp[2]:=(matrix[1]*matrix[2]+matrix[2]*matrix[4]) mod 10000;
					tmp[3]:=(matrix[3]*matrix[1]+matrix[4]*matrix[3]) mod 10000;
					tmp[4]:=(matrix[3]*matrix[2]+matrix[4]*matrix[4]) mod 10000;
					matrix[1]:=tmp[1];
					matrix[2]:=tmp[2];
					matrix[3]:=tmp[3];
					matrix[4]:=tmp[4];
					n:=n div 2;
				end;
			writeln(power[2]);
			read(n);
		end;
end.
