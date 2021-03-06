unit uLabel;

interface

uses
  UComponente;

type

  TLabel = class( TComponente )
  public
    procedure AlteraTamanho( PosX, PosY: Integer; TamAltura, TamLargura: Real ); override;
    Constructor Create( PosX, PosY, TamAltura, TamLargura: Integer );
    Destructor Destroy; Override;
  end;

implementation

{ TLabel }

constructor TLabel.Create( PosX: Integer; PosY: Integer; TamAltura: Integer; TamLargura: Integer );
begin
  Self.X := PosX;
  Self.Y := PosY;

  Self.Altura  := TamAltura;
  Self.Largura := TamLargura;
end;

destructor TLabel.Destroy;
begin
  inherited;
end;

procedure TLabel.AlteraTamanho( PosX: Integer; PosY: Integer; TamAltura: Real; TamLargura: Real );
begin
  Self.X := Trunc( PosX / 2 + Self.X );
  Self.Y := Trunc( PosY / 2 + Self.Y );
end;

end.
