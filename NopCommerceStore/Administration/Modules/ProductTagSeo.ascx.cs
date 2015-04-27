using NopSolutions.NopCommerce.Common.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ProductTagSeo : BaseNopAdministrationUserControl
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
                txtMetaDescription.Text = proTag.MetaDescription;
                txtMetaKeywords.Text = proTag.MetaKeywords;
                txtMetaTitle.Text = proTag.MetaTile;
            }
        }

        internal void SaveInfo()
        {
            var proTag = this.ProductService.GetProductTagById(this.ProductTagId);
            proTag.MetaDescription = txtMetaDescription.Text;
            proTag.MetaKeywords = txtMetaKeywords.Text;
            proTag.MetaTile = txtMetaTitle.Text;

            this.ProductService.UpdateProductTag(proTag);
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