unit view.main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls,view.barang;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    MenuUtama: TMainMenu;
    MiMaster: TMenuItem;
    MiBarang: TMenuItem;
    PageUtama: TPageControl;
    procedure MiBarangClick(Sender: TObject);
  private
    FBarang : TFrmBarang;
    procedure HapusFormTab(Sender: TObject; var CloseAction: TCloseAction);
    procedure TambahFormTab(AForm: TForm);
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

procedure TFrmMain.TambahFormTab(AForm: TForm);
var
  Tab: TTabSheet;
begin
  Tab := PageUtama.AddTabSheet;
  AForm.Parent := Tab;
  AForm.OnClose := @HapusFormTab;
  PageUtama.ActivePage := Tab;
  AForm.Show;
  Tab.Caption := AForm.Caption;
end;

procedure TFrmMain.HapusFormTab(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  TTabSheet(TForm(Sender).Parent).Free;
end;

procedure TFrmMain.MiBarangClick(Sender: TObject);
begin
  TambahFormTab(TFrmBarang.Create(nil));
end;

end.

