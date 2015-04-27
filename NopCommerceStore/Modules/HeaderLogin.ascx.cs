using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class HeaderLogin : BaseNopFrontendUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lFinishImpersonate_Click(object sender, EventArgs e)
        {
            if (NopContext.Current.IsCurrentCustomerImpersonated &&
                NopContext.Current.OriginalUser != null)
            {
                NopContext.Current.OriginalUser.ImpersonatedCustomerGuid = Guid.Empty;
                string returnUrl = CommonHelper.GetStoreAdminLocation();
                if (NopContext.Current.User != null)
                {
                    returnUrl = string.Format("{0}CustomerDetails.aspx?CustomerID={1}&TabID={2}", returnUrl, NopContext.Current.User.CustomerId, "pnlCustomerPlaceOrder");
                }
                Response.Redirect(returnUrl);
            }
        }
    }
}