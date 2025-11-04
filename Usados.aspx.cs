using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TrabajoPFconcesionaria4
{
    public partial class Usados : System.Web.UI.Page
    {
        // CADENA DE CONEXIÓN 
        private string connectionString = "Data Source=DESKTOP-1HTEND1;Initial Catalog=Concesionaria4PF;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                CargarAutos();
            }
        }

        private void CargarAutos()
        {
            string query = "SELECT NombreAuto, Marca, Color, AnioFabricacion, Combustible, TipoMotor, Precio FROM AutosUsados ORDER BY Marca, NombreAuto";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();

                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        // gvAutos es el ID del GridView en Usados.aspx
                        gvAutos.DataSource = dt;
                        gvAutos.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error al cargar los autos: " + ex.Message);
                    }
                }
            }
        }
    }
}