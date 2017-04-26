unit view.barang;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  ExtCtrls, StdCtrls, vm.barang, connection.dm;

type

  { TFrmBarang }

  TFrmBarang = class(TForm)
    BtnRefresh: TButton;
    DsBarang: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure BtnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FVmBarang: TVmBarang;
    procedure RefreshBarang;
    { private declarations }
  public
    { public declarations }
  end;

implementation

{$R *.lfm}

{ TFrmBarang }

procedure TFrmBarang.BtnRefreshClick(Sender: TObject);
begin
  RefreshBarang;
end;

procedure TFrmBarang.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FVmBarang.Free;
end;

procedure TFrmBarang.FormCreate(Sender: TObject);
begin
  FVmBarang := TVmBarang.Create(dm.MyCon);
end;

procedure TFrmBarang.RefreshBarang;
begin
  DsBarang.DataSet := FVmBarang.Data;
end;

end.

