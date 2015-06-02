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
using System.Web.Caching;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.BusinessLogic.Templates;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.Common;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using NopSolutions.NopCommerce.BusinessLogic.Products.Specs;
using System.Globalization;
namespace NopSolutions.NopCommerce.Web
{
    public partial class ProductPage : BaseNopFrontendPage
    {
        Product product = null;

        private void CreateChildControlsTree()
        {
            product = this.ProductService.GetProductById(this.ProductId);
            if (product != null)
            {
                Control child = null;

                ProductTemplate productTemplate = product.ProductTemplate;
                if (productTemplate == null)
                    throw new NopException(string.Format("Product template path can not be empty. Product ID={0}", product.ProductId));

                child = base.LoadControl(productTemplate.TemplatePath);
                this.ProductPlaceHolder.Controls.Add(child);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.CreateChildControlsTree();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (product == null || product.Deleted)
            {
                Response.StatusCode = 404;
                string url = string.Format(CultureInfo.InvariantCulture, "{0}pagenotfound.html", CommonHelper.GetStoreLocation());
                Response.Redirect(url);
            }
                //Response.Redirect(CommonHelper.GetStoreLocation());
            
            //title, meta
            string title = string.Empty;
            string metaDescription = string.Empty;
            string metaKeyword = product.LocalizedMetaKeywords;

            if (!string.IsNullOrEmpty(product.LocalizedMetaTitle))
                title = product.LocalizedMetaTitle;
            else
                title = product.LocalizedName;

            if (!string.IsNullOrEmpty(product.LocalizedMetaDescription))
                metaDescription = product.LocalizedMetaDescription;
            else
                metaDescription = string.Format("{0}. {1}", product.LocalizedName, product.ShortDescription);            

            SEOHelper.RenderTitle(this, title, true);
            SEOHelper.RenderMetaTag(this, "description", metaDescription, true);
            SEOHelper.RenderMetaTag(this, "keywords", metaKeyword, true);

            //canonical URL
            if (SEOHelper.EnableUrlRewriting &&
                this.SettingManager.GetSettingValueBoolean("SEO.CanonicalURLs.Products.Enabled"))
            {
                if (!this.SEName.Equals(SEOHelper.GetProductSEName(product)))
                {
                    string canonicalUrl = SEOHelper.GetProductUrl(product);

                    SEOHelper.RenderCanonicalTag(Page, canonicalUrl);
                }
                var specificationAttribute = this.SpecificationAttributeService.GetSpecificationAttributes();
                string[] specifationAttributeName = new string[specificationAttribute.Count];
                if (specificationAttribute.Count > 0)
                {
                    
                    for (int i = 0; i < specificationAttribute.Count; i++)
                    {
                        specifationAttributeName[i] = specificationAttribute[i].Name.ToLower().Replace(" ","");
                    }
                }
                SEOHelper.AddCanonicalTag(Page, specifationAttributeName);
            }

            if (!Page.IsPostBack)
            {
                this.ProductService.AddProductToRecentlyViewedList(product.ProductId);
            }
        }

        public int ProductId
        {
            get
            {
                return CommonHelper.QueryStringInt("ProductId");
            }
        }

        public string SEName
        {
            get
            {
                return CommonHelper.QueryString("SEName");
            }
        }

        public override PageSslProtectionEnum SslProtected
        {
            get
            {
                return PageSslProtectionEnum.No;
            }
        }
    }
}