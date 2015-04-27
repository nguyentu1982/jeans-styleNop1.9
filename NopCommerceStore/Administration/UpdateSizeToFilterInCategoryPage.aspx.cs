using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NopSolutions.NopCommerce.Web.Administration
{
    public partial class UpdateSizeToFilterInCategoryPage : BaseNopAdministrationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdateSize_Click(object sender, EventArgs e)
        {
            this.ProductService.UpdateSizeToFilterInCategoryPage();
        }
    }
}