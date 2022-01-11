unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Vcl.Dialogs,vcl.Forms;

type
  TDataModule2 = class(TDataModule)
    Fconn: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FconnAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  try
Fconn.Connected := False;
Fconn.Params.Clear;
Fconn.LoginPrompt := false;
Fconn.Params.DriverID := 'SQLite';
Fconn.Params.Add('Database'+'='+ExtractFilePath (application.ExeName)+'user.s3db');
//Fconn.Params.Values['Encrypt'] := 'aes-256'; //encrepty database
//Fconn.Params.Password := 'Fatwa@!alHoda';   //password database
Fconn.Connected := True;
  except
    on E: EDatabaseError do
      ShowMessage('ÕœÀ Œÿ√ «À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ' + E.Message);
  end;
end;

procedure TDataModule2.FconnAfterConnect(Sender: TObject);
begin
Fconn.ExecSQL ('CREATE TABLE IF NOT EXISTS user (ID_user INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Registration_number TEXT(26),cle_activation TEXT(150),periode_essai TEXT(40),hddserial TEXT(40))');
end;

end.
