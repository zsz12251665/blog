type
	student=
		record
			name:string;
			prize:integer;
		end;
var
	stu:array[1..100]of student;
	test,class,mxi,mxp,i,n:integer;
	officer,west,article:boolean;
	total:longint;
	s:string;
begin
	readln(n);
	total:=0;
	mxp:=-maxint;
	for i:=1 to n do
		begin
			readln(s);// Get the information of the student
			stu[i].name:=copy(s,1,pos(' ',s)-1);
			s:=copy(s,pos(' ',s)+1,255);
			val(copy(s,1,pos(' ',s)-1),test);
			s:=copy(s,pos(' ',s)+1,255);
			val(copy(s,1,pos(' ',s)-1),class);
			s:=copy(s,pos(' ',s)+1,255);
			officer:=(s[1]='Y');
			west:=(s[3]='Y');
			article:=(s[5]<>'0');
			stu[i].prize:=0;
			if (test>80)and article then// Check what prizee the student can win
				begin
					stu[i].prize:=stu[i].prize+8000;
					total:=total+800;
				end;
			if (test>85) and (class>80) then
				begin
					stu[i].prize:=stu[i].prize+4000;
					total:=total+400;
				end;
			if test>90 then
				begin
					stu[i].prize:=stu[i].prize+2000;
					total:=total+200;
				end;
			if (test>85)and west then
				begin
					stu[i].prize:=stu[i].prize+1000;
					total:=total+100;
				end;
			if (class>80)and officer then
				begin
					stu[i].prize:=stu[i].prize+850;
					total:=total+85;
				end;
			if mxp<stu[i].prize then// Keep the student who win the most prizees
				begin
					mxp:=stu[i].prize;
					mxi:=i;
				end;
		end;
	writeln(stu[mxi].name);
	writeln(stu[mxi].prize);
	writeln(total*10);
end.
