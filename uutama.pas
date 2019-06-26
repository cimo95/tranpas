unit uutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, xpman, ActiveX, StdCtrls, OleCtrls, SHDocVw,
  Clipbrd, WinInet, inifiles, ZLib, Soap.EncdDecd, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdSSLOpenSSL, ComCtrls, CheckLst, Vcl.ExtCtrls;

type
  Tf0 = class(TForm)
    c0: TButton;
    c1: TButton;
    c2: TButton;
    c3: TButton;
    c4: TColorDialog;
    c5: TGroupBox;
    c6: TButton;
    c7: TButton;
    c8: TButton;
    c9: TCheckBox;
    ca: TCheckBox;
    cb: TCheckListBox;
    cc: TComboBox;
    cd: TComboBox;
    ce: TEdit;
    cf: TLabel;
    c10: TLabel;
    c11: TLabel;
    c12: TIdHTTP;
    c13: TMemo;
    c14: TMemo;
    c15: TStatusBar;
    c16: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure c7Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure c0Click(Sender: TObject);
    procedure c2Click(Sender: TObject);
    procedure c3Click(Sender: TObject);
    procedure c6Click(Sender: TObject);
    procedure c13Exit(Sender: TObject);
    procedure c8Click(Sender: TObject);
    procedure c9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ccChange(Sender: TObject);
    procedure cdChange(Sender: TObject);
    procedure c13DblClick(Sender: TObject);
    procedure c14DblClick(Sender: TObject);
    procedure c16Timer(Sender: TObject);
  private
    { Deklarasi hanya untuk penggunaan dalam f0 ini saja }
  public
    { Deklarasi untuk penggunaan ke semua f0 yang terintegerasi }
    v0, v1, v2: integer;
    v3: LongBool;
    v4: Boolean;
    procedure ClipBoardChanged(var Message: TMessage); message WM_DRAWCLIPBOARD;
  end;

var
  f0: Tf0;

implementation

uses
  IdMultipartFormData;

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi
function f0: string;
begin
  if Clipboard.HasFormat(CF_TEXT) then
    result := Clipboard.AsText;
end;

function f1(s: string): string;
var
  v5: string;
begin
  v5 := Copy(s, 0, 2);
  if v5 = 'zh' then
    v5 := 'zh-CN';
  result := v5;
end;

function f2(s: string): string;
var
  v6: integer;
  v5: string;
begin
  for v6 := 1 to Length(s) do
    if s[v6] in ['A'..'Z', 'a'..'z', '0'..'9', ' ', #13, #10] then
      v5 := v5 + s[v6];
  Result := v5;
end;

type
  TRunProcessThread = class(TThread)
  protected
    procedure Execute; override;
  public
    procedure Translate;
    procedure TranslateMemo;
    constructor Create;
    destructor Destroy; override;
  end;

constructor TRunProcessThread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

destructor TRunProcessThread.Destroy;
begin
  inherited;
end;

procedure TRunProcessThread.Translate;
var
  va: TIdMultiPartFormDataStream;
  vb: Boolean;
  vc: string;
begin
  if f0.c15.Panels.Items[1].Text = 'Disconnected' then
    Exit;
  if (f0.c14.Text <> '') and (f0.cb.Checked[5]) then
    if MessageDlg('The translation result in textbox will be removed after current translation success.' + #13#10 + 'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

  f0.c14.Clear;
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Translating, please wait...';
  va := TIdMultiPartFormDataStream.Create;
  try
    try
      if f0.ca.Checked then
      begin
        vc := '1';
        va.AddFormField('cimosoft_tp_text', EncodeString(UTF8Encode(Trim(f0.c13.Text))));
      end
      else
      begin
        vc := '0';
        va.AddFormField('cimosoft_tp_text', UTF8Encode(Trim(f0.c13.Text)));
      end;
      f0.c13.Text := Trim(f0.c13.Text);
      va.AddFormField('cimosoft_tp_token', f0.ce.text);
      va.AddFormField('cimosoft_tp_transFrom', f1(f0.cc.Items.Strings[f0.cc.itemindex]));
      va.AddFormField('cimosoft_tp_transTo', f1(f0.cd.Items.Strings[f0.cd.itemindex]));
      va.AddFormField('cimosoft_tp_useb64', vc);
      f0.c14.Text := f0.c12.Post('http://gratis.tranpas.cimosoft.com/', va);
      f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Ready';
    finally
      va.Free;
      f0.v0 := 1;
      if f0.cb.Checked[0] then
      begin
        vb := f0.cb.Checked[6];
        f0.cb.Checked[6] := False;
        f0.c14.SelectAll;
        f0.c14.CopyToClipboard;
        f0.c14.ClearSelection;
        f0.cb.Checked[6] := vb;
      end;
    end;
  except
    on e: Exception do
    begin
      f0.v0 := 1;
      f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Server Error : ' + e.Message;
    end;
  end;
end;

procedure TRunProcessThread.TranslateMemo;
var
  va: TIdMultiPartFormDataStream;
  vb: Boolean;
  vc: string;
begin
  if f0.c15.Panels.Items[1].Text = 'Disconnected' then
    Exit;
  if (f0.c14.Text <> '') and (f0.cb.Checked[5]) then
    if MessageDlg('The translation result in textbox will be removed after current translation success.' + #13#10 + 'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  f0.c14.Clear;
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Translating, please wait...';
  va := TIdMultiPartFormDataStream.Create;
  try
    try
      if f0.ca.Checked then
      begin
        vc := '1';
        va.AddFormField('cimosoft_tp_text', EncodeString(UTF8Encode(Trim(f0.c13.Text))));
      end
      else
      begin
        vc := '0';
        va.AddFormField('cimosoft_tp_text', UTF8Encode(Trim(f0.c13.Text)));
      end;
      f0.c13.Text := Trim(f0.c13.Text);
      va.AddFormField('cimosoft_tp_token', f0.ce.text);
      va.AddFormField('cimosoft_tp_transFrom', f1(f0.cc.Items.Strings[f0.cc.itemindex]));
      va.AddFormField('cimosoft_tp_transTo', f1(f0.cd.Items.Strings[f0.cd.itemindex]));
      va.AddFormField('cimosoft_tp_useb64', vc);
      f0.c14.Text := f0.c12.Post('http://gratis.tranpas.cimosoft.com/', va);
      f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Ready';
    finally
      va.Free;
      f0.v0 := 1;
      if f0.cb.Checked[0] then
      begin
        vb := f0.cb.Checked[6];
        f0.cb.Checked[6] := False;
        f0.c14.SelectAll;
        f0.c14.CopyToClipboard;
        f0.c14.ClearSelection;
        f0.cb.Checked[6] := vb;
      end;
    end;
  except
    on e: Exception do
    begin
      f0.v0 := 1;
      f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Server Error : ' + e.Message;
    end;
  end;
end;

procedure TRunProcessThread.Execute;
begin
  case f0.v0 of
    0:
      Translate;
    2:
      TranslateMemo;
  end;
end;

procedure ceknet;
var
  vd: TRunProcessThread;
begin
  with f0 do
  begin
    f0.v0 := 1;
    vd := TRunProcessThread.Create;
    vd.Resume;
  end;
end;

procedure Tf0.ClipBoardChanged(var Message: TMessage);
var
  vd: TRunProcessThread;
begin
  if (Length(f0) <> 0) and (cb.Checked[6]) then
  begin
    f0.v0 := 0;
    f0.c13.Text := f0;
    vd := TRunProcessThread.Create;
    vd.Resume;
  end;
end;

procedure Tf0.ccChange(Sender: TObject);
begin
  if cc.ItemIndex = cd.ItemIndex then
  begin
    cd.ItemIndex := v1;
    v2 := v1;
  end;
  v1 := cc.ItemIndex;
  if cb.Checked[2] and (cd.ItemIndex <> -1) then
    f0.Click;
end;

procedure Tf0.cdChange(Sender: TObject);
begin
  if cd.ItemIndex = cc.ItemIndex then
  begin
    cc.ItemIndex := v2;
    v1 := v2;
  end;
  v2 := cd.ItemIndex;
  if cb.Checked[2] and (cc.ItemIndex <> -1) then
    f0.Click;
end;

function f3(const WebBrowser: TWebBrowser): string;
var
  vf: TStringStream;
  v10: IStream;
  v11: IPersistStreamInit;
begin
  if not Assigned(WebBrowser.Document) then
    exit;
  vf := TStringStream.Create('');
  try
    v11 := WebBrowser.Document as IPersistStreamInit;
    v10 := TStreamAdapter.Create(vf, soReference);
    v11.Save(v10, true);
    result := vf.DataString;
  finally
    vf.Free();
  end;
end;

procedure Tf0.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if cb.Checked[1] then
    c1.Click;
end;

procedure Tf0.FormCreate(Sender: TObject);
var
  vd: TRunProcessThread;
  v13: tinifile;
  v14: tstringlist;
  v6: integer;
begin
  SetClipboardViewer(Handle);
  f0.v0 := 1;
  vd := TRunProcessThread.Create;
  vd.Resume;
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Loading Config...';
  Application.ProcessMessages;
  if FileExists(ChangeFileExt(Application.ExeName, '.ini')) then
  begin
    try
      v13 := tinifile.Create(ChangeFileExt(Application.ExeName, '.ini'));
      ce.text := v13.ReadString('config', 'token', 'cobatoken');
      cc.ItemIndex := v13.ReadInteger('config', 'translateFrom', 11);
      v13.WriteInteger('config', 'translateTo', cd.ItemIndex);
      cd.ItemIndex := v13.ReadInteger('config', 'translateTo', 23);
      c9.checked := v13.readBool('config', 'onTop', false);
      for v6 := 0 to cb.Items.Count - 1 do
        cb.Checked[v6] := v13.ReadBool('config', 'configAdvItem' + IntToStr(v6 + 1), False);
      cb.ItemIndex := v13.ReadInteger('config', 'configAdvIdx', -1);
      if cb.Checked[9] then
      begin
        c13.Text := DecodeString(v13.ReadString('content', 'translateFrom', ''));
        c14.Text := DecodeString(v13.ReadString('content', 'translateTo', ''));
      end;
      c13.Color := v13.ReadInteger('config', 'tfColor', $00FFFFE1);
      c14.Color := v13.ReadInteger('config', 'ttColor', $00FFE1FF);
    finally
      v13.Free;
      DeleteFile(ChangeFileExt(Application.ExeName, '.ini'));
      c1.Click;
    end;
  end;
  v2 := cd.ItemIndex;
  v1 := cc.ItemIndex;
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Ready';
end;

procedure Tf0.c7Click(Sender: TObject);
begin
  MessageDlg('TRANPAS GUI' + #13#10 + 'ver. 1.0' + #13#10#13#10 + 'Simple and faster text translator for TRANPAS user.' + #13#10 + 'This program is also perform as demo for project using TRANPAS service.' + #13#10#13#10 + '(C) 2019 Cimosoft Codelicious, Org', mtInformation, [mbOK], 0);
end;

procedure Tf0.c1Click(Sender: TObject);
begin
  if not ((c14.Text = '') and (c13.Text = '')) then
    if MessageDlg(PChar('Do you want to clear all textbox ?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit
    else
    begin
      c14.Clear;
      c13.Clear;
      f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Textbox cleared. Ready';
    end;

end;

procedure Tf0.c0Click(Sender: TObject);
var
  vd: TRunProcessThread;
begin
  if c15.Panels.Items[1].Text = 'Disconnected' then
  begin
    MessageDlg('Please make sure internet connected before translation', mtError, [mbOK], 0);

  end;
  f0.v0 := 2;
  vd := TRunProcessThread.Create;
  vd.Resume;
end;

procedure Tf0.c2Click(Sender: TObject);
var
  v6: integer;
  b: boolean;
begin
  b := cb.Checked[4];
  cb.Checked[4] := False;
  v6 := cc.ItemIndex;
  cc.ItemIndex := cd.ItemIndex;
  cd.ItemIndex := v6;
  c13.Text := c14.Text;
  f0.Click;
  cb.Checked[4] := b;
end;

procedure Tf0.c3Click(Sender: TObject);
var
  v12: topendialog;
begin
  v12 := topendialog.Create(nil);
  v12.Filter := 'Plain Text Text File|*.txt';
  v12.Title := 'Load Plain Text File';
  if not v12.Execute then
    v12.Free
  else
  begin
    c13.Lines.LoadFromFile(v12.FileName);
    f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Loaded (' + inttostr(Length(c13.Text)) + ' chars) from "' + extractfilename(v12.FileName) + '". Ready';
    if cb.Checked[3] then
      f0.Click;
  end;
end;

procedure Tf0.c6Click(Sender: TObject);
var
  v13: TIniFile;
  v6: integer;
  v14: tstringlist;
begin
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Saving Config...';
  Application.ProcessMessages;
  try
    v13 := tinifile.Create(ChangeFileExt(Application.ExeName, '.ini'));
    v13.WriteString('config', 'token', ce.Text);
    v13.WriteInteger('config', 'translateFrom', cc.ItemIndex);
    v13.WriteInteger('config', 'translateTo', cd.ItemIndex);
    v13.WriteBool('config', 'onTop', c9.Checked);
    v13.WriteInteger('config', 'configAdvIdx', cb.ItemIndex);
    for v6 := 0 to cb.Items.Count - 1 do
      v13.WriteBool('config', 'configAdvItem' + IntToStr(v6 + 1), cb.Checked[v6]);
    if cb.Checked[9] then
    begin
      v13.WriteString('content', 'translateFrom', EncodeString(c13.Text));
      v13.WriteString('content', 'translateTo', EncodeString(c14.Text));
    end;
    v13.WriteInteger('config', 'tfColor', c13.Color);
    v13.WriteInteger('config', 'ttColor', c14.Color);
  finally
    v13.Free;
  end;
  f0.c15.Panels.Items[0].Text := '[' + formatdatetime('hh:mm:ss,zz', Now) + '] Configuration Saved. Ready';
end;

procedure Tf0.c13Exit(Sender: TObject);
begin
  if cb.Checked[4] then
    f0.Click;
  if cb.Checked[8] then
  begin
    c13.Text := f2(c13.Text);
    c13.SelStart := Length(c13.Text);
    c13.SelLength := 0;
  end;
end;

procedure Tf0.c14DblClick(Sender: TObject);
begin
  c4.Color := c14.Color;
  if c4.Execute(handle) then
    c14.Color := c4.Color;
end;

procedure Tf0.c16Timer(Sender: TObject);
var
  v15: Cardinal;
  v16, v17: LongBool;
begin
  v16 := InternetGetconnectedState(@v15, 0);
  v17 := f0.cb.Checked[7];
  if not v16 then
  begin
    f0.c15.Panels.Items[1].Text := 'Disconnected';
    if (f0.v3 <> v16) and v17 then
      MessageDlg(PChar('The internet has been disconnected !'), mtError, [mbOK], 0);
  end
  else
  begin
    f0.c15.Panels.Items[1].Text := 'Connected';
    if (f0.v3 <> v16) and v17 then
      MessageDlg(PChar('The internet has been connected !'), mtInformation, [mbOK], 0);
  end;
  f0.v3 := v16;
end;

procedure Tf0.c13DblClick(Sender: TObject);
begin
  c4.Color := c13.Color;
  if c4.Execute(handle) then
    c13.Color := c4.Color;
end;

procedure Tf0.c8Click(Sender: TObject);
begin
  cb.Visible := not cb.Visible;
end;

procedure Tf0.c9Click(Sender: TObject);
begin
  if c9.Checked then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;

end.

