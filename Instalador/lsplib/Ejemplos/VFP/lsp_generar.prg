  #define TipoCertificado_P 0
  #define TipoCertificado_R 1
  
  #define TipoTitularGrano_P 0
  #define TipoTitularGrano_T 1

  #define TipoRubro_B 0
  #define TipoRubro_R 1

  #define EstadoCertificado_AC 0
  #define EstadoCertificado_PA 1
  #define EstadoCertificado_AN 2

  
  wslpg = CreateObject("lpglib.wslpg")
  wslpg.CUIT = 20939802593
  wslpg.modoProduccion = .F.
  if wslpg.login("certificado.crt", "clave.key") then
    Parametros = CreateObject("lpglib.cgAutorizarReq")
    Parametros.cabecera.tipoCertificado = TipoCertificado_P
    Parametros.cabecera.ptoEmision = 7
    Parametros.cabecera.nroOrden = 7
    Parametros.cabecera.nroIngBrutoDepositario = 7
    Parametros.cabecera.titularGrano = TipoTitularGrano_P
    Parametros.cabecera.cuitDepositante = 20939802593
    Parametros.cabecera.nroIngBrutoDepositante = 20939802593
    Parametros.cabecera.codGrano = 7
    Parametros.cabecera.campania = 203
    Parametros.cabecera.cuitCorredor = 27929007862
    Parametros.cabecera.datosAdicionales = "Datos Adicionales"

    Parametros.primaria.nroActDepositario = 332333
    Parametros.primaria.ctg(0).nroCTG = 334442
    Parametros.primaria.ctg(0).nroCartaDePorte = 3838363
    Parametros.primaria.ctg(0).pesoNetoConfirmadoDefinitivo = 33444.55
    Parametros.primaria.ctg(0).porcentajeSecadoHumedad = 35.6
    Parametros.primaria.ctg(0).importeSecado = 344.4
    Parametros.primaria.ctg(0).pesoNetoMermaSecado = 938383.44
    Parametros.primaria.ctg(0).tarifaSecado = 344.4
    Parametros.primaria.ctg(0).importeZarandeo = 38374.45
    Parametros.primaria.ctg(0).pesoNetoMermaZarandeo = 37399.47
    Parametros.primaria.ctg(0).tarifaZarandeo  = 355.5

    Parametros.primaria.nroActDepositario = 3345

    Parametros.primaria.ctg(0).nroCTG = 34434
    Parametros.primaria.ctg(0).nroCartaDePorte = 233222
    Parametros.primaria.ctg(0).pesoNetoConfirmadoDefinitivo = 329.45
    Parametros.primaria.ctg(0).porcentajeSecadoHumedad = 45.6
    Parametros.primaria.ctg(0).importeSecado = 98.23
    Parametros.primaria.ctg(0).pesoNetoMermaSecado = 38379.45
    Parametros.primaria.ctg(0).tarifaSecado = 986.32
    Parametros.primaria.ctg(0).importeZarandeo = 87352.32
    Parametros.primaria.ctg(0).pesoNetoMermaZarandeo = 908.34
    Parametros.primaria.ctg(0).tarifaZarandeo  = 36.3

    Parametros.primaria.ctg(1).nroCTG = 2234442
    Parametros.primaria.ctg(1).nroCartaDePorte = 22343
    Parametros.primaria.ctg(1).pesoNetoConfirmadoDefinitivo = 32222.3
    Parametros.primaria.ctg(1).porcentajeSecadoHumedad = 54.4
    Parametros.primaria.ctg(1).importeSecado = 344.3
    Parametros.primaria.ctg(1).pesoNetoMermaSecado = 9092.2
    Parametros.primaria.ctg(1).tarifaSecado = 2.2
    Parametros.primaria.ctg(1).importeZarandeo = 333.32
    Parametros.primaria.ctg(1).pesoNetoMermaZarandeo = 233.34
    Parametros.primaria.ctg(1).tarifaZarandeo  = 23.33

    Parametros.primaria.descripcionTipoGrano = "descripcionTipoGrano"
    Parametros.primaria.montoAlmacenaje = 233.4
    Parametros.primaria.montoAcarreo = 2322.34
    Parametros.primaria.montoGastosGenerales = 988.43
    Parametros.primaria.montoZarandeo = 8282.34
    Parametros.primaria.porcentajeSecadoDe = 14.56
    Parametros.primaria.porcentajeSecadoA = 30.56
    Parametros.primaria.montoSecado = 2987.23
    Parametros.primaria.montoPorCadaPuntoExceso = 3494.33
    Parametros.primaria.montoOtros = 3993.44

    Parametros.primaria.calidad.analisisMuestra = 344.34
    Parametros.primaria.calidad.nroBoletin = 2333.33
    Parametros.primaria.calidad.codGrado = "G1"
    Parametros.primaria.calidad.valorGrado = 1.1
    Parametros.primaria.calidad.valorContProteico = 32.3
    Parametros.primaria.calidad.valorFactor = 38.45

    Parametros.primaria.calidad.detalleMuestraAnalisis(0).descripcionRubro = "descripcionRubro"
    Parametros.primaria.calidad.detalleMuestraAnalisis(0).tipoRubro = TipoRubro_B
    Parametros.primaria.calidad.detalleMuestraAnalisis(0).porcentaje = 10.5
    Parametros.primaria.calidad.detalleMuestraAnalisis(0).valor = 100.58

    Parametros.primaria.calidad.detalleMuestraAnalisis(1).descripcionRubro = "descripcionRubro"
    Parametros.primaria.calidad.detalleMuestraAnalisis(1).tipoRubro = TipoRubro_R
    Parametros.primaria.calidad.detalleMuestraAnalisis(1).porcentaje = 10.5
    Parametros.primaria.calidad.detalleMuestraAnalisis(1).valor = 100.59

    Parametros.primaria.pesoNetoMermaVolatil = 30.4
    Parametros.primaria.serviciosFormaDePago = "serviciosFormaDePago"
    Parametros.primaria.serviciosOtros = 309.45
    Parametros.primaria.serviciosConceptosNoGravados = 345.45
    Parametros.primaria.serviciosPercepcionesIVA = 223.23
    Parametros.primaria.serviciosOtrasPercepciones = 2223.34

    Parametros.retiroTransferencia.certificadoDeposito.coeCertificadoDeposito = 50.44
    Parametros.retiroTransferencia.certificadoDeposito.pesoNeto = 983.34

    Parametros.retiroTransferencia.nroActDepositario = 73863334
    Parametros.retiroTransferencia.cuitReceptor = 27929007862
    Parametros.retiroTransferencia.nroActDepositario = 365
    Parametros.retiroTransferencia.nroCartaPorteAUtilizar = 233223

    Parametros.preexistente.nroPlanta = 1
    Parametros.preexistente.tipoCertificadoDepositoPreexistente = 2
    Parametros.preexistente.nroCertificadoDepositoPreexistente = 3
    Parametros.preexistente.cacCertificadoDepositoPreexistente = 4
    Parametros.preexistente.fechaEmisionCertificadoDepositoPreexistente = "2013-02-07"
    Parametros.preexistente.pesoNeto = 100


      Respuesta = wslpg.cgAutorizar(Parametros)
      if not Respuesta.oReturn.HayErrores then
        ptoEmision = Respuesta.oReturn.autorizacion.ptoEmision
        nroOrden = Respuesta.oReturn.autorizacion.nroOrden
        coe = Respuesta.oReturn.autorizacion.coe
        estado = Respuesta.oReturn.autorizacion.estado
        fechaCertificacion = Respuesta.oReturn.autorizacion.fechaCertificacion
        pesoBrutoCertificado = Respuesta.oReturn.autorizacion.pesosResumen.pesoBrutoCertificado
        pesoMermaVolatil = Respuesta.oReturn.autorizacion.pesosResumen.pesoMermaVolatil
        pesoMermaSecado = Respuesta.oReturn.autorizacion.pesosResumen.pesoMermaSecado
        pesoMermaZarandeo = Respuesta.oReturn.autorizacion.pesosResumen.pesoMermaZarandeo
        pesoNetoCertificado = Respuesta.oReturn.autorizacion.pesosResumen.pesoNetoCertificado
        servicioSecado = Respuesta.oReturn.autorizacion.serviciosResumen.servicioSecado
        servicioZarandeo = Respuesta.oReturn.autorizacion.serviciosResumen.servicioZarandeo
        servicioOtros = Respuesta.oReturn.autorizacion.serviciosResumen.servicioOtros
        servicioGastosGenerales = Respuesta.oReturn.autorizacion.serviciosResumen.servicioGastosGenerales
        importeIVA = Respuesta.oReturn.autorizacion.serviciosResumen.importeIVA
        servicioTotal = Respuesta.oReturn.autorizacion.serviciosResumen.servicioTotal
        nroPlanta = Respuesta.oReturn.autorizacion.planta.nroPlanta
        cuitTitularPlanta = Respuesta.oReturn.autorizacion.planta.cuitTitularPlanta
      end
      else
        MessageBox(Respuesta.oReturn.Errores)
      endif
  else
    MessageBox(wslpg.ErrorDesc)
  endif
