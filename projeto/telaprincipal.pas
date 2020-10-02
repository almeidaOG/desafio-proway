unit telaprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    edtplacar: TEdit;
    edtMinTemp: TEdit;
    edtMaxTemp: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtQtdQuebraRec: TEdit;
    Label6: TLabel;
    btnCalcular: TButton;
    LvResultado: TListView;
    Label1: TLabel;
    edtJogo: TEdit;
    btnNovo: TButton;
    edtQuebraRecMin: TEdit;
    edtQuebraRecMax: TEdit;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
      placar, soma, QuebraRecMin, QuebraRecMax, jogo : integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  resultado : TListItem;
begin
  if  edtMaxTemp.Text = 'N/a' then
    begin
      edtMaxTemp.Text := edtplacar.Text;
    end
  else if StrToInt(edtplacar.Text) > StrToInt(edtMaxTemp.Text) then
    begin
      edtMaxTemp.Text := edtplacar.Text;
      QuebraRecMax := QuebraRecMax + 1 ;
      edtQuebraRecMax.Text := IntToStr(QuebraRecMax);
    end;

  if (edtminTemp.Text = 'N/a') then
    begin
      if (StrToInt(edtplacar.Text) < StrToInt(edtMaxTemp.Text)) then
        begin
          edtMinTemp.Text := edtplacar.Text;
        end;
    end;
  if (StrToInt(edtplacar.Text) < StrToInt(edtMaxTemp.Text))
  and (StrToInt(edtplacar.Text) < StrToInt(edtMinTemp.Text)) then
    begin
        edtMinTemp.Text := edtplacar.Text;
        QuebraRecMin := QuebraRecMin + 1 ;
        edtQuebraRecMin.Text := IntToStr(QuebraRecMin);
    end;





  resultado := LvResultado.Items.Add;
  resultado.Caption := edtJogo.text;
  resultado.SubItems.Add(edtplacar.Text);
  resultado.SubItems.Add(edtMaxTemp.Text);
  resultado.SubItems.Add(edtMinTemp.Text);
  resultado.SubItems.Add(edtQuebraRecMax.Text);
  resultado.SubItems.Add(edtQuebraRecMin.Text);
  jogo := jogo + 1;
  edtJogo.Text := IntToStr(jogo);
  edtplacar.Clear;
  btnCalcular.Enabled := false;
  btnNovo.Enabled := true;
  edtplacar.Enabled := false;

  soma := QuebraRecMin + QuebraRecMax;

  edtQtdQuebraRec.Text := IntToStr(soma);
end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
btnCalcular.Enabled := true;
edtplacar.Enabled := true;
btnNovo.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  jogo := jogo + 1;
  edtJogo.Text := IntToStr(jogo);
  btnCalcular.Enabled := false;
  edtplacar.Enabled := false;
end;

end.
