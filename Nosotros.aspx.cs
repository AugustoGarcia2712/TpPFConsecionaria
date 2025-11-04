using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoPFconcesionaria4
{
    public partial class Nosotros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si hay sesión activa
            if (Session["Usuario"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        // El método btnSalir_Click está comentado correctamente:
        // protected void btnSalir_Click(object sender, EventArgs e)
        // {
        //     Session.Clear(); // Cierra la sesión
        //     Response.Redirect("login.aspx");
        // }
    }
}