unit model;

{$mode objfpc}{$H+}

interface

uses
  MyAccess, db;

Type

  { TModel }

  TModel = class
  private
    Fdb: TMyConnection;
    FQuery: TMyQuery;
  protected
    function GetQuery(const ASql: String):TDataSet;
    procedure ExecQuery(const ASQL: String);
  public
    constructor Create(ADb: TMyConnection);
    destructor Destroy;
  published

  end;

implementation

{ TModel }

function TModel.GetQuery(const ASql: String): TDataSet;
var
  LQuery : TMyQuery;
begin
  LQuery:= TMyQuery.Create(Fdb);
  LQuery.Connection := Fdb;
  LQuery.Close;
  LQuery.SQL.Clear;
  LQuery.SQL.Text := ASql;
  LQuery.Open;

  Result := LQuery;
end;

procedure TModel.ExecQuery(const ASQL: String);
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := ASql;
  FQuery.ExecSQL;
end;

constructor TModel.Create(ADb: TMyConnection);
begin
  FDb := ADb;;
  FQuery:= TMyQuery.Create(ADb);
  FQuery.Connection := Fdb;
end;

destructor TModel.Destroy;
begin
  FQuery.Free;
end;

end.

