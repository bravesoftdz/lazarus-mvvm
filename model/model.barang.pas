unit model.barang;

{$mode objfpc}{$H+}

interface

uses
  db, model;

Type

  { TBarang }

  TBarang = class(TModel)
  private
    function GetAllBarang: TDataSet;
  public

  published
    property AllBarang: TDataSet read GetAllBarang;
  end;


implementation

{ TBarang }

function TBarang.GetAllBarang: TDataSet;
begin
  Result := GetQuery('SELECT * FROM barang');
end;

end.

