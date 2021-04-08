  wslsp = CreateObject("lsplib.wslsp")
  wslsp.CUIT = 20939802593
  wslsp.modoProduccion = .F.
  wslsp.Depurar = .T.
  if wslsp.login("certificado.crt", "clave.key") then
      Solicitud = wslsp.nuevoAjuste
      Solicitud.tipoAjuste = "C"
      Solicitud.fechaComprobante = "2017-06-05"
      Solicitud.emisor.puntoVenta = 10
      Solicitud.emisor.nroComprobante = 1
      Solicitud.emisor.comprobanteAAjustar.tipoComprobante = 183
      Solicitud.emisor.comprobanteAAjustar.puntoVenta = 10
      Solicitud.emisor.comprobanteAAjustar.nroComprobante = 20
      Solicitud.itemDetalleAjusteLiquidacion(0).nroItemAjustar = 1
      Solicitud.itemDetalleAjusteLiquidacion(0).ajusteFisico.cantidad = 10

      Response = wslsp.generarAjuste

      if Response.respuesta.hayErrores then
        MessageBox(Response.respuesta.errores)
      else
        Response.respuesta.guardarPDF("c:\datos\liquidacion.pdf")
        MessageBox("Felicitaciones, el CAE obtenido: " + FloatToStr(Response.respuesta.cabecera.cae))
      endif
  else
    MessageBox(wslsp.ErrorDesc)
  endif
