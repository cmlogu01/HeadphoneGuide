using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeadphoneReview
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var ModelID = Request.QueryString["ModelID"];
                if (ModelID == null)
                {
                    Response.Redirect("Reviews.aspx");
                }

                //Set image
                Dictionary<String,String> sqlParams = new Dictionary<string, string>();
                sqlParams.Add("@ModelID",ModelID);
                Image.ImageUrl = GetData("SELECT Image FROM Products WHERE ModelID = @ModelID", sqlParams).Rows[0]["Image"] as String;
                Image.Width = Unit.Pixel(100);
                Image.Height = Unit.Pixel(100);

                String sql = "SELECT [ModelID], [Model], [Image], [Price], [Description], [Fit], [Type], [PurchaseLink] FROM [Products] P LEFT JOIN SoundTypes ST on P.SoundTypeID = ST.TypeID LEFT JOIN Fits F on P.FitID = F.FitID WHERE ModelID = @ModelID";
                var data = GetData(sql, sqlParams);
                if(data.Rows.Count <= 0)
                    Response.Redirect("Reviews.aspx");

                Model.Text = data.Rows[0]["Model"] as String;
                Description.Text = data.Rows[0]["Description"] as String;
                SoundType.Text = data.Rows[0]["Type"] as String;
                Fit.Text = data.Rows[0]["Fit"] as String;
                Price.Text = data.Rows[0]["Price"] is decimal? ? (data.Rows[0]["Price"] as Decimal?).Value.ToString("C2") : "$0.00";
                PurchaseLink.NavigateUrl = data.Rows[0]["PurchaseLink"] as String;

            }
        }
        private DataTable GetData(string query, Dictionary<String,String> sqlParams)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        foreach (KeyValuePair<string, string> param in sqlParams)
                        {
                            sda.SelectCommand.Parameters.Add(new SqlParameter(param.Key, param.Value));
                        }
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

    }
}