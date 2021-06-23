unit uBotao;

interface

uses
  UComponente;

type

  TBotao = class( TComponente )
  public
    Constructor Create( PosX, PosY, TamAltura, TamLargura: Integer );
    Destructor Destroy; Override;
    procedure AlteraTamanho( PosX, PosY: Integer; TamAltura, TamLargura: Real ); override;
  end;

implementation

{ TBotao }

constructor TBotao.Create( PosX: Integer; PosY: Integer; TamAltura: Integer; TamLargura: Integer );
begin
  Self.X := PosX;
  Self.Y := PosY;

  Self.Altura  := TamAltura;
  Self.Largura := TamLargura;
end;

destructor TBotao.Destroy;
begin
  inherited;
end;

procedure TBotao.AlteraTamanho( PosX: Integer; PosY: Integer; TamAltura: Real; TamLargura: Real );
begin
  Self.Largura := Trunc( ( ( TamLargura / 100 ) + 1 ) * Self.Largura );

  Self.X := Trunc( PosX / 2 + Self.X );
  Self.Y := Trunc( PosY / 2 + Self.Y );
end;

end.
