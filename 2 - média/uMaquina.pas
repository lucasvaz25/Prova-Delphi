unit uMaquina;

interface

uses
  UIMaquina,
  UTroco,
  Classes;

type

  TMaquina = class( TInterfacedObject, IMaquina )
  public
    function MontarTroco( ATroco: Double ): TList;
  end;

implementation

uses
  Math;

function TMaquina.MontarTroco( ATroco: Double ): TList;
var
  Qntd, I, J: Integer;
  Cedula: TCedula;
  ValueInit, ValueAfter: Double;
  TrocoAux: TTroco;
  Change: Boolean;
begin
  Result     := TList.Create;
  ValueInit  := ATroco;
  ValueAfter := 0;

  while not( ATroco = 0 ) do
  begin
    for I := 0 to Length( CValorCedula ) - 1 do
    begin
      Cedula := TCedula( I );
      Qntd   := Trunc( ATroco / ( CValorCedula[ Cedula ] ) );

      if ( Qntd > 0 ) then
      begin
        Change     := False;
        ValueAfter := ValueAfter + ( Qntd * ( CValorCedula[ Cedula ] ) );
        ATroco     := SimpleRoundTo( ( ValueInit - ValueAfter ), -2 );

        if Result.Count > 0 then
          for J := 0 to Result.Count - 1 do
          begin
            TrocoAux := TTroco( Result[ J ] );
            if TrocoAux.Tipo = Cedula then
            begin
              TrocoAux.Quantidade := TrocoAux.Quantidade + Qntd;
              Change              := True;
            end;
          end;

        if not Change then
          Result.Add( TTroco.Create( Cedula, Qntd ) );

      end;
    end;
    ATroco := SimpleRoundTo( ( ValueInit - ValueAfter ), -2 );
  end;

end;

end.
