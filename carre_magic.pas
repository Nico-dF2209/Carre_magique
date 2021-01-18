program carre_magic;

uses crt;


{nb lignes et colonnes}
const Nb_lign_col=5;

{le tableau du carré magique}
TYPE carre_tab=array[1..Nb_lign_col, 1..Nb_lign_col] of integer;

var somme : integer;

{affiche le carré à l'écran }
procedure AffichCarre(tab:carre_tab; nb:integer);

	var i, j : integer;

	BEGIN

		for i:=1 to nb do
			begin
				for j:=1 to nb do
					begin
						write(tab[i,j], Nb_lign_col);
					end;
				writeln;
			end;
			writeln;
	END;


function VerifCarreMagique(tab:carre_tab; nb:integer): boolean;

	var i, j, somme, magic : integer;
		result : boolean;

	BEGIN

		result := true;

		{somme def par la diagonale}
		somme := 0;
		for i := 1 to nb do 
			begin
				somme := somme + tab[i,i];
			end;
		magic := somme;

		{voir si c'est bien la même dans les autres colonnes, lignes et dia}
		somme := 0;
		for i := 1 to nb do
			begin
				somme := somme + tab[i,nb-i+1];
			end;
		if somme <> magic then
			begin
				result := false;
			end;


		for i := 1 to nb do
			begin
				somme:= 0;
				for j := 1 to nb do
					begin
						somme := somme + tab[i,j];
					end;
				if somme <> magic then 
					begin
						result := false;
					end;
			end;


		for j := 1 to nb do
			begin
				somme:= 0;
				for i := 1 to nb do
					begin
						somme := somme + tab[i,j];
					end;
				if somme <> magic then 
					begin
						result := false;
					end;
			end;

		VerifCarreMagique := result;
	END;


function VraiCarre(tab : carre_tab; nb : integer): boolean;

	var i, j , k: integer;
		result : boolean;
		carre : array[1..(Nb_lign_col*Nb_lign_col)] of boolean;

	BEGIN
		result := true;
		{ init de tab }
		for k := 1 to nb*nb do carre[k] := false;

		{ parcours tableau }
		for i := 1 to nb do
			begin
				for j := 1 to nb do
					begin
						k := tab[i,j];
						if (k < 1) or (k > nb*nb) then 
							begin
								result := false 
							end
						else if carre[k] then 
							begin
								result := false 
							end
							else carre[k] := true; 
					end;
			end;
		VraiCarre := result;
	END;


BEGIN
	write('La somme magique est ', somme);
	readln(somme);
END.

