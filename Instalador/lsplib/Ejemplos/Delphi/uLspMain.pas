unit uLspMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  lsplib_TLB;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  wslsp      : Iwslsp;
  Solicitud  : IGenerarLiquidacionReq;
  Response   : IGenerarLiquidacionResp;
  ConsultaUltimoNroResponse: IConsultarUltimoNroComprobantePorPtoVtaResp;
  puntoVenta               : Integer;
  tipoComprobante          : Integer;
 // Respuesta: ILiquidacionResp;
begin
  wslsp                := Cowslsp.Create;
  wslsp.CUIT           := 20939802593;
  wslsp.modoProduccion := false;
  wslsp.Depurar        := true;
  puntoVenta           := 1;
  tipoComprobante      := 186;

  if wslsp.login('certificado.crt', 'clave.key') then
  begin
      ConsultaUltimoNroResponse := wslsp.consultarUltimoNroComprobantePorPtoVta(puntoVenta, tipoComprobante);
      if not ConsultaUltimoNroResponse.respuesta.hayErrores then
      begin
        try
          Solicitud := wslsp.nuevaLiquidacion;

          Solicitud.codOperacion                        := 5;
          Solicitud.emisor.puntoVenta                   := puntoVenta;
          Solicitud.emisor.tipoComprobante              := tipoComprobante;
          Solicitud.emisor.nroComprobante               := ConsultaUltimoNroResponse.respuesta.nroComprobante + 1;
          Solicitud.emisor.codCaracter                  := 4;
          Solicitud.emisor.fechaInicioActividades       := '2005-01-01';
          Solicitud.emisor.iibb                         := '20160000261';//'20939802593';
          Solicitud.emisor.nroRUCA                      := 1111;

          Solicitud.guia[0].nroGuia:='120' ;

          Solicitud.receptor.codCaracter                := 4;
          Solicitud.receptor.operador.cuit              := 30160000011; //20160000024;             //******
     //     Solicitud.receptor.operador.cuitAutorizado    := 20160000261;
          Solicitud.receptor.operador.iibb              := '20160000024';
      //    Solicitud.receptor.operador.nroRenspa         := '22.123.1.12345/A4';  //***/
          Solicitud.receptor.operador.nroRUCA           := 1011;  //***/

          Solicitud.datosLiquidacion.fechaComprobante   := '2018-07-16';
          Solicitud.datosLiquidacion.fechaOperacion     := '2018-07-16';
          Solicitud.datosLiquidacion.fechaFaena         := '2018-07-16';
          Solicitud.datosLiquidacion.fechaRecepcion     := '2018-07-16';

      //    Solicitud.datosLiquidacion.lugarRealizacion   := 'CORONEL SUAREZ';
          Solicitud.datosLiquidacion.codMotivo          := 1;

          Solicitud.dte[0].nroDTE                       := '014469997-1';               //*****
          Solicitud.dte[0].nroRenspa                    := '22.123.1.12345/A5';   //*****


    //      Solicitud.itemDetalleLiquidacion[0].cuitCliente     := 23135481394;
          Solicitud.itemDetalleLiquidacion[0].codCategoria    := 51020102;
          Solicitud.itemDetalleLiquidacion[0].tipoLiquidacion := 2;
          Solicitud.itemDetalleLiquidacion[0].cantidad        := 50;
          Solicitud.itemDetalleLiquidacion[0].precioUnitario  := 100;
          Solicitud.itemDetalleLiquidacion[0].alicuotaIVA     := 21.0;
          Solicitud.itemDetalleLiquidacion[0].raza.codRaza    := 2;
          Solicitud.itemDetalleLiquidacion[0].nroTropa        := 2;
          Solicitud.itemDetalleLiquidacion[0].cantidadCabezas := 200;

          Solicitud.gasto[0].codGasto      := 16;
          Solicitud.gasto[0].baseImponible := 100000.0;
          Solicitud.gasto[0].alicuota      := 2;
          Solicitud.gasto[0].alicuotaIVA   := 10.5;

          Solicitud.datosAdicionales := 'Datos Adicionales';
          Response := wslsp.generarLiquidacion;

          if Response.respuesta.hayErrores then
          begin
            ShowMessage(Response.respuesta.errores);
          end
          else
          begin
            Response.respuesta.guardarPDF('c:\datos\liquidacion.pdf');
            ShowMessage('Felicitaciones, el CAE obtenido: ' + FloatToStr(Response.respuesta.cabecera.cae));
          end;
        except
          on E: Exception do
          begin
            ShowMessage(E.Message);
          end;
        end;
      end
      else
        ShowMessage(ConsultaUltimoNroResponse.respuesta.errores);
  end
  else
  begin
    ShowMessage(wslsp.ErrorDesc);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  wslsp: Iwslsp;
  Solicitud: IGenerarAjusteReq;
  Response: IGenerarAjusteResp;
begin
  wslsp                := Cowslsp.Create;
  wslsp.CUIT           := 20939802593;
  wslsp.modoProduccion := false;
  wslsp.Depurar        := true;
  if wslsp.login('certificado.crt', 'clave.key') then
  begin
    try
      Solicitud                       := wslsp.nuevoAjuste;
      Solicitud.tipoAjuste            := 'C';
      Solicitud.fechaComprobante      := '2017-06-05';
      Solicitud.emisor.puntoVenta     := 10;
      Solicitud.emisor.nroComprobante := 1;
      Solicitud.emisor.comprobanteAAjustar.tipoComprobante            := 183;
      Solicitud.emisor.comprobanteAAjustar.puntoVenta                 := 10;
      Solicitud.emisor.comprobanteAAjustar.nroComprobante             := 20;
      Solicitud.itemDetalleAjusteLiquidacion[0].nroItemAjustar        := 1;
      Solicitud.itemDetalleAjusteLiquidacion[0].ajusteFisico.cantidad := 10;

      Response := wslsp.generarAjuste;

      if Response.respuesta.hayErrores then
      begin
        ShowMessage(Response.respuesta.errores);
      end
      else
      begin
        Response.respuesta.guardarPDF('c:\datos\liquidacion.pdf');
        ShowMessage('Felicitaciones, el CAE obtenido: ' + FloatToStr(Response.respuesta.cabecera.cae));
      end;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end
  else
  begin
    ShowMessage(wslsp.ErrorDesc);
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  wslsp: Iwslsp;
  Response: IConsultarLiquidacionPorNroComprobanteResp;
  puntoVenta: Integer;
  tipoComprobante: Integer;
  nroComprobante: Integer;
begin
  wslsp                := Cowslsp.Create;
  wslsp.CUIT           := 20939802593;
  wslsp.modoProduccion := false;
  wslsp.Depurar        := true;
  puntoVenta           := 10;
  tipoComprobante      := 183;
  nroComprobante       := 1;
  if wslsp.login('certificado.crt', 'clave.key') then
  begin
    Response := wslsp.consultarLiquidacionPorNroComprobante(puntoVenta, tipoComprobante, nroComprobante);
    if Response.respuesta.hayErrores then
    begin
      ShowMessage(Response.respuesta.errores);
    end
    else
    begin
      Response.respuesta.guardarPDF('c:\datos\liquidacion.pdf');
      ShowMessage('Felicitaciones,  consulta exitosa: ' + FloatToStr(Response.respuesta.cabecera.cae));
    end;
  end
  else
  begin
    ShowMessage(wslsp.ErrorDesc);
  end;
end;

end.
