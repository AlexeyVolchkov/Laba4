{Узнать количество элементов на k уровне бинарного дерева. Корень считать 1
уровнем. Итеративно, рекурсивно}
unit UFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, UTree, UNode, ExtCtrls;

type
  TMainForm = class(TForm)
    myTree: TTreeView;
    edLevel: TEdit;
    btnClear: TButton;
    btnRand: TButton;
    btnTask: TButton;
    lCnt: TLabeledEdit;
    lbLevel: TLabel;
    edIter: TEdit; 
    Label1: TLabel;
    Label2: TLabel;
    edRek: TEdit;
    Label3: TLabel;
    procedure btnTrSerchClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnRandClick(Sender: TObject);
    procedure btnTaskClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  MainForm: TMainForm;
  Tree:TTree;

implementation

{$R *.dfm}


procedure TMainForm.btnTrSerchClick(Sender: TObject);
begin
  if (lCnt.text<>'') and (StrToInt(lCnt.text)>0) then
    begin
      Tree:=ttree.Create;
      Tree.RandomSearch(StrToInt(lCnt.text));
      Tree.Show(MainFrm.myTree);
    end
  else
    ShowMessage('Введите кол-во элементов');
end;

procedure TMainForm.btnClearClick(Sender: TObject);
begin
  myTree.Items.Clear;
  edLevel.Text:='';
  edRek.Text:='';
  edIter.Text:='';
end;

procedure TMainForm.btnRandClick(Sender: TObject);
var
  i:integer;
begin
  edLevel.Text:='';
  edRek.text:='';
  edIter.text:='';
  if (lcnt.Text<>'') and TryStrToInt(lCnt.text,i) and (i>0) then
    begin
      Tree:=ttree.Create;
      Tree.AllRandom(StrToInt(lCnt.text));
      Tree.Show(MainFrm.myTree);
    end
  else
    ShowMessage('Введите корректное кол-во элементов');
end;

procedure TMainForm.btnTaskClick(Sender: TObject);
var
  i,amount:integer;
  j:integer;
begin
  if TryStrToInt(edLevel.text,i) and (i>=1) then
    begin
      edRek.text:= IntToStr(Tree.CountLevels(i));
      edIter.text:= IntToStr(Tree.LevelsByQueue(i));
    end
  else
    ShowMessage('Введите корректный уровень');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  lcnt.Text:='8';
end;

end.
