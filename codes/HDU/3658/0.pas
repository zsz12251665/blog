var
	matrix,answer,power,temp:array[1..104,1..104]of int64;
	t,ti,i,j,c:integer;
	m,sum:longint;
begin
	for i:=1 to 104 do// Construct the transition matrix
		for j:=1 to 104 do
			matrix[i,j]:=0;
	for i:=1 to 52 do// The difference of their ASCII code must not be greater than 32
		for j:=1 to 52 do
			if abs(i-j)<26 then
				begin
					matrix[i,j]:=1;
					matrix[i+52,j+52]:=1;
				end;
	for i:=1 to 26 do// The difference of their ASCII code is exactly 32
		begin
			matrix[78+i,i]:=1;
			matrix[52+i,26+i]:=1;
			matrix[78+i,52+i]:=1;
			matrix[52+i,78+i]:=1;
		end;
	read(t);
	for ti:=1 to t do
		begin
			read(m);
			dec(m);
			for i:=1 to 104 do// Initialize the answer matrix to the identity matrix
				begin
					for j:=1 to 104 do
						answer[i,j]:=0;
					answer[i,i]:=1;
				end;
			power:=matrix;// Initialize the power matrix
			while m>0 do// Calculate the power of matrix
				begin
					if m mod 2=1 then
						begin
							for i:=1 to 104 do
								for j:=1 to 104 do
									temp[i,j]:=0;
							for i:=1 to 104 do
								for j:=1 to 104 do
									for c:=1 to 104 do
										temp[i,j]:=(answer[i,c]*power[c,j]+temp[i,j]) mod 1000000007;
							answer:=temp;
						end;
					for i:=1 to 104 do
						for j:=1 to 104 do
							temp[i,j]:=0;
					for i:=1 to 104 do
						for j:=1 to 104 do
							for c:=1 to 104 do
								temp[i,j]:=(power[i,c]*power[c,j]+temp[i,j]) mod 1000000007;
					power:=temp;
					m:=m div 2;
				end;
			sum:=0;// Calculate the answer, which is the sum of a sub-matrix in the answer matrix
			for i:=53 to 104 do
				for j:=1 to 52 do
					sum:=(sum+answer[i,j]) mod 1000000007;
			writeln(sum);
		end;
end.
