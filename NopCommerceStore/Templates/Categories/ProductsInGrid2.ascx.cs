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
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Templates.Categories
{
    public partial class ProductsInGrid2: BaseNopFrontendUserControl
    {
        private int categoryId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                BindData();
            }
        }

       

        protected void BindData()
        {
            var category = this.CategoryService.GetCategoryById(this.CategoryId);

            //subcategories
            var subCategories = this.CategoryService.GetAllCategoriesByParentCategoryId(category.CategoryId);
            if (subCategories.Count > 0)
            {
                dlSubCategories.DataSource = subCategories;
                dlSubCategories.DataBind();
            }
            else
                dlSubCategories.Visible = false;

            //page size
            int totalRecords = 0;
            int pageSize = SettingManager.GetSettingValueInteger("PageSizeCateOnHomePage");        

            //price ranges            
            decimal? minPriceConverted = null;
            decimal? maxPriceConverted = null;

            var productCollection = this.ProductService.GetAllProducts(this.CategoryId,
                0, 0, false, minPriceConverted, maxPriceConverted,
                string.Empty, false, pageSize, this.CurrentPageIndex, 
                null, ProductSortingEnum.CreatedOn, out totalRecords);

            if (productCollection.Count > 0)
            {
                this.dlProducts.DataSource = productCollection;
                this.dlProducts.DataBind();
            }
            else
            {
                this.dlProducts.Visible = false;
                
            }
        }

       

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            
        }

        protected override void OnPreRender(EventArgs e)
        {
            
            base.OnPreRender(e);
        }

        protected void dlSubCategories_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem )
            {
                var category = e.Item.DataItem as Category;
                string categoryURL = SEOHelper.GetCategoryUrl(category);

                var hlImageLink = e.Item.FindControl("hlImageLink") as HyperLink;
                if (hlImageLink != null)
                {
                    hlImageLink.ImageUrl = this.PictureService.GetPictureUrl(category.PictureId, this.SettingManager.GetSettingValueInteger("Media.Category.ThumbnailImageSize", 125), true);
                    hlImageLink.NavigateUrl = categoryURL;
                    hlImageLink.ToolTip = String.Format(GetLocaleResourceString("Media.Category.ImageLinkTitleFormat"), category.LocalizedName);
                    hlImageLink.Text = String.Format(GetLocaleResourceString("Media.Category.ImageAlternateTextFormat"), category.LocalizedName);
                }

                var hlCategory = e.Item.FindControl("hlCategory") as HyperLink;
                if (hlCategory != null)
                {
                    hlCategory.NavigateUrl = categoryURL;
                    hlCategory.ToolTip = String.Format(GetLocaleResourceString("Media.Category.ImageLinkTitleFormat"), category.LocalizedName);
                    hlCategory.Text = Server.HtmlEncode(category.LocalizedName);
                }
            }
        }

        public int CurrentPageIndex
        {
            get
            {
                //int _pageIndex = CommonHelper.QueryStringInt(productsPager.QueryStringProperty);
                //_pageIndex--;
                //if (_pageIndex < 0)
                //    _pageIndex = 0;
                return 0;
            }
        }

        public int CategoryId
        {
           get {return categoryId;}
            set { categoryId = value; }
        }
    }
}
