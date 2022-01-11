object DataModule2: TDataModule2
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  PixelsPerInch = 96
  object Fconn: TFDConnection
    Params.Strings = (
      'Database=FATWA.s3db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FconnAfterConnect
    Left = 72
    Top = 14
  end
  object FDQuery1: TFDQuery
    Connection = Fconn
    Left = 72
    Top = 88
  end
end
