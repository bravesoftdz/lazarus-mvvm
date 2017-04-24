unit vm.barang;

{$mode objfpc}{$H+}

interface

uses
  db, model.barang;

type

  { TVmBarang }

  TVmBarang = class
  private
    FBarang: TBarang;
    Fdata: TDataSet;
    function GetData: TDataSet;
  public
    constructor Create;
    destructor Destroy;
  published
    property Data: TDataSet read GetData;
  end;

implementation

{ TVmBarang }

function TVmBarang.GetData: TDataSet;
begin

end;

constructor TVmBarang.Create;
begin
  FData := TDataSet.Create(nil);
  FBarang := TBarang.Create();
end;

destructor TVmBarang.Destroy;
begin
  Fdata.Free;
end;

end.

