unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FName: String;
    FX: Integer;
    FXPrevious: Integer;
    FY: Integer;
    FYPrevious: Integer;
    FAltura: Integer;
    FAlturaPrevious: Integer;
    FLargura: Integer;
    FLarguraPrevious: Integer;
    FComponentes: TComponenteArray;
    procedure SetX( const Value: Integer );
    procedure SetAltura( const Value: Integer );
    procedure SetLargura( const Value: Integer );
    procedure SetY( const Value: Integer );
  public
    procedure AdicionaComponente( AComponente: TComponente ); virtual;
    procedure RemoveComponente( AComponente: TComponente ); virtual;

    property Componentes: TComponenteArray read FComponentes write FComponentes;

    property Name: String read FName write FName;
    property X: Integer read FX write SetX;
    property XPrevious: Integer read FXPrevious;
    property Y: Integer read FY write SetY;
    property YPrevious: Integer read FYPrevious;
    property Altura: Integer read FAltura write SetAltura;
    property AlturaPrevious: Integer read FAlturaPrevious;
    property Largura: Integer read FLargura write SetLargura;
    property LarguraPrevious: Integer read FLarguraPrevious;

  end;

implementation

uses
  System.SysUtils;

procedure TComponente.AdicionaComponente( AComponente: TComponente );
begin
  SetLength( FComponentes, Length( FComponentes ) + 1 );
  FComponentes[ Length( FComponentes ) - 1 ] := AComponente;
end;

procedure TComponente.RemoveComponente( AComponente: TComponente );
var
  I: Integer;
  Removed: Boolean;
begin
  Removed := False;
  for I   := 0 to Pred( Length( FComponentes ) ) do
  begin
    if ( FComponentes[ I ].FName = AComponente.FName ) and not( Removed ) then
    begin
      FreeAndNil( FComponentes[ I ] );
      Removed := True;
    end;

    if Removed then
      FComponentes[ I ] := FComponentes[ I + 1 ];
  end;

  SetLength( FComponentes, Length( FComponentes ) - 1 );
end;

procedure TComponente.SetAltura( const Value: Integer );
begin
  FAlturaPrevious := FAltura;
  FAltura         := Value;
end;

procedure TComponente.SetLargura( const Value: Integer );
begin
  FLarguraPrevious := FLargura;
  FLargura         := Value;
end;

procedure TComponente.SetX( const Value: Integer );
begin
  FXPrevious := FX;
  FX         := Value;
end;

procedure TComponente.SetY( const Value: Integer );
begin
  FYPrevious := FY;
  FY         := Value;
end;

end.
