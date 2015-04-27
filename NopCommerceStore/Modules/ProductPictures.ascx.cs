using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductPictures : BaseNopFrontendUserControl
    {
        ProductPicture productPicture = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                iProductPicuture.ImageUrl = this.PictureService.GetPictureUrl(productPicture.Picture, 0, false, SEOHelper.GetSEName(productPicture.NpProduct.LocalizedName));
                iProductPicuture.Width = new Unit("100%");
                iProductPicuture.AlternateText = string.Format("{0} Giá:{1}", productPicture.NpProduct.LocalizedName, productPicture.NpProduct.ProductVariants[0].Price.ToString("C", new System.Globalization.CultureInfo("vi-VN")));

                lProductPictureDescription.Visible = productPicture.PictureDescription == string.Empty ? false : true;
                lProductPictureDescription.Text = productPicture.PictureDescription;

                linkProductPictureURL.NavigateUrl = this.PictureService.GetPictureUrl(productPicture.Picture, 0, false, SEOHelper.GetSEName(productPicture.NpProduct.LocalizedName));
                linkProductPictureURL.Attributes.Add("data-fresco-caption", productPicture.PictureDescription);
            }
        }

        public ProductPicture ProductPicture
        {
            get { return productPicture; }
            set { productPicture = value; }
        }        

        public int ProductImageSize
        {
            get
            {
                if (ViewState["ProductImageDescriptionSize"] == null)
                    return this.SettingManager.GetSettingValueInteger("Media.Product.ThumbnailImageDescriptionSize", 768);
                else
                    return (int)ViewState["ProductImageDescriptionSize"];
            }
            set
            {
                ViewState["ProductImageDescriptionSize"] = value;
            }
        }
    }
}