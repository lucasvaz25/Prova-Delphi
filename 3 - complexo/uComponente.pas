unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;

    procedure SetAltura( const TamAltura: Integer );
    procedure SetLargura( const TamLargura: Integer );

    procedure SetX( const PosX: Integer );
    procedure SetY( const PosY: Integer );

  public
    procedure AdicionaComponente( AComponente: TComponente ); virtual;
    procedure RemoveComponente( AComponente: TComponente ); virtual;

    property Altura: Integer read FAltura write SetAltura;
    property Largura: Integer read FLargura write SetLargura;
    property Componentes: TComponenteArray read FComponentes write FComponentes;
    property X: Integer read FX write SetX;
    property Y: Integer read FY write SetY;
    procedure AlteraTamanho( PosX, PosY: Integer; TamAltura, TamLargura: Real ); virtual; Abstract;

  end;

implementation


procedure TComponente.SetAltura( const TamAltura: Integer );
begin
  FAltura := TamAltura;
end;

procedure TComponente.SetLargura( const TamLargura: Integer );
begin
  FLargura := TamLargura;
end;

procedure TComponente.SetX( const PosX: Integer );
begin
  FX := PosX;
end;

procedure TComponente.SetY( const PosY: Integer );
begin
  FY := PosY;
end;

procedure TComponente.AdicionaComponente( AComponente: TComponente );
begin
  SetLength( Fcomponentes, Length( Fcomponentes ) + 1 );
  Fcomponentes[ Length( Fcomponentes ) - 1 ] := AComponente
end;

procedure TComponente.RemoveComponente( AComponente: TComponente );
var
  Achou: Boolean;
  Cont1: Integer;
begin
  Achou := False;
  Cont1 := 0;

  if Length( Fcomponentes ) <> 0 then
  begin
    repeat
      if Achou = True then
      begin
        Fcomponentes[ Cont1 ] := Fcomponentes[ Cont1 + 1 ];
      end
      else
      begin
        if Fcomponentes[ Cont1 ] = AComponente then
        begin
          Fcomponentes[ Cont1 ] := Fcomponentes[ Cont1 + 1 ];
          Achou                 := True;
        end;
      end;

      Cont1 := Cont1 + 1;
    until Length( Fcomponentes ) = Cont1;

    Fcomponentes[ Cont1 ] := nil;
    SetLength( Fcomponentes, Length( Fcomponentes ) - 1 );
  end;
end;

end.
