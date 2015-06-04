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
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.ExportImport;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Manufacturers;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.Utils;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ProductTagsControl : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        protected void gvProductTags_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvProductTags.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected override void OnPreRender(EventArgs e)
        {
            BindJQuery();

            base.OnPreRender(e);
        }

        protected List<ProductTag> GetProductTags()
        {
            var productTags = this.ProductService.GetAllProductTags();
            return productTags;
        }

        protected void BindGrid()
        {
            var productTags = GetProductTags();
            if (productTags.Count > 0)
            {
                this.gvProductTags.Visible = true;
                this.lblNoProductTags.Visible = false;
                this.gvProductTags.DataSource = productTags;
                this.gvProductTags.DataBind();

                Product product = this.ProductService.GetProductById(this.ProductId);
                if (product != null)
                {
                    Button btnDelete = FindControl("btnDelete") as Button;
                    btnDelete.Visible = false;

                    foreach (GridViewRow row in gvProductTags.Rows)
                    {
                        CheckBox cbProductTagInfo = row.FindControl("cbProductTag") as CheckBox;
                        HiddenField hfProductTagID = row.FindControl("hfProductTagId") as HiddenField;

                        int productTagId = int.Parse(hfProductTagID.Value);
                        bool isProductTagExisted = this.ProductService.DoesProductTagMappingExist(product.ProductId, productTagId);

                        if (isProductTagExisted)
                        {
                            cbProductTagInfo.Checked = true;
                        }
                        else
                        {
                            cbProductTagInfo.Checked = false;
                        }
                    }
                }
            }
            else
            {
                this.gvProductTags.Visible = false;
                this.lblNoProductTags.Visible = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in gvProductTags.Rows)
                {
                    var cbProductTag = row.FindControl("cbProductTag") as CheckBox;
                    var hfProductTagId = row.FindControl("hfProductTagId") as HiddenField;

                    bool isChecked = cbProductTag.Checked;
                    int productTagId = int.Parse(hfProductTagId.Value);
                    if (isChecked)
                    {
                        this.ProductService.DeleteProductTag(productTagId);
                    }
                }

                BindGrid();
            }
            catch (Exception ex)
            {
                ProcessException(ex);
            }
        }

        public void SaveInfo()
        {
            SaveInfo(this.ProductId);
        }

        public void SaveInfo(int prodId)
        {
            Product product = this.ProductService.GetProductById(prodId);
            if (product != null)
            {
                foreach (GridViewRow row in gvProductTags.Rows)
                {
                    CheckBox cbProductTagInfo = row.FindControl("cbProductTag") as CheckBox;
                    HiddenField hfProductTagID = row.FindControl("hfProductTagId") as HiddenField;

                    int productTagId =  int.Parse( hfProductTagID.Value);
                    bool isProductTagExisted = this.ProductService.DoesProductTagMappingExist(prodId, productTagId);

                    if (cbProductTagInfo.Checked && !isProductTagExisted)
                    { 
                        //Add
                        this.ProductService.AddProductTagMapping(prodId, productTagId);
                    }

                    if (!cbProductTagInfo.Checked && isProductTagExisted)
                    { 
                        //Delete
                        this.ProductService.RemoveProductTagMapping(prodId, productTagId);
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