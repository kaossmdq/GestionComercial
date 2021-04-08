VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "LSPLIB Demo"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Generar Liquidación"
      Height          =   735
      Left            =   1320
      TabIndex        =   0
      Top             =   1080
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Dim PtoVta As Integer
  Dim TipoComprobante As Integer
  Dim wslsp As lsplib.wslsp
  Dim ConsultaUltimoNroResponse As lsplib.ConsultarUltimoNroComprobantePorPtoVtaResp
  Dim Solicitud As lsplib.GenerarLiquidacionReq
  Dim Respuesta As lsplib.GenerarLiquidacionResp
  
  PtoVta = 200
  TipoComprobante = 183
  
  Set wslsp = New lsplib.wslsp
  wslsp.cuit = 20939802593#
  wslsp.modoProduccion = False
  wslsp.Depurar = True   ' Genera archivos de depuracion Request.xml y Response.xml
  If wslsp.login("certificado.crt", "clave.key") Then
      Set ConsultaUltimoNroResponse = wslsp.consultarUltimoNroComprobantePorPtoVta(PtoVta, TipoComprobante)
      If Not ConsultaUltimoNroResponse.Respuesta.hayErrores Then
          Set Solicitud = wslsp.nuevaLiquidacion
          Solicitud.codOperacion = 4
          Solicitud.emisor.puntoVenta = PtoVta
          Solicitud.emisor.TipoComprobante = TipoComprobante
          Solicitud.emisor.nroComprobante = ConsultaUltimoNroResponse.Respuesta.nroComprobante + 1
          Solicitud.emisor.codCaracter = 5
          Solicitud.emisor.fechaInicioActividades = "2005-01-01"
          Solicitud.emisor.iibb = "20939802593"
          Solicitud.emisor.nroRUCA = 305
          Solicitud.receptor.codCaracter = 3
          Solicitud.receptor.operador.cuit = 20160000024#
          Solicitud.receptor.operador.iibb = "20160000024"
          Solicitud.receptor.operador.nroRenspa = "22.123.1.12345/A4"
          Solicitud.datosLiquidacion.fechaComprobante = "2017-05-04"
          Solicitud.datosLiquidacion.fechaOperacion = "2017-05-04"
          Solicitud.datosLiquidacion.lugarRealizacion = "CORONEL SUAREZ"
          Solicitud.datosLiquidacion.codMotivo = 6
          Solicitud.guia(0).nroGuia = "1"
          Solicitud.guia(1).nroGuia = "2"
          Solicitud.dte(0).nroDTE = "418-1"
          Solicitud.dte(1).nroDTE = "418-1"

          Solicitud.itemDetalleLiquidacion(0).cuitCliente = 30160000011#
          Solicitud.itemDetalleLiquidacion(0).codCategoria = 51020102
          Solicitud.itemDetalleLiquidacion(0).tipoLiquidacion = 1
          Solicitud.itemDetalleLiquidacion(0).cantidad = 2
          Solicitud.itemDetalleLiquidacion(0).precioUnitario = 20
          Solicitud.itemDetalleLiquidacion(0).alicuotaIVA = 10.5
          Solicitud.itemDetalleLiquidacion(0).raza.codRaza = 1

'****************SI LLEVA COMPRA ASOCIADA**************************************************
'          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).tipoComprobante = 185
'          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).puntoVenta = 3000
'          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).nroComprobante = 33
'          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).nroItem = 1
'          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).cantidadAsociada = 2


          Solicitud.gasto(0).codGasto = 16
          Solicitud.gasto(0).baseImponible = 230520.6
          Solicitud.gasto(0).alicuota = 3
          Solicitud.gasto(0).alicuotaIVA = 10.5

          Solicitud.tributo(0).codTributo = 5
          Solicitud.tributo(0).baseImponible = 30520
          Solicitud.tributo(0).alicuota = 2.5
          Solicitud.datosAdicionales = "Datos Adicionales"
          Set Response = wslsp.generarLiquidacion
          
          If Response.Respuesta.hayErrores Then
            MsgBox (Response.Respuesta.errores)
          Else
            MsgBox ("Felicitaciones, el CAE obtenido: " + CStr(Response.Respuesta.cabecera.cae))
          End If
      Else
        MsgBox (ConsultaUltimoNroResponse.Respuesta.errores)
      End If
  Else
    MsgBox (wslsp.ErrorDesc)
  End If



End Sub
