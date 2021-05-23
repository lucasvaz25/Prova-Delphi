program QS6;

uses
  UISubstitui in 'uISubstitui.pas',
  USubstitui in 'uSubstitui.pas',
  Vcl.Dialogs,
  SysUtils;

{$R *.RES}


var
  Replace: TSubstitui;

begin
  Replace := TSubstitui.Create;
  try
    ShowMessage( Replace.Substituir( 'O rato roeu a roupa do rei de roma', 'ro', 'teste' ) );
  finally
    FreeAndNil( Replace );
  end;

end.
