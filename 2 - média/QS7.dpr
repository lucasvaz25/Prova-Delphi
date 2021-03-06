program QS7;

uses
  Vcl.Dialogs,
  Classes,
  SysUtils,

  UTroco in 'uTroco.pas',
  UIMaquina in 'uIMaquina.pas',
  UMaquina in 'uMaquina.pas';

{$R *.RES}


var
  Str, TpCedula: String;
  Machine: TMaquina;
  List: TList;
  Troco: TTroco;
  I: Integer;

begin
  Machine := TMaquina.Create;
  try
    List := Machine.MontarTroco( 125.15 );
    try
      Str   := 'A entrada ? 125,15 e a sa?da ?:' + #13;
      for I := 0 to List.Count - 1 do
      begin
        Troco := TTroco( List[ I ] );

        if ( Integer( Troco.Tipo ) > 5 ) then
          TpCedula := 'moeda'
        else
          TpCedula := 'nota';

        Str := Str + ( ' ' + IntToStr( Troco.Quantidade ) + ' ' + TpCedula + ' de ' +
                    FormatFloat( '0.00', CValorCedula[ Troco.Tipo ] ) + #13 );
      end;
    finally
      FreeAndNil( List );
    end;
    ShowMessage( Str );
  finally
    FreeAndNil( Machine );
  end;

end.
