unit uFrame;

interface

uses
  UComponente;

type

  TFrame = class( TComponente )
  private
  public
    procedure AdicionaComponente( AComponente: TComponente );
    procedure RemoveComponente( AComponente: TComponente );
    procedure RedimensionaComponentes;
  end;

implementation

uses
  StrUtils,
  SysUtils,
  UBotao,
  ULabel,
  UMemo;

{ TFrame }

procedure TFrame.AdicionaComponente( AComponente: TComponente );
begin
  inherited;
end;

procedure TFrame.RedimensionaComponentes;
var
  I: Integer;
  Proportion: Double;
begin
  inherited;

  for I := 0 to Pred( Length( Componentes ) ) do
  begin
    case AnsiIndexStr( UpperCase( Componentes[ I ].ClassName ), 
                [ 'TMEMO', 'TLABEL', 'TBOTAO' ] ) of
      0:
        begin
          Proportion := 1;
          if Self.LarguraPrevious > 0 then
            Proportion := ( Self.Largura / Self.LarguraPrevious );

          Proportion               := Proportion * Componentes[ I ].Largura;
          Componentes[ I ].Largura := Trunc( Proportion );

          Proportion := 1;
          if Self.AlturaPrevious > 0 then
            Proportion := ( Self.Altura / Self.AlturaPrevious );

          Proportion              := Proportion * Componentes[ I ].Altura;
          Componentes[ I ].Altura := Trunc( Proportion );

          Proportion := 1;
          if Self.XPrevious > 0 then
            Proportion := ( Self.X / Self.XPrevious );

          Proportion         := Proportion * Componentes[ I ].X;
          Componentes[ I ].X := Trunc( Proportion );

          Proportion := 1;
          if Self.YPrevious > 0 then
            Proportion := ( Self.Y / Self.YPrevious );

          Proportion := Proportion * Componentes[ I ].Y;

        end;

      1:
        begin
          Proportion := 1;
          if Self.XPrevious > 0 then
            Proportion := ( Self.X / Self.XPrevious );

          Proportion         := Proportion * Componentes[ I ].X;
          Componentes[ I ].X := Trunc( Proportion );

          Proportion := 1;
          if Self.YPrevious > 0 then
            Proportion := ( Self.Y / Self.YPrevious );

          Proportion         := Proportion * Componentes[ I ].Y;
          Componentes[ I ].Y := Trunc( Proportion );
        end;

      2:
        begin
          Proportion := 1;
          if Self.LarguraPrevious > 0 then
            Proportion := ( Self.Largura / Self.LarguraPrevious );

          Proportion               := Proportion * Componentes[ I ].Largura;
          Componentes[ I ].Largura := Trunc( Proportion );

          Proportion := 1;
          if Self.XPrevious > 0 then
            Proportion := ( Self.X / Self.XPrevious );

          Proportion         := Proportion * Componentes[ I ].X;
          Componentes[ I ].X := Trunc( Proportion );

          Proportion := 1;
          if Self.YPrevious > 0 then
            Proportion := ( Self.Y / Self.YPrevious );

          Proportion         := Proportion * Componentes[ I ].Y;
          Componentes[ I ].Y := Trunc( Proportion );
        end;
    else
      begin
        Proportion := 1;
        if Self.LarguraPrevious > 0 then
          Proportion := ( Self.Largura / Self.LarguraPrevious );

        Proportion               := Proportion * Componentes[ I ].Largura;
        Componentes[ I ].Largura := Trunc( Proportion );

        Proportion := 1;
        if Self.AlturaPrevious > 0 then
          Proportion := ( Self.Altura / Self.AlturaPrevious );

        Proportion              := Proportion * Componentes[ I ].Altura;
        Componentes[ I ].Altura := Trunc( Proportion );

        Proportion := 1;
        if Self.XPrevious > 0 then
          Proportion := ( Self.X / Self.XPrevious );

        Proportion         := Proportion * Componentes[ I ].X;
        Componentes[ I ].X := Trunc( Proportion );

        Proportion := 1;
        if Self.YPrevious > 0 then
          Proportion := ( Self.Y / Self.YPrevious );

        Proportion         := Proportion * Componentes[ I ].Y;
        Componentes[ I ].Y := Trunc( Proportion );
      end;
    end;

  end;
end;

procedure TFrame.RemoveComponente( AComponente: TComponente );
begin
  inherited;
end;

end.
