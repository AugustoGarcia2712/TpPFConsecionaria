using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Net;
using System.Net.Mail;

namespace TrabajoPFconcesionaria4
{
    public partial class Preguntas : System.Web.UI.Page
    {
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mail = new MailMessage();

                // Desde dónde sale el correo (tu correo)
                mail.From = new MailAddress("telecentrocasameliaugu@gmail.com");

                // A dónde llega (destinatario)
                mail.To.Add("garciaaugusto51@gmail.com");

                // Asunto
                mail.Subject = "Consulta desde la web - Preguntas Frecuentes";

                // Cuerpo del mensaje
                mail.Body =
                    "Nombre: " + txtNombre.Text + "<br>" +
                    "Email: " + txtEmail.Text + "<br>" +
                    "Mensaje:<br>" + txtMensaje.Text;

                mail.IsBodyHtml = true;

                // Configuración del servidor SMTP
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("telecentrocasameliaugu@gmail.com", "mjgx hzdm tufq lonj");
                smtp.EnableSsl = true;

                smtp.Send(mail);

                // Mensaje de confirmación
                Response.Write("<script>alert('Mensaje enviado correctamente.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al enviar: " + ex.Message + "');</script>");
            }
        }
    }
}

namespace TrabajoPFconcesionaria4
{
    public partial class Preguntas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}