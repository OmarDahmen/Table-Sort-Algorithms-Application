

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo2: TMemo;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    grp1: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;

    procedure SpeedButton1Click(Sender: TObject);
    procedure TriBulleCroissant (Sender: TObject);
    procedure TriBulleDecroissant (Sender: TObject);
    procedure OrderByInsertion(Sender: TObject);
    procedure OrderByInsertiondec(Sender: TObject);
    procedure OrderBySelection(Sender: TObject);
    procedure OrderBySelectiondec(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    Procedure RemplissageAleatoire (sender: Tobject);
    procedure RemplissageMemo2 (Sender: Tobject);


  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  Form1: TForm1;
  tab : array of real;

implementation

{$R *.DFM}


procedure TForm1.TriBulleCroissant (Sender: TObject);

var
lower, upper, last, encours : integer;
temp : variant;


begin
  lower := low(tab);
  upper := high(tab);

  for last := upper downto (lower+1) do
    begin
      for encours := lower to (last-1) do
        begin
          if (tab[encours] > (tab[encours+1])) then
            begin
              temp := Tab[encours];
              tab[encours] := tab[encours+1];
              tab[encours+1] := temp;
            end;
        end;
    end;
end;

procedure TForm1.OrderByInsertion(Sender: TObject);

var
   i, j : integer;
   value : real ;

begin
   for i := Low(Tab)+1 to High(Tab) do
  begin
    value := Tab[i];
    j := i;
    while Tab[j-1] > value do
    begin
      Tab[j] := Tab[j-1];
      j := j - 1 ;
    end;
    Tab[j] := value;
  end
end;

procedure TForm1.OrderByInsertiondec(Sender: TObject);

var
   i, j : integer;
   value : real ;

begin
   for i := Low(Tab)+1 to High(Tab) do
  begin
    value := Tab[i];
    j := i;
    while Tab[j-1] < value do
    begin
      Tab[j] := Tab[j-1];
      j := j - 1 ;
    end;
    Tab[j] := value;
  end
end;



procedure TForm1.OrderBySelection(Sender: TObject);
var i, j, l : integer;
k : real;
begin 
  for i := Low(Tab) to High(Tab)-1 do 
  begin 
    l := i; 
    for j := i+1 to High(Tab) do 
      if Tab[j] < Tab[l] then l := j; 
    k := Tab[l];
    Tab[l] := Tab[i]; 
    Tab[i] := k; 
  end; 
end;

procedure TForm1.OrderBySelectiondec(Sender: TObject);
var i, j, l : integer;
k : real;
begin 
  for i := Low(Tab) to High(Tab)-1 do 
  begin 
    l := i; 
    for j := i+1 to High(Tab) do 
      if Tab[j] > Tab[l] then l := j;
    k := Tab[l];
    Tab[l] := Tab[i]; 
    Tab[i] := k; 
  end; 
end;


procedure TForm1.TriBulleDecroissant (Sender: TObject);

var
lower, upper, last, encours : integer;
temp : variant;


begin
  lower := low(tab);
  upper := high(tab);

  for last := upper downto (lower+1) do
    begin
      for encours := lower to (last-1) do
        begin
          if (tab[encours] < (tab[encours+1])) then
            begin
              temp := Tab[encours];
              tab[encours] := tab[encours+1];
              tab[encours+1] := temp;
            end;
        end;
    end;
end;




Procedure TForm1.RemplissageAleatoire (sender: Tobject);

var
  i : integer;

begin



  Memo2.lines.clear;

  Memo2.visible:=false;


  setlength (tab, 16);



         tab[0]:= strtofloat(edit2.text);
         tab[1] := strtofloat(edit3.text);
         tab[2] := strtofloat(edit4.text);
         tab[3] := strtofloat(edit5.text);
         tab[4] := strtofloat(edit6.text);
         tab[5] := strtofloat(edit7.text);
         tab[6] := strtofloat(edit8.text);
         tab[7] := strtofloat(edit9.text);
         tab[8] := strtofloat(edit10.text);
         tab[9] := strtofloat(edit11.text);
         tab[10] := strtofloat(edit12.text);
         tab[11] := strtofloat(edit12.text);
          tab[12] := strtofloat(edit13.text);
          tab[13] := strtofloat(edit14.text);
          tab[14] := strtofloat(edit15.text);
          tab[15] := strtofloat(edit1.text);

end;

// Procédure de remplissage de memo2 (remplissage qui s'effectue aprés le tri)
procedure TForm1.RemplissageMemo2 (Sender: Tobject);

var
  i : integer;
  w : integer;
  chaine : String;

begin
  for i := 0 to 15 do
    begin
      
     chaine:='';
  for w := 1 to i do
        begin
          chaine:= chaine+'   |   '+floattostr(tab[w]);
        end;


    end;
    memo2.lines.add (chaine+'  |');
end;

// Procédure d'activation du bouton1 (Tri croissant)
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Form1.RemplissageAleatoire (Sender);

  if (RadioButton1.Checked) and (RadioButton3.Checked)
   then Form1.TriBulleCroissant (Sender)
   else if (RadioButton1.Checked) and (RadioButton4.Checked)
        then Form1.TriBulleDecroissant  (Sender)
        else if (RadioButton2.Checked)  and (RadioButton3.Checked)
        then Form1.OrderByInsertion(Sender)
        else if (RadioButton2.Checked) and (RadioButton4.Checked)
        then OrderByInsertiondec(Sender)
        else if (RadioButton5.Checked)  and (RadioButton3.Checked)
        then Form1.OrderBySelection(Sender)
        else if (RadioButton5.Checked)  and (RadioButton4.Checked)
        then Form1.OrderBySelectiondec(Sender);

        //else Form1.TriBulleCroissant (Sender);

  Form1.RemplissageMemo2 (sender);

  Memo2.visible:=True;
end;

// Procédure d'activation du bouton2 (Tri décroissant)
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Form1.RemplissageAleatoire (Sender);
  Form1.TriBulleDecroissant (Sender);
  Form1.RemplissageMemo2 (sender);

  Memo2.visible:=True;
end;


end.
