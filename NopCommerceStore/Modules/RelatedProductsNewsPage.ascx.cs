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
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Modules 
{
    public partial class RelatedProductsNewsPageControl : BaseNopFrontendUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        protected void BindData()
        {
            var product = this.ProductService.GetProductById(this.ProductId);
            
                int totalRecords = 0;
                var products = this.ProductService.GetAllProducts(0,
                    0, 0, null, null, null, this.ProductId, string.Empty, false, int.MaxValue,
                    0, null, NopContext.Current.WorkingLanguage.LanguageId,
                    ProductSortingEnum.CreatedOn, out totalRecords);
                var numberofRelatedProduct = this.SettingManager.GetSettingValueInteger("Product.NumberOfRelatedProductOnNewsPage", 12);
                if (products.Count >= numberofRelatedProduct)
                {
                    this.Visible = true;
                    dlRelatedProducts.DataSource = products.GetRange(0, numberofRelatedProduct);
                    dlRelatedProducts.DataBind();
                }
                else
                {
                    var cateId = product.ProductCategories[0].CategoryId;
                    products = this.ProductService.GetAllProducts(cateId,
                    0, 0, null, null, null, 0, string.Empty, false, int.MaxValue,
                    0, null, NopContext.Current.WorkingLanguage.LanguageId,
                    ProductSortingEnum.CreatedOn, out totalRecords);

                    if (products.Count == 0)
                    {
                        return;
                    }

                    if(products.Count <= numberofRelatedProduct)
                    {
                        dlRelatedProducts.DataSource = products;
                        dlRelatedProducts.DataBind();
                        return;
                    }

                    var currentProductPosition = products.FindIndex(FindProduct);
                    if (currentProductPosition == products.Count - 1)
                    {
                        currentProductPosition = -1;
                        dlRelatedProducts.DataSource = products.GetRange(currentProductPosition + 1, numberofRelatedProduct);
                        dlRelatedProducts.DataBind();
                        return;
                    }

                    if (currentProductPosition >= products.Count - numberofRelatedProduct-1)
                    {
                        dlRelatedProducts.DataSource = products.GetRange(currentProductPosition + 1, products.Count - currentProductPosition-1);
                        dlRelatedProducts.DataBind();
                        return;
                    }

                    dlRelatedProducts.DataSource = products.GetRange(currentProductPosition + 1,numberofRelatedProduct);
                    dlRelatedProducts.DataBind();
                    
                }

            
        }
        // Explicit predicate delegate. 
        private bool FindProduct(Product p)
        {

            if (p.ProductId == this.ProductId)
            {
                return true;
            }
            {
                return false;
            }

        }

        protected void dlRelatedProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var product = e.Item.DataItem as Product;
                if (product != null)
                {
                    string productURL = SEOHelper.GetProductUrl(product);

                    var hlImageLink = e.Item.FindControl("hlImageLink") as HyperLink;
                    if (hlImageLink != null)
                    {
                        var picture = product.DefaultPicture;
                        if (picture != null)
                            hlImageLink.ImageUrl = this.PictureService.GetPictureUrl(picture, this.SettingManager.GetSettingValueInteger("Media.Product.ThumbnailImageSize", 125), true);
                        else
                            hlImageLink.ImageUrl = this.PictureService.GetDefaultPictureUrl(this.SettingManager.GetSettingValueInteger("Media.Product.ThumbnailImageSize", 125));
                        hlImageLink.NavigateUrl = productURL;
                        hlImageLink.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageLinkTitleFormat"), product.LocalizedName);
                        hlImageLink.Text = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                    }

                    var hlProduct = e.Item.FindControl("hlProduct") as HyperLink;
                    if (hlProduct != null)
                    {
                        hlProduct.NavigateUrl = productURL;
                        hlProduct.Text = product.LocalizedName;
                    }
                }
            }
        }

        public int ProductId
        {
            get
            {
                return CommonHelper.QueryStringInt("ProductId");
            }
        }
    }
}