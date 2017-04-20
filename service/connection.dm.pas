unit connection.dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, MyAccess;

type

  { Tdm }

  Tdm = class(TDataModule)
    MyCon: TMyConnection;
    MyQuery1: TMyQuery;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.lfm}

end.

