unit vm.barang;

{$mode objfpc}{$H+}

interface

uses
  db, model.barang, MyAccess;

type

  { TVmBarang }

  TVmBarang = class
  private
    FBarang: TBarang;
    function GetData: TDataSet;
  public
    constructor Create(ADb: TMyConnection);
    destructor Destroy;
  published
    property Data: TDataSet read GetData;
  end;

implementation

{ TVmBarang }

function TVmBarang.GetData: TDataSet;
begin
  Result := FBarang.AllBarang;
end;

constructor TVmBarang.Create(ADb: TMyConnection);
begin
  FBarang := TBarang.Create(ADb);
end;

destructor TVmBarang.Destroy;
begin
  FBarang.Free;
end;

end.

