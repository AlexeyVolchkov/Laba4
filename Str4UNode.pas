unit UNode;

interface

uses ComCtrls, Math, SysUtils;

const
  MinElem = 0;
  MaxElem = 100;

type
  TElem = MinElem..MaxElem;

  TNode = class
  private
    FInfo : TElem;
    FLeft, FRight : TNode;
  protected
    // "������" ��� ��������� �������������� �����
    procedure SetInfo(const Value: Telem);
    // ������� ����������� ������������ �������� � ������
    function GetMin : TElem;
    // ������� ����������� ������������� �������� � ������
    function GetMax : TElem;

  public
    // �������� ���� ������
    constructor Create(el : TElem = MinElem);
    // ���������� �������� el � ������
    procedure Add (el : TElem);
    // ����������� ���� ������ �� ��������� TreeView
    procedure Show (TV : TTreeView; pn : TTreeNode);
    // ������� ��������������� ������ � ������ (����� ������-����)
    function Prefix : string;

    function CountLevel(level: integer):integer;

    procedure AddRandom(el: TElem);

    // ���������� ���� ������
    destructor Destroy; override;
    property Info : Telem read FInfo write SetInfo;
    property Left : TNode read FLeft write FLeft;
    property Right : TNode read FRight write FRight;
  end;


implementation

//����������� �������
function TNode.CountLevel(level: integer):integer;
begin
  result:= 0;
  if (level = 1) then
    result:= 1
  else
    begin
      if self.FLeft <> nil then
        Result:= Result + self.FLeft.CountLevel(level - 1);
      if self.FRight <> nil then
        Result:= Result + self.FRight.CountLevel(level - 1);
    end;
end;



// ���������� �������� el � ������
procedure TNode.Add(el: TElem);
begin
  if el<FInfo then
    if FLeft = nil then
      FLeft:=TNode.Create(el)
    else
      FLeft.Add(el)
  else
    if FRight = nil then
      FRight:=TNode.Create(el)
    else
      FRight.Add(el)
end;

// ���������� �������� ���������� el � ������
procedure TNode.AddRandom(el: TElem);
begin
  if Random(2)=0 then
    if FLeft = nil then
      FLeft:=TNode.Create(el)
    else
      FLeft.AddRandom(el)
  else
    if FRight = nil then
      FRight:=TNode.Create(el)
    else
      FRight.AddRandom(el)
end;


// �������� ���� ������
constructor TNode.Create(el: TElem);
begin
  inherited Create;
  FInfo:=el;
  FLeft:=nil;
  FRight:=nil;
end;

// ���������� ���� ������
destructor TNode.Destroy;
begin
  if FLeft<>nil then
    FLeft.Destroy;
  FRight.Free;
  inherited;
end;

// ������� ����������� ������������� �������� � ������
function TNode.GetMax: TElem;
var t : TNode;
begin
  t:=Self;
  while t.Right<>nil do
    t:=t.Right;
  Result:=t.Info;
end;

// ������� ����������� ������������ �������� � ������

function TNode.GetMin: TElem;
var t : TNode;
begin
  t:=Self;
  while t.Left<>nil do
    t:=t.Left;
  Result:=t.Info;
end;

// "������" ��� ��������� �������������� �����
procedure TNode.SetInfo(const Value: Telem);
begin
  if(FLeft.GetMax<Value) and (Value<=FRight.GetMin) then
    FInfo := Value;
end;

// ����������� ���� ������ �� ��������� TreeView
procedure TNode.Show(TV: TTreeView; pn: TTreeNode);
var
  node : TTreeNode;
begin
  node:=TV.Items.AddChild(pn, IntToStr(FInfo));
  if (FLeft<>nil) or (FRight<>nil) then
    begin
      if FLeft = nil then
        TV.Items.AddChild(node, 'x')
      else
        FLeft.Show(TV, node);
      if FRight = nil then
        TV.Items.AddChild(node, 'x')
      else
        FRight.Show(TV, node);
    end;
end;

// ������� ��������������� ������ � ������ (����� ������-����)
function TNode.Prefix: string;
begin
  Result:=IntToStr(FInfo)+' ';
  if FLeft<>nil then
    Result:=Result+FLeft.Prefix+' ';
  if FRight<>nil then
    Result:=Result+FRight.Prefix+' ';
  Result:=Trim(Result)
end;




end.
