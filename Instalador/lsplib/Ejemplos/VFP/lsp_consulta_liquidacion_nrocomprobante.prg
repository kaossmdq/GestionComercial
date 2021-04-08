  
  wslsp = CreateObject("lsplib.wslsp")
  wslsp.CUIT = 20939802593
  wslsp.modoProduccion = .F.
  puntoVenta = 10
  tipoComprobante = 183
  nroComprobante = 1
  if wslsp.login("certificado.crt", "clave.key") then
    Response = wslsp.consultarLiquidacionPorNroComprobante(puntoVenta, tipoComprobante, nroComprobante)
    if Response.respuesta.hayErrores then
      ShowMessage(Response.respuesta.errores)
    else
      Response.respuesta.guardarPDF("c:\datos\liquidacion.pdf")
      MessageBox("Felicitaciones,  consulta exitosa: " + TRANSFORM(Response.respuesta.cabecera.cae, '##############'))
    endif
  else
    MessageBox(wslsp.ErrorDesc)
  endif
