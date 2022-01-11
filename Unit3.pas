unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,firedac.Stan.Param,data.DB,
  Vcl.ExtCtrls,System.Diagnostics,DateUtils,ElAES, Math ;  //System.Diagnostics,DateUtils,ElAES, Math

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    mmo1: TMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    tmrstpwatch: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure tmrstpwatchTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
 sw: TStopwatch;
 Stopwatch: TStopwatch;

  function HexToString(S: AnsiString): AnsiString; forward;
implementation

{$R *.dfm}

uses Unit2, Unit1;

  function HexToString(S: AnsiString): AnsiString;
var
	i: integer;
begin
  Result := '';
  for i := 1 to Length( S ) do
  begin
  	if ((i mod 2) = 1) then
	  	Result := Result + AnsiChar( StrToInt( '0x' + Copy( S, i, 2 )));
  end;
end;
 function getserial : string;
var v1,v2,v3,v4 : longword;
begin
asm
push edx push ecx push ebx push eax mov eax,2
db $f db $a2 mov v1,edx  mov v2,eax mov v3,ebx mov v4,ecx
pop eax pop ebx pop ecx  pop edx
end;
getserial :=
inttohex(v1,8)+'-'+inttohex(v2,8)+'-'+inttohex(v3,8)+'-'+inttohex(v4,8);
end;
function GetSerialIDEx: string;
var
VolumeSerialNumber : DWORD;
MaximumComponentLength : DWORD;
FileSystemFlags : DWORD;
SerialNumber : string;
begin
GetVolumeInformation('C:',nil,0,@VolumeSerialNumber,
MaximumComponentLength,
FileSystemFlags,nil,0);
SerialNumber := IntToHex(HiWord(VolumeSerialNumber), 4) +'-' +
IntToHex(LoWord(VolumeSerialNumber), 4);
Result:=SerialNumber;
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

procedure TForm3.BitBtn1Click(Sender: TObject);
var
Registration_number,periode_essai,cle_activation: String;
  Source: TMemoryStream;
  Dest: TMemoryStream;
  Start, Stop: cardinal;
  Size,startpos,endpos:integer;
  Key: TAESKey128;
  str: AnsiString;
begin
if not  (mmo1.Text='')  and  ( DataModule2.FDQuery1.IsEmpty = true )   then
begin
  Source := TMemoryStream.Create( );
  Dest   := TMemoryStream.Create( );
  try
    str := HexToString( mmo1.Text );
    Source.Write(PAnsiChar(str)^, length(str));
    Source.Position := 0;   Size := Source.Size;   Start := GetTickCount;
    Source.ReadBuffer(Size, SizeOf(Size));
    FillChar(Key, SizeOf(Key), 0);
    Move(PAnsiChar(AnsiString('motpass'))^, Key, Min(SizeOf(Key), Length('motpass')));
    DecryptAESStreamECB(Source, Source.Size - Source.Position, Key, Dest);
     Stop := GetTickCount;     Refresh;      Dest.position := 0;   SetLength(str, dest.Size);
    Dest.Read(PAnsiChar(str)^, dest.Size);
     finally
    Source.Free;
    Dest.Free;
  end;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user  where hddserial = :d');
DataModule2.FDQuery1.ParamByName('d').Value  := getserial;
DataModule2.FDQuery1.Open;
if DataModule2.FDQuery1.IsEmpty then   begin
startpos := Pos('lat="',str);
endpos := Length(str)-166;
Registration_number := Copy(str, startPos,endpos );

  if  not(Registration_number = Edit1.Text) then
 exit ;

startpos := Pos('lat="',str)+27;
endpos := Length(str)-42;
cle_activation := Copy(str, startPos,endpos );

startpos :=177;
endpos := Length(str);
 periode_essai := Copy(str, startPos,endpos );
 with DataModule2.FDQuery1 do
 begin
DataModule2.FDQuery1.Active := False;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('INSERT INTO user (Registration_number,cle_activation,periode_essai,hddserial) ');
DataModule2.FDQuery1.SQL.Add('VALUES(:Registration_number, :cle_activation, :periode_essai,:hddserial)');
DataModule2.FDQuery1.Params.ParamByName('Registration_number').Value := Registration_number;
DataModule2.FDQuery1.Params.ParamByName('cle_activation').Value := cle_activation;
DataModule2.FDQuery1.Params.ParamByName('periode_essai').Value := periode_essai  ;
DataModule2.FDQuery1.Params.ParamByName('hddserial').Value := getserial;
DataModule2.FDQuery1.ExecSQL;
mmo1.Color := clGreen;
end;
end;
end;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
sw := TStopwatch.StartNew;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user  where hddserial = :d');
DataModule2.FDQuery1.ParamByName('d').Value  := getserial;
DataModule2.FDQuery1.Open;

if DataModule2.FDQuery1.IsEmpty then   begin
showmessage('Ì—ÃÏ ‰”Œ «·—ﬁ„ Ê « ’«· »«·„»—„Ã · “ÊÌœﬂ »„› «Õ «· ›⁄Ì· „‰ ›÷·ﬂ');
end    else          begin

mmo1.Color := clGreen;
edit1.text:= TStringField(DataModule2.FDQuery1.FieldByName('Registration_number') ).AsString;

DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user where periode_essai <= 0');
DataModule2.FDQuery1.Open;

if  ( DataModule2.FDQuery1.RecordCount=0)then  begin
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user');
DataModule2.FDQuery1.Open;

Label1.Caption:=' '+ '»«ﬁÌ ⁄·Ï «‰ Â«¡ «·„œ… «· Ã—Ì»Ì…'+' '+ TStringField(DataModule2.FDQuery1.FieldByName('periode_essai') ).AsString+' '+ 'ÌÊ„' ;
end   else    begin
ShowMessage('«‰ Â  «·„œ… «· Ã—Ì»Ì… ');
Application.Terminate;
 DataModule2.FDQuery1.Delete;
end;
end;
 end;
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ( DataModule2.FDQuery1.IsEmpty = true )  then
    exit;

with DataModule2.FDQuery1 do
 begin
DataModule2.FDQuery1.Active := False;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('UPDATE user Set periode_essai= periode_essai-1 WHERE rowid = (SELECT rowid FROM user WHERE rowid LIMIT 1 )');
DataModule2.FDQuery1.ExecSQL;


 end;
end;

procedure TForm3.FormCreate(Sender: TObject);
 var serial: String;I: Cardinal;
begin

for I := 1 to 26 do
  if random(2)=1 then
  serial:=serial+inttostr(random(10))
  else
  if random(2)=1 then
   serial:=serial+GenerateRandLetter(true)
   else
   serial:=serial+GenerateRandLetter(false);
 edit1.Text:=serial;
end;

procedure TForm3.tmrstpwatchTimer(Sender: TObject);
begin
caption:=FormatDateTime('hh:mm:sss',sw.ElapsedMilliseconds/MSecsPerDay);   // 'hh:nn:ss:zzz'
if FormatDateTime(' hh:mm:ss',sw.ElapsedMilliseconds/MSecsPerDay) >=' 00:00:05' then begin
sw := TStopwatch.StartNew;
//  if ( DataModule2.FDQuery1.RecordCount=0 )  then
//    exit;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user where periode_essai <= 0');
DataModule2.FDQuery1.Open;

if  ( DataModule2.FDQuery1.RecordCount=0)then  begin
DataModule2.FDQuery1.Active := False;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('UPDATE user Set periode_essai= periode_essai-1 WHERE rowid = (SELECT rowid FROM user WHERE rowid LIMIT 1 )');
DataModule2.FDQuery1.ExecSQL;
DataModule2.FDQuery1.SQL.Clear;
DataModule2.FDQuery1.SQL.add('Select * from user');
DataModule2.FDQuery1.Open;

Label1.Caption:=' '+ '»«ﬁÌ ⁄·Ï «‰ Â«¡ «·„œ… «· Ã—Ì»Ì…'+' '+ TStringField(DataModule2.FDQuery1.FieldByName('periode_essai') ).AsString+' '+ 'ÌÊ„' ;
end   else    begin
ShowMessage('«‰ Â  «·„œ… «· Ã—Ì»Ì… ');
Application.Terminate;
DataModule2.FDQuery1.Delete;
end;  end;
end;
end.


