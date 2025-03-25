unit DMGridReg;

interface

  procedure Register;

implementation

uses
  Classes,
  Dialogs,

  DesignIntf,
  DesignEditors,
  ColnEdit,

  DMGrid;

type
  TDMGridEditor = class(TComponentEditor)
  protected
    procedure ExecuteVerb(Index: Integer); override;
    function  GetVerb(Index: Integer): string; override;
    function  GetVerbCount: Integer; override;
  end;

{ TDMGridEditor }

procedure TDMGridEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
  0:
    ShowCollectionEditorClass(Designer, TCollectionEditor, Component,
      TDMGrid(Component).Columns, 'Columns', [coAdd, coDelete, coMove]);
  1:
    ShowMessage('TDMGrid v0.0.1 by 델마당');
  end;
end;

function TDMGridEditor.GetVerb(Index: Integer): string;
begin
  case Index of
  0:
    Result := '컬럼 편집(&C)...';
  1:
    Result := '정보(&A)...';
  end;
end;

function TDMGridEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

procedure Register;
begin
  RegisterComponents('DelMadang', [
    TDMGrid
  ]);

  RegisterComponentEditor(TDMGrid, TDMGridEditor);
end;

end.
