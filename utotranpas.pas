unit utotranpas;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF},
  OleCtrls, SHDocVw, Clipbrd, ActiveX,
  //indy
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdSSLOpenSSL;

type
  totranpas = class(TThread)
  private
    procedure SetName;
    procedure ExeTrans;
  protected
    procedure Execute; override;
  end;

implementation

uses
  IdMultipartFormData,uutama;

{$IFDEF MSWINDOWS}
type
  Tva = record
    FType: LongWord;     
    FName: PChar;        
    FThreadID: LongWord; 
    FFlags: LongWord;    
  end;
{$ENDIF}

{ totranpas }

function GetStrFromClipbrd : string;
begin
 if Clipboard.HasFormat(CF_TEXT) then
   result := Clipboard.AsText;
end;

procedure totranpas.SetName;
{$IFDEF MSWINDOWS}
var
  va: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  va.FType := $1000;
  va.FName := 'totp_net';
  va.FThreadID := $FFFFFFFF;
  va.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(va) div sizeof(LongWord), @va );
  except
  end;
{$ENDIF}
end;

procedure totranpas.ExeTrans;
begin
 end;

procedure totranpas.Execute;
begin
  SetName;
end;

end.
