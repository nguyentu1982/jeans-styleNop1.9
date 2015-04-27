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
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class CategoryNavigation: BaseNopFrontendUserControl
    {
        #region Classes
        public class NopCommerceLi : WebControl, INamingContainer
        {
            public NopCommerceLi()
            {
                this.HyperLink = new HyperLink();
            }

            protected override void Render(System.Web.UI.HtmlTextWriter writer)
            {
                writer.WriteBeginTag("li");
                writer.WriteAttribute("class", this.CssClass);
                if (!String.IsNullOrEmpty(this.LiLeftMargin))
                {
                    writer.WriteAttribute("style", string.Format("margin-left: {0}px", this.LiLeftMargin));
                }
                writer.Write(HtmlTextWriter.TagRightChar);
                this.HyperLink.RenderControl(writer);
                writer.WriteEndTag("li");
            }

            public string LinkText
            {
                get
                {
                    return this.HyperLink.Text;
                }
                set
                {
                    if (value != null)
                    {
                        this.HyperLink.Text = value;
                    }
                }
            }

            public HyperLink HyperLink { get; set; }

            public string LiLeftMargin
            {
                get
                {
                    object liLeftMargin = this.ViewState["LiLeftMargin"];
                    if (liLeftMargin != null)
                        return Convert.ToString(liLeftMargin);
                    return string.Empty;

                }
                set
                {
                    this.ViewState["LiLeftMargin"] = value;
                }
            }
        }
        #endregion
        
        #region Overrides
        protected override void CreateChildControls()
        {
            if (!this.ChildControlsCreated)
            {
                CreateMenu();
                base.CreateChildControls();
                ChildControlsCreated = true;
            }
        }
        #endregion

        #region Utilities

        protected void CreateMenu()
        {
            List<Category> breadCrumb = null;
            var currentCategory = this.CategoryService.GetCategoryById(CommonHelper.QueryStringInt("CategoryId"));
            if (currentCategory == null)
            {
                var product = this.ProductService.GetProductById(CommonHelper.QueryStringInt("ProductId"));
                if (product != null)
                {
                    var productCategories = product.ProductCategories;
                    if (productCategories.Count > 0)
                    {
                        currentCategory = productCategories[0].Category;
                    }
                }
            }

            if (currentCategory != null)
            {
                breadCrumb = this.CategoryService.GetBreadCrumb(currentCategory.CategoryId);                
            }
            else
            {
                breadCrumb = new List<Category>();                
            }
            CreateChildMenu(breadCrumb, 0, currentCategory, 0);
                
        }

        protected int GetNumberOfProducts(Category category, bool includeSubCategories)
        {
            int numberOfProducts = 0;
            var products = this.ProductService.GetAllProducts(category.CategoryId,
                        0, 0, null, null, null, string.Empty, false, 1, 0,
                        null, ProductSortingEnum.Position, out numberOfProducts);

            if (includeSubCategories)
            {
                var subCategories = this.CategoryService.GetAllCategoriesByParentCategoryId(category.CategoryId);
                foreach (var subCategory in subCategories)
                {
                    int tmp1 = GetNumberOfProducts(subCategory, includeSubCategories);
                    numberOfProducts += tmp1;
                }
            }
            return numberOfProducts;
        }

        protected void CreateChildMenu(List<Category> breadCrumb, int rootCategoryId, Category currentCategory, int level)
        {
            int padding = level++ * 15;
            foreach (var category in this.CategoryService.GetAllCategoriesByParentCategoryId(rootCategoryId))
            {
                var link = new NopCommerceLi();
                phCategories.Controls.Add(link);

                string categoryURL = SEOHelper.GetCategoryUrl(category);
                if (currentCategory != null && currentCategory.CategoryId == category.CategoryId)
                    link.CssClass = "active";
                else
                    link.CssClass = "inactive";
                link.HyperLink.NavigateUrl = categoryURL;
                string catName = string.Empty;
                if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowCategoryProductNumber"))
                {
                    //display category name with assigned products number
                    int numberOfProducts = GetNumberOfProducts(category, this.SettingManager.GetSettingValueBoolean("Display.Products.ShowCategoryProductNumber.IncludeSubCategories"));
                    catName = string.Format("{0} ({1})", category.LocalizedName, numberOfProducts);
                }
                else
                {
                    //display only category name
                    catName = category.LocalizedName;
                }
                link.HyperLink.Text = Server.HtmlEncode(catName);
                if (padding > 0)
                    link.LiLeftMargin = padding.ToString();

                for (int i = 0; i <= breadCrumb.Count - 1; i++)
                    if (breadCrumb[i].CategoryId == category.CategoryId)
                        CreateChildMenu(breadCrumb, category.CategoryId, currentCategory, level);
                
                //CreateChildMenu(breadCrumb, category.CategoryId, category, level);                

            }
           
        }
        
        #endregion
    }
}