using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using lsplib;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int PtoVta;
            int TipoComprobante;
            lsplib.wslsp wslsp;
            lsplib.ConsultarUltimoNroComprobantePorPtoVtaResp ConsultaUltimoNroResponse;
            lsplib.GenerarLiquidacionReq Solicitud;
            lsplib.GenerarLiquidacionResp Respuesta;

            PtoVta = 200;
            TipoComprobante = 183;

            wslsp = new lsplib.wslsp();
            wslsp.CUIT = 20939802593;
            wslsp.modoProduccion = false;
            wslsp.Depurar = true;   // Genera archivos de depuracion Request.xml y Response.xml
            if (wslsp.login("certificado.crt", "clave.key"))
            {
                ConsultaUltimoNroResponse = wslsp.consultarUltimoNroComprobantePorPtoVta(PtoVta, TipoComprobante);
                if (!ConsultaUltimoNroResponse.respuesta.hayErrores)
                {
                    Solicitud = wslsp.nuevaLiquidacion();
                    Solicitud.codOperacion = 4;
                    Solicitud.emisor.puntoVenta = PtoVta;
                    Solicitud.emisor.tipoComprobante = TipoComprobante;
                    Solicitud.emisor.nroComprobante = ConsultaUltimoNroResponse.respuesta.nroComprobante + 1;
                    Solicitud.emisor.codCaracter = 5;
                    Solicitud.emisor.fechaInicioActividades = "2005-01-01";
                    Solicitud.emisor.iibb = "20939802593";
                    Solicitud.emisor.nroRUCA = 305;
                    Solicitud.receptor.codCaracter = 3;
                    Solicitud.receptor.operador.CUIT = 20160000024;
                    Solicitud.receptor.operador.iibb = "20160000024";
                    Solicitud.receptor.operador.nroRenspa = "22.123.1.12345/A4";
                    Solicitud.datosLiquidacion.fechaComprobante = "2017-05-04";
                    Solicitud.datosLiquidacion.fechaOperacion = "2017-05-04";
                    Solicitud.datosLiquidacion.lugarRealizacion = "CORONEL SUAREZ";
                    Solicitud.datosLiquidacion.codMotivo = 6;
                    Solicitud.guia[0].nroGuia = "1";
                    Solicitud.guia[1].nroGuia = "2";
                    Solicitud.dte[0].nroDTE = "418-1";
                    Solicitud.dte[1].nroDTE = "418-1";

                    Solicitud.itemDetalleLiquidacion[0].cuitCliente = 30160000011;
                    Solicitud.itemDetalleLiquidacion[0].codCategoria = 51020102;
                    Solicitud.itemDetalleLiquidacion[0].tipoLiquidacion = 1;
                    Solicitud.itemDetalleLiquidacion[0].cantidad = 2;
                    Solicitud.itemDetalleLiquidacion[0].precioUnitario = 20;
                    Solicitud.itemDetalleLiquidacion[0].alicuotaIVA = 10.5;
                    Solicitud.itemDetalleLiquidacion[0].Raza.codRaza = 1;

                    //****************SI LLEVA COMPRA ASOCIADA**************************************************
                    //          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).tipoComprobante = 185
                    //          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).puntoVenta = 3000
                    //          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).nroComprobante = 33
                    //          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).nroItem = 1
                    //          Solicitud.itemDetalleLiquidacion(0).liquidacionCompraAsociada(0).cantidadAsociada = 2

                    Solicitud.gasto[0].codGasto = 16;
                    Solicitud.gasto[0].baseImponible = 230520.6;
                    Solicitud.gasto[0].alicuota = 3;
                    Solicitud.gasto[0].alicuotaIVA = 10.5;

                    Solicitud.tributo[0].codTributo = 5;
                    Solicitud.tributo[0].baseImponible = 30520;
                    Solicitud.tributo[0].alicuota = 2.5;
                    Solicitud.datosAdicionales = "Datos Adicionales";
                    Respuesta = wslsp.generarLiquidacion();

                    if (Respuesta.respuesta.hayErrores)
                    {
                        MessageBox.Show(Respuesta.respuesta.errores);
                    }
                    else
                    {
                        MessageBox.Show("Felicitaciones, el CAE obtenido: " + Respuesta.respuesta.cabecera.cae.ToString());
                    }
                }
                else
                {
                    MessageBox.Show(ConsultaUltimoNroResponse.respuesta.errores);
                }
            }
            else
            {
                MessageBox.Show(wslsp.ErrorDesc);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            lsplib.wslsp wslsp = new lsplib.wslsp();
            wslsp.CUIT = 20939802593;
            wslsp.modoProduccion = false;
            wslsp.Depurar = true;
            if (wslsp.login("certificado.crt", "clave.key"))
            {
                lsplib.GenerarAjusteReq Solicitud = wslsp.nuevoAjuste();
                Solicitud.tipoAjuste = "C";
                Solicitud.fechaComprobante = "2017-06-05";
                Solicitud.emisor.puntoVenta = 10;
                Solicitud.emisor.nroComprobante = 1;
                Solicitud.emisor.ComprobanteAAjustar.tipoComprobante = 183;
                Solicitud.emisor.ComprobanteAAjustar.puntoVenta = 10;
                Solicitud.emisor.ComprobanteAAjustar.nroComprobante = 20;
                Solicitud.itemDetalleAjusteLiquidacion[0].nroItemAjustar = 1;
                Solicitud.itemDetalleAjusteLiquidacion[0].ajusteFisico.cantidad = 10;

                lsplib.GenerarAjusteResp Response = wslsp.generarAjuste();

                if (Response.respuesta.hayErrores)
                {
                    MessageBox.Show(Response.respuesta.errores);
                }
                else
                {
                    Response.respuesta.guardarPDF("c:\\datos\\liquidacion.pdf");
                    MessageBox.Show("Felicitaciones, el CAE obtenido: " + Response.respuesta.cabecera.cae.ToString());
                }
            }
            else
            {
                MessageBox.Show(wslsp.ErrorDesc);
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {

            lsplib.wslsp wslsp = new lsplib.wslsp();
            wslsp.CUIT = 20939802593;
            wslsp.modoProduccion = false;
            int puntoVenta = 10;
            int tipoComprobante = 183;
            int nroComprobante = 1;
            if (wslsp.login("certificado.crt", "clave.key"))
            {
                lsplib.ConsultarLiquidacionPorNroComprobanteResp Response = wslsp.consultarLiquidacionPorNroComprobante(puntoVenta, tipoComprobante, nroComprobante);
                if (Response.respuesta.hayErrores)
                {
                    MessageBox.Show(Response.respuesta.errores);
                }
                else
                {
                    Response.respuesta.guardarPDF("c:\\datos\\liquidacion.pdf");
                    MessageBox.Show("Felicitaciones,  consulta exitosa: " + Response.respuesta.cabecera.cae.ToString());
                }
            }
            else
            {
                MessageBox.Show(wslsp.ErrorDesc);
            }

        }



    }
}
