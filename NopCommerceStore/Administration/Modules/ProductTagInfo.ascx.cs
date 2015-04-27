using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.Common.Utils;


namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ProductTagInfo : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindData();
            }
        }

        private void BindData()
        {
            var proTag = this.ProductService.GetProductTagById(this.ProductTagId);
            if (proTag != null)
            {
                txtLocalizedDescription.Value = proTag.Description;
            }
        }

        internal BusinessLogic.Products.ProductTag SaveInfo()
        {
            var proTag = this.ProductService.GetProductTagById(this.ProductTagId);
            proTag.Description = txtLocalizedDescription.Value;
            this.ProductService.UpdateProductTag(proTag);
            return proTag;
        }

        public int ProductTagId
        {
            get
            {
                return CommonHelper.QueryStringInt("ProductTagId");
            }
        }

        protected string TabId
        {
            get
            {
                return CommonHelper.QueryString("TabId");
            }
        }

    }
}