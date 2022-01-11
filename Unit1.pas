unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,ElAES, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    CopyButton: TButton;
    CustomEditBox: TEdit;
    DecRadioButton: TRadioButton;
    GenerateButton: TButton;
    HexRadioButton: TRadioButton;
    LengthTextBox: TEdit;
    SerialTextBox: TMemo;
    Edit5: TEdit;
    Button3: TButton;
    Edit6: TEdit;
    mmo1: TMemo;
    mmo2: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure GenerateButtonClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
 function StringToHex(S: AnsiString): AnsiString; forward;
function HexToString(S: AnsiString): AnsiString; forward;
implementation

{$R *.dfm}

uses Unit3;

function StringToHex(S: AnsiString): AnsiString;
var
	i: integer;

begin
  Result := '';

  // Go throught every single characters, and convert them
  // to hexadecimal...
	for i := 1 to Length( S ) do
  	Result := Result + IntToHex( byte( S[i] ), 2 );
end;

function HexToString(S: AnsiString): AnsiString;
var
	i: integer;

begin
  Result := '';

  // Go throught every single hexadecimal characters, and convert
  // them to ASCII characters...
  for i := 1 to Length( S ) do
  begin
    // Only process chunk of 2 digit Hexadecimal...
  	if ((i mod 2) = 1) then
	  	Result := Result + AnsiChar( StrToInt( '0x' + Copy( S, i, 2 )));
  end;
end;

Function GenerateRandLetter(UC:boolean):Char;
var
myCase:byte;
Begin
if UC= true then
mycase:= 0
else
myCase:=$20;
  result:=chr(random(26)+$41+myCase);
End;


procedure TForm1.Button1Click(Sender: TObject);
var
  Source: TMemoryStream;
  Dest: TMemoryStream;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;
  str: ansistring;
begin
  // Encryption
  Refresh;
  Source := TMemoryStream.Create();
  Dest   := TMemoryStream.Create();

  try
    // Save data to memory stream...
    Source.Write(PAnsiChar(AnsiString(Edit1.Text+edit4.Text+edit5.Text))^, length(Edit1.Text+edit4.Text+edit5.Text));
    Source.Position := 0;
    Size := Source.Size;
    Dest.WriteBuffer( Size, SizeOf(Size) );

    // Prepare key...
    FillChar( Key, SizeOf(Key), 0 );
    Move( PAnsiChar(AnsiString(Edit6.Text))^, Key, Min( SizeOf( Key ), Length( Edit6.Text ) ));

    // Start encryption...
    Start := GetTickCount;
    EncryptAESStreamECB( Source, 0, Key, Dest );
    Stop := GetTickCount;
    Refresh;

    // Display encrypted text using hexadecimals...
	  mmo1.Lines.BeginUpdate;
    Dest.Position := 0;
    setlength(str, Dest.Size);
    Dest.Read(PAnsiChar(str)^, Dest.Size);
    mmo1.Text := StringToHex( str );
	  mmo1.Lines.EndUpdate;

  finally
    Source.Free;
    Dest.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Source: TMemoryStream;
  Dest: TMemoryStream;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;
  str: AnsiString;
begin
  // Convert hexadecimal to a strings before decrypting...
  Source := TMemoryStream.Create( );
  Dest   := TMemoryStream.Create( );

  try
    str := HexToString( mmo1.Text );
    Source.Write(PAnsiChar(str)^, length(str));
    Source.Position := 0;
    // Start decryption...
    Size := Source.Size;
    Start := GetTickCount;
    Source.ReadBuffer(Size, SizeOf(Size));
    // Prepare key...
    FillChar(Key, SizeOf(Key), 0);
    Move(PAnsiChar(AnsiString(Edit6.Text))^, Key, Min(SizeOf(Key), Length(Edit6.Text)));
    // Decrypt now...
    DecryptAESStreamECB(Source, Source.Size - Source.Position, Key, Dest);
    Stop := GetTickCount;
    Refresh;
     // Display unencrypted text...
    Dest.position := 0;
    SetLength(str, dest.Size);
    Dest.Read(PAnsiChar(str)^, dest.Size);
    mmo2.Text := str;

  finally
    Source.Free;
    Dest.Free;
  end;
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm1.GenerateButtonClick(Sender: TObject);
var
serial,CustomStr: String;
CSlen, len,I: Cardinal;
begin
if combobox1.ItemIndex>-1 then begin
if length(LengthTextBox.text)>0 then begin
if DecRadioButton.Checked=True then begin
try
len:=strtoint(LengthTextBox.Text);
except
ShowMessage('"'+LengthTextBox.Text+'"! «·ÿÊ· €Ì— ’«·Õ');
exit;
end;

end
Else
if HexRadioButton.Checked=True then Begin
try
len:=strtoint('$'+LengthTextBox.Text);
except
ShowMessage('"'+LengthTextBox.Text+'"! «·ÿÊ· €Ì— ’«·Õ');
exit;
end

End Else exit;

if len>0 then begin
serial:='';
case combobox1.ItemIndex of
0: Begin  //0-9
for I := 1 to len do
serial:= serial + inttostr(random(10));
End;
1: begin //hex UC
for I := 1 to len do
serial := serial+inttohex(random(16),1);
end;
2: begin //hex lc
for I := 1 to len do
serial := serial+inttohex(random(16),1);
serial := lowercase(serial);
end;
3: begin //UC A-Z
for I := 1 to len do
serial:=serial+GenerateRandLetter(true);
end;
4: begin //lc a-z
for I := 1 to len do
serial:=serial+GenerateRandLetter(false);
end;
5: begin
for I := 1 to len do
  if random(2)=1 then
  serial:=serial+inttostr(random(10))
  else
  serial:=serial+GenerateRandLetter(true);
end;
6: begin
for I := 1 to len do
  if random(2)=1 then
  serial:=serial+inttostr(random(10))
  else
  serial:=serial+GenerateRandLetter(false);
end;
7:  begin
for I := 1 to len do
  if random(2)=1 then
  serial:=serial+inttostr(random(10))
  else
  if random(2)=1 then
   serial:=serial+GenerateRandLetter(true)
   else
   serial:=serial+GenerateRandLetter(false);
end;
8: Begin
CustomStr:=CustomEditBox.Text;
CSLen:=length(CustomStr);
if CSLen>0 then
for I := 1 to len do
Serial:=Serial+CustomStr[Random(CSLen)+1]
else Begin
  ShowMessage('');
  Exit;
End;
End;
end;
Edit4.Text:=serial;
SerialTextBox.Text:=serial;
end
else
ShowMessage('');
end
else
ShowMessage('ÌÃ» √‰ ÌﬂÊ‰ «·ÿÊ· √ﬂ»— „‰ 0');
end
else
ShowMessage('.«·—Ã«¡ «Œ Ì«— „Ã„Ê⁄… √Õ—› „‰ «·ﬁ«∆„… «·„‰”œ·…')
end;


var i:Integer;
    s:ansistring;
initialization
  s := '';
  for i := 0 to 255 do
    s := s + chr(i);
  Assert(HexToString(StringToHex(s)) = s);

end.
