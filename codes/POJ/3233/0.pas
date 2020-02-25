var
	matrix,answer,multi,power,sum,temp:array[1..50,1..50]of int64;
	n,m,i,j,c:integer;
	k:longint;
begin
	read(n,k,m);
	for i:=1 to n do// Read the matrix A
		for j:=1 to n do
			begin
				read(matrix[i,j]);
				matrix[i,j]:=matrix[i,j] mod m;
			end;
	power:=matrix;// Initialize the 2^0 times of the matrix A, which is the matrix A
	sum:=matrix;// Initialize the sum of the first 2^0 times of the matrix A, which is the matrix A too
	fillchar(answer,sizeof(answer),0);// Initialize the answer matrix, which is the zero matrix
	fillchar(multi,sizeof(multi),0);// Initialize the multi matrix to the identity matrix
	for i:=1 to n do
		multi[i,i]:=1;
	while k>0 do// Conver k into binary
		begin
			if k mod 2=1 then
				begin
					for i:=1 to n do// Add the product of the sum and the multiplier to the answer
						for j:=1 to n do
							for c:=1 to n do
								answer[i,j]:=(multi[i,c]*sum[c,j]+answer[i,j]) mod m;
					fillchar(temp,sizeof(temp),0);// Update the multiplier
					for i:=1 to n do
						for j:=1 to n do
							for c:=1 to n do
								temp[i,j]:=(multi[i,c]*power[c,j]+temp[i,j]) mod m ;
					multi:=temp;
				end;
			temp:=sum;// Update the sum
			for i:=1 to n do
				for j:=1 to n do
					for c:=1 to n do
						temp[i,j]:=(sum[i,c]*power[c,j]+temp[i,j]) mod m;
			sum:=temp;
			fillchar(temp,sizeof(temp),0);// Update the power
			for i:=1 to n do
				for j:=1 to n do
					for c:=1 to n do
						temp[i,j]:=(power[i,c]*power[c,j]+temp[i,j]) mod m;
			power:=temp;
			k:=k div 2;
		end;
	for i:=1 to n do
		begin
			for j:=1 to n do
				write(answer[i,j],' ');
			writeln;
		end;
end.
