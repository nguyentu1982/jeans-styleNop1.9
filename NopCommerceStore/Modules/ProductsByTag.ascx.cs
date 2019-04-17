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
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductsByTagControl: BaseNopFrontendUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }

        }

        protected void BindData()
        {
            var productTag = this.ProductService.GetProductTagById(this.ProductTagId);
            
            if (productTag == null)
            {
                string url = CommonHelper.GetStoreLocation();
                Response.Redirect(url);
            }

            lTitle.Text = string.Format(GetLocaleResourceString("ProductTags.Title", Server.HtmlEncode(productTag.Name)));
            lDescription.Text = productTag.Description;
            //page size
            int totalRecords = 0;
            int pageSize = 48;
            
            if(this.SettingManager.GetSettingValueInteger("ProductTags.PageSize")>0)
            {
                pageSize = this.SettingManager.GetSettingValueInteger("ProductTags.PageSize");
            }

            var productCollection = this.ProductService.GetAllProducts(0, 0, 
                productTag.ProductTagId, false, null, null,
                string.Empty, false, pageSize, this.CurrentPageIndex,
                null, ProductSortingEnum.CreatedOn, out totalRecords);

            if (productCollection.Count > 0)
            {
                this.productsPager.PageSize = pageSize;
                this.productsPager.TotalRecords = totalRecords;
                this.productsPager.PageIndex = this.CurrentPageIndex;

                

                this.dlProducts.DataSource = productCollection;
                this.dlProducts.DataBind();

                RenderLinkTagNextPrevPagerForSEO();
            }
            else
            {
                this.dlProducts.Visible = false;
            }
        }

        private void RenderLinkTagNextPrevPagerForSEO()
        {
            if (productsPager.TotalPages == 1)
            {
                return;
            }
            string url = CommonHelper.GetThisPageUrl(true);
            var productTag = this.ProductService.GetProductTagById(this.ProductTagId);

            string title = productTag.MetaTile + " - Trang " + (this.CurrentPageIndex + 1);
            
            string description = productTag.MetaDescription + " - Trang " + (this.CurrentPageIndex +1) ;
            
            if (this.CurrentPageIndex == 0)
            {
                url = CommonHelper.ModifyQueryString(url, "pageindex=" + (this.CurrentPageIndex + 2), null);
                SEOHelper.RenderLinkTagPager(this.Page, "next", url);
                return;
            }


            if (this.CurrentPageIndex == productsPager.TotalPages - 1)
            {
                url = CommonHelper.ModifyQueryString(url, "pageindex=" + CurrentPageIndex, null);
                SEOHelper.RenderLinkTagPager(this.Page, "prev", url);
                SEOHelper.RenderTitle(this.Page, title, true);
                SEOHelper.RenderMetaTag(this.Page, "description", description, true);
                return;
            }

            url = CommonHelper.ModifyQueryString(url, "pageindex=" + this.CurrentPageIndex, null);
            SEOHelper.RenderLinkTagPager(this.Page, "prev", url);

            url = CommonHelper.ModifyQueryString(url, "pageindex=" + (this.CurrentPageIndex + 2), null);
            SEOHelper.RenderLinkTagPager(this.Page, "next", url);

            SEOHelper.RenderTitle(this.Page, title, true);
            SEOHelper.RenderMetaTag(this.Page, "description", description, true);
        }

        public int CurrentPageIndex
        {
            get
            {
                int _pageIndex = CommonHelper.QueryStringInt(productsPager.QueryStringProperty);
                _pageIndex--;
                if (_pageIndex < 0)
                    _pageIndex = 0;
                return _pageIndex;
            }
        }

        public int ProductTagId
        {
            get
            {
                return CommonHelper.QueryStringInt("tagid");
            }
        }
    }
}
