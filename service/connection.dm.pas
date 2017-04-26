unit connection.dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, MyAccess;

type

  { Tdm }

  Tdm = class(TDataModule)
    MyCon: TMyConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.lfm}

{ Tdm }

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  MyCon.ConnectString := 'User ID=root;Password=server;Data Source=localhost;Database=test;Login Prompt=False';
  //MyCon.Open;
end;

end.

