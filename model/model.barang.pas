unit model.barang;

{$mode objfpc}{$H+}

interface

uses
  MyAccess, db, model;

Type

  { TBarang }

  TBarang = class(TModel)
  private
    FDb : TMyConnection;
    function GetAllBarang: TDataSet;
  public
    constructor Create(ADb: TMyConnection);
  published
    property AllBarang: TDataSet read GetAllBarang;
  end;


implementation

{ TBarang }

function TBarang.GetAllBarang: TDataSet;
var
  LData : TDataSet;
begin
  LData := TDataSet.Create(nil);
  LData := GetQuery('SELECT * FROM barang');
  LQUery := TMyQuery.Create(nil);
end;

constructor TBarang.Create(ADb: TMyConnection);
begin
  FDb := ADb;
end;

end.

