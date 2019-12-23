unit UTree;

interface

uses ComCtrls, Math, SysUtils, UNode, Contnrs;

type
  // Класс "Бинарное дерево"
  TTree = class
  private
    FRoot : TNode; // Корень дерева

  public
    // Создание пустого дерева
    constructor Create;
    // Разрушение дерева
    destructor Destroy; override;
    // Добавление элемента el в дерево
    procedure Add (el : TElem);
    // Проверка дерева на пустоту
    function IsEmpty : boolean;
    // Процедура очистки дерева
    procedure Clear;
    // Процедура генерации дерева-поиска из N элементов
    procedure RandomSearch (N : integer);
    // Процедура отображения элементов дерева на компонент TreeView
    procedure Show (TV : TTreeView);
    // Функция конвертирования дерева в строку (обход сверху-вниз)
    function Prefix : string;

    procedure AddRandom(el: TElem);

    procedure AllRandom(N: integer);

    function LevelsByQueue(lvl:integer):integer;
    function CountLevels(n:integer):integer;

  property root:TNode
  read FRoot write FRoot;

  end;

implementation

// Добавление элемента el в дерево
procedure TTree.Add(el: TElem);
begin
  if IsEmpty then
    FRoot:=TNode.Create(el)
  else
    FRoot.Add(el);
end;

//Рекурсивное решение
function TTree.CountLevels(n:integer):integer;
begin
  Result:=0;
  if (root <> nil) and (n>=1) then
    Result:= FRoot.CountLevel(n);
end;

function TTree.LevelsByQueue;
var
  Q : TQueue;
  node : TNode;
  cnt_cur: integer;
  i : integer;
begin
  Result:=0;
  if (FRoot <> nil) and (lvl>=1) then
    begin
      Q:=TQueue.Create;
      Q.Push(FRoot);
      cnt_cur:=1;
      Result:=1;
      while (Q.Count > 0) and (lvl > 1) do
        begin
          Result:=0;
          dec(lvl);
          for i:=1 to cnt_cur do
            begin
              node:= Q.Pop;
              if node.Left <> nil then
                begin
                  Q.Push(node.Left);
                  inc(Result);
                end;
              if node.Right <> nil then
                begin
                  Q.Push(node.Right);
                  inc(Result);
                end;
            end;
            cnt_cur:=Result;
        end;
      Q.Free;
    end;
end;

// Добавление элемента рандомного el в дерево
procedure TTree.AddRandom(el: TElem);
begin
  if IsEmpty then
    FRoot:=TNode.Create(el)
  else
    FRoot.AddRandom(el);
end;

// Процедура очистки дерева
procedure TTree.Clear;
begin
  FreeAndNil(FRoot)
end;

// Создание пустого дерева
constructor TTree.Create;
begin
  FRoot:=nil
end;

// Разрушение дерева
destructor TTree.Destroy;
begin
  Clear;
  inherited;
end;

// Проверка дерева на пустоту
function TTree.IsEmpty: boolean;
begin
  Result:=FRoot = nil
end;

// Функция конвертирования дерева в строку (обход сверху-вниз)
function TTree.Prefix: string;
begin
  Result:='';
  if FRoot<>nil then
    Result:=FRoot.Prefix
end;

// Процедура генерации дерева-поиска из N элементов
procedure TTree.RandomSearch(N: integer);
begin
  Clear;
  While N>0 do
    begin
     Add(RandomRange(minElem,MaxElem));
     dec(N)
  end
end;

// Процедура отображения элементов дерева на компонент TreeView
procedure TTree.Show(TV: TTreeView);
begin
  TV.Items.Clear;
  if not IsEmpty then
    FRoot.Show(TV, nil);
  TV.FullExpand;
end;

{Вспомогательная процедура генерации случайного дерева}
function RandomElem:integer;
begin
  result:=MinElem+random(MaxElem-Minelem);
end;

procedure TTree.AllRandom(N: integer);
begin
  while N > 0 do
    begin
     AddRandom(RandomElem);
     dec(N)
  end
end;


end.
