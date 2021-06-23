unit uMemo;

interface

uses
  UComponente;

type

  TMemo = class( TComponente )
  public
    Constructor Create( PosX, PosY, TamAltura, TamLargura: Integer );
    Destructor Destroy; Override;
    procedure AlteraTamanho( PosX, PosY: Integer; TamAltura, TamLargura: Real ); override;
  end;

implementation

{ TMemo }

constructor TMemo.Create( PosX: Integer; PosY: Integer; TamAltura: Integer; TamLargura: Integer );
begin
  Self.X := PosX;
  Self.Y := PosY;

  Self.Altura  := TamAltura;
  Self.Largura := TamLargura;
end;

destructor TMemo.Destroy;
begin
  inherited;
end;

procedure TMemo.AlteraTamanho( PosX: Integer; PosY: Integer; TamAltura: Real; TamLargura: Real );
begin

  Self.Largura := Trunc( ( ( TamAltura / 100 ) + 1 ) * Self.Largura );
  Self.Altura  := Trunc( ( ( TamLargura / 100 ) + 1 ) * Self.Altura );

  Self.X := Trunc( PosX / 2 + Self.X );
  Self.Y := Trunc( PosY / 2 + Self.Y );
end;

end.
