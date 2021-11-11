using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic;


namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class UpdateSize1 : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoDirectlyToOrderNumber_Click(object sender, EventArgs e)
        {
            DateTime? startDate = ctrlStartDatePicker.SelectedDate;
            DateTime? endDate = ctrlEndDatePicker.SelectedDate;
            List<int> productIds = new List<int>();
            string strStatus = string.Empty;
            string idsMap = string.Empty;
            string idsMapNeedCheck = string.Empty;
            DataSet ds = new DataSet();
            DataSet dsNeedCheck = new DataSet();
            string connectionString = ConfigurationManager.ConnectionStrings["JsSqlConnection"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create the command and set its properties.
                    SqlCommand command = new SqlCommand();
                    command.Connection = connection;
                    command.CommandText = "GetProductIdsInvolve";
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter and set its properties.
                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "@startDate";
                    parameter.SqlDbType = SqlDbType.DateTime;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = startDate;

                    // Add the parameter to the Parameters collection. 
                    command.Parameters.Add(parameter);

                    // Add the input parameter and set its properties.
                    SqlParameter parameter2 = new SqlParameter();
                    parameter2.ParameterName = "@endDate";
                    parameter2.SqlDbType = SqlDbType.DateTime;
                    parameter2.Direction = ParameterDirection.Input;
                    parameter2.Value = endDate;

                    // Add the parameter to the Parameters collection. 
                    command.Parameters.Add(parameter2);


                    // Open the connection and execute the reader.
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            productIds.Add(int.Parse(reader[0].ToString()));
                        }
                    }
                    else
                    {
                        // Console.WriteLine("No rows found.");
                    }
                    reader.Close();
                }
                
            }
            catch (Exception exc)
            {
                throw exc;
            }

            ProductVariantAttributesControl pv = new ProductVariantAttributesControl();
            foreach(int i in productIds)
            {
                try
                {

                    pv.UpdateSize(i);
                    idsMap += i + ",";
                    
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }           
            
            if(idsMap.Length >=1)
            {
                idsMap = idsMap.Remove(idsMap.Length - 1);
                ds = GetProductByIdsMap(idsMap);
                grvOutOfStockProducts.DataSource = ds;
                grvOutOfStockProducts.DataBind();
            }
        }

        protected DataSet GetProductByIdsMap(string idsMap)
        {
            string nopConnectionString = ConfigurationManager.ConnectionStrings["NopSqlConnection"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(nopConnectionString))
                {

                    SqlCommand command = new SqlCommand();
                    command.Connection = connection;
                    command.CommandText = "GetProductByIdsMap";
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter and set its properties.
                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "@idsmap";
                    parameter.SqlDbType = SqlDbType.NVarChar;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = idsMap;

                    command.Parameters.Add(parameter);

                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;
                }
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }


        protected void btnViewOutOfStockProduct_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NopSqlConnection"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    
                    string sql = "select * from view_GetOutOfStockProduct";                    
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    grvOutOfStockProducts.DataSource = ds;
                    grvOutOfStockProducts.DataBind();                    
                }

            }
            catch (Exception exc)
            {

            }
        }

        protected void btnUpdateProductUrl_Click(object sender, EventArgs e)
        {
            //get all product not deleted
            DataSet ds = new DataSet();
            string connectionString = ConfigurationManager.ConnectionStrings["NopSqlConnection"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string sql = "select [ProductId] from [dbo].[Nop_Product] where Deleted = 0";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);                    
                    sda.Fill(ds);
                    
                }

            }
            catch (Exception exc)
            {

            }
            //get updat urls
            
            for(int i=0; i<ds.Tables[0].Rows.Count;i++)
            {
                int productId = int.Parse(ds.Tables[0].Rows[i][0].ToString());

                this.ProductService.UpdatePic(productId);
            }
            //lblEndDate.Text = ds.Tables.Count.ToString();
        }
    }
}