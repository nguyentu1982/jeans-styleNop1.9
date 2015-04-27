//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using Service = NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.Service;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class HomePageServiceControl: BaseNopFrontendUserControl
    {
        protected override void OnPreRender(EventArgs e)
        {
            BindData();
            base.OnPreRender(e);
        }

        protected string GetServiceRSSUrl()
        {
            return SEOHelper.GetServiceRssUrl();
        }

        protected void BindData()
        {
            if (this.ServiceService.ServiceEnabled && this.ServiceService.ShowServiceOnMainPage)
            {
                var newsCollection = this.ServiceService.GetAllService(NopContext.Current.WorkingLanguage.LanguageId, this.ServiceService.MainPageServiceCount);
                if (newsCollection.Count > 0)
                {
                    rptrService.DataSource = newsCollection;
                    rptrService.DataBind();

                }
                else
                {
                    this.Visible = false;
                }
            }
            else
            {
                this.Visible = false;
            }
        }
    }
}