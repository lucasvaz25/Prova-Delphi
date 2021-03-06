unit uSubstitui;

interface

uses
  UISubstitui;

type

  TSubstitui = class( TInterfacedObject, ISubstitui )
  public
    function Substituir( AStr, AVelho, ANovo: String ): String;
  end;

implementation

function TSubstitui.Substituir( AStr, AVelho, ANovo: String ): String;
var
  I, J: Integer;
  Change: Boolean;
  OldStr: string;
begin
  Result := AStr;
  OldStr := '';

  for I := Low( AStr ) to High( AStr ) do
  begin
    J      := 1;
    Change := True;

    while J <= High( AVelho ) do
    begin
      if ( AStr[ I + J ] = AVelho[ J ] ) then
        Inc( J )
      else
      begin
        Change := False;
        Break;
      end;
    end;

    if Change then
    begin
      Result   := '';
      for J    := Low( AStr ) to I do
        Result := Result + AStr[ J ];

      Result := Result + ANovo;

      for J    := ( I + ( High( AVelho ) + 1 ) ) to High( AStr ) do
        OldStr := OldStr + AStr[ J ];

      Break;
    end;

  end;

  if Change then
    OldStr := Substituir( OldStr, AVelho, ANovo );

  Result := Result + OldStr;
end;

end.
