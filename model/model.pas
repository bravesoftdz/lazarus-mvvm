unit model;

{$mode objfpc}{$H+}

interface

uses
  MyAccess, db;

Type

  { TModel }

  TModel = class
  private
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
begin
  FQuery.Close;
  FQuery.SQL.Text := ASql;
  FQuery.Open;
end;

procedure TModel.ExecQuery(const ASQL: String);
begin
  FQuery.Close;
  FQuery.SQL.Text := ASql;
  FQuery.ExecSQL;
end;

constructor TModel.Create(ADb: TMyConnection);
begin
  FQuery:= TMyQuery.Create(nil);
  FQuery.Connection := ADb;
end;

destructor TModel.Destroy;
begin
  FQuery.Free;
end;

end.

