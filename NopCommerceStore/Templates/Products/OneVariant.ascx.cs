using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Audit;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Orders;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.Products.Attributes;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.Web.Modules;
using NopSolutions.NopCommerce.BusinessLogic.Manufacturers;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using NopSolutions.NopCommerce.BusinessLogic.Warehouses;

namespace NopSolutions.NopCommerce.Web.Templates.Products
{
    public partial class OneVariant: BaseNopFrontendUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            var product = this.ProductService.GetProductById(this.ProductId);
            if(product == null || product.ProductVariants.Count == 0)
            {
                //Response.Redirect(CommonHelper.GetStoreLocation());
                Response.StatusCode = 404;
            }
            ctrlProductRating.Visible = product.AllowCustomerRatings;
            BindProductVariantInfo(ProductVariant);
            BindProductInfo(product);
        }

        protected void BindProductInfo(Product product)
        {
            lProductName.Text = Server.HtmlEncode(product.LocalizedName);
            lProductName1.Text = Server.HtmlEncode(product.LocalizedName);
            lProductName2.Text = Server.HtmlEncode(product.LocalizedName);
            lShortDescription.Text = product.LocalizedShortDescription;
            
            //Warehouse
            List<Warehouse> warehouses = new List<Warehouse>();
            foreach (ProductVariant pv in ProductVariants)
            {
                warehouses.Add(pv.Warehouse);
            }
            rptStored.DataSource = warehouses;
            rptStored.DataBind();

            if(product.LocalizedFullDescription!=string.Empty)
            {
                divFuffDesc.Visible = true;
                lFullDescription.Text = product.LocalizedFullDescription;
            }

            //Product Pictures Description
            var productPictures = product.ProductPictures;
            dlProductPictureDesciption.DataSource = productPictures;
            dlProductPictureDesciption.DataBind();

            var cateId = product.ProductCategories[0].Category.CategoryId;
            var cateUrl = SEOHelper.GetCategoryUrl(cateId);
            hylinkCate.NavigateUrl = cateUrl;
            hylinkCate.Text = string.Format("{0} {1}", GetLocaleResourceString("Product.ContinueViewCate"), product.ProductCategories[0].Category.LocalizedName);
                        
            //manufacturers
            List<Manufacturer> manufacturers = new List<Manufacturer>();
            foreach (var pm in product.ProductManufacturers)
            {
                var manufacturer = pm.Manufacturer;
                if (manufacturer != null)
                    manufacturers.Add(manufacturer);
            }
            if (manufacturers.Count > 0)
            {
                if (manufacturers.Count == 1)
                {
                    lManufacturersTitle.Text = GetLocaleResourceString("Products.Manufacturer");
                }
                else
                {
                    lManufacturersTitle.Text = GetLocaleResourceString("Products.Manufacturers");
                }
                rptrManufacturers.DataSource = manufacturers;
                rptrManufacturers.DataBind();
            }
            else
            {
                phManufacturers.Visible = false;
            }

            //pictures
            var pictures = this.PictureService.GetPicturesByProductId(product.ProductId);

            if (pictures.Count > 1)
            {
                defaultImage.ImageUrl = this.PictureService.GetPictureUrl(pictures[0], this.SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300), true, SEOHelper.GetSEName(product.LocalizedName));
                defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);

                lvProductPictures.DataSource = pictures;
                lvProductPictures.DataBind();
            }
            else if (pictures.Count == 1)
            {
                defaultImage.ImageUrl = this.PictureService.GetPictureUrl(pictures[0], this.SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300), true, SEOHelper.GetSEName(product.LocalizedName));
                defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                lvProductPictures.Visible = false;
            }
            else
            {
                defaultImage.ImageUrl = this.PictureService.GetDefaultPictureUrl(this.SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300));
                defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.LocalizedName);
                lvProductPictures.Visible = false;
            }
            if(this.SettingManager.GetSettingValueBoolean("Media.Product.DefaultPictureZoomEnabled", true))
            {
                var picture = product.DefaultPicture;
                if (picture != null)
                {
                    lnkMainLightbox.Attributes["href"] = this.PictureService.GetPictureUrl(picture, 0, false, SEOHelper.GetSEName(product.LocalizedName));
                    //lnkMainLightbox.Attributes["rel"] = "lightbox-pd";
                }
            }

            if (this.SettingManager.GetSettingValueBoolean("Media.Product.DefaultPictureCloudZoomEnabled", true))
            {
                var picture = product.DefaultPicture;
                if (picture != null)
                {
                    lnkMainLightbox.Attributes["href"] = this.PictureService.GetPictureUrl(picture,0, false, SEOHelper.GetSEName(product.LocalizedName));
                    //lnkMainLightbox.Attributes["rel"] = "position: &#39;inside&#39; , showTitle: false, adjustX:-4, adjustY:-4";
                }
            }
        }
        
        protected void BindProductVariantInfo(ProductVariant productVariant)
        {
            btnAddToWishlist.Visible = this.SettingManager.GetSettingValueBoolean("Common.EnableWishlist");
            

            //sku
            if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowSKU") &&
                !String.IsNullOrEmpty(productVariant.SKU))
            {
                phSKU.Visible = true;
                lSKU.Text = Server.HtmlEncode(productVariant.SKU);
            }
            else
            {
                phSKU.Visible = false;
            }

            //manufacturer part number
            if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowManufacturerPartNumber") &&
                !String.IsNullOrEmpty(productVariant.ManufacturerPartNumber))
            {
                phManufacturerPartNumber.Visible = true;
                lManufacturerPartNumber.Text = Server.HtmlEncode(productVariant.ManufacturerPartNumber);
            }
            else
            {
                phManufacturerPartNumber.Visible = false;
            }

            ctrlTierPrices.ProductVariantId = productVariant.ProductVariantId;
            ctrlProductAttributes.ProductVariantId = productVariant.ProductVariantId;
            ctrlGiftCardAttributes.ProductVariantId = productVariant.ProductVariantId;
            ctrlProductPrice.ProductVariantId = productVariant.ProductVariantId;

            //discount tag
            decimal taxRate = decimal.Zero;
            decimal oldPriceBase = this.TaxService.GetPrice(productVariant, productVariant.OldPrice, out taxRate);
            decimal finalPriceWithoutDiscountBase = this.TaxService.GetPrice(productVariant, PriceHelper.GetFinalPrice(productVariant, false), out taxRate);
            decimal finalPriceWithDiscountBase = this.TaxService.GetPrice(productVariant, PriceHelper.GetFinalPrice(productVariant, true), out taxRate);

            decimal oldPrice = this.CurrencyService.ConvertCurrency(oldPriceBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
            decimal finalPriceWithoutDiscount = this.CurrencyService.ConvertCurrency(finalPriceWithoutDiscountBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
            decimal finalPriceWithDiscount = this.CurrencyService.ConvertCurrency(finalPriceWithDiscountBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);

            if (oldPrice > 0 && finalPriceWithDiscount == 0)
            {
                divDiscount.Visible = true;
                lbDiscount.Visible = true;
                lbDiscount.Text = string.Format("{0}%", Math.Round((((oldPrice - finalPriceWithoutDiscount) / oldPrice) * 100)));
            }

            if (oldPrice > 0 && finalPriceWithDiscount > 0)
            {
                divDiscount.Visible = true;
                lbDiscount.Visible = true;
                lbDiscount.Text = string.Format("{0}%", Math.Round((((oldPrice - finalPriceWithDiscount) / oldPrice) * 100)));
            }

            if (oldPrice == 0 && finalPriceWithDiscount > 0)
            {
                if (finalPriceWithDiscount < finalPriceWithoutDiscount)
                {
                    divDiscount.Visible = true;
                    lbDiscount.Visible = true;
                    lbDiscount.Text = string.Format("{0}%", Math.Round((((finalPriceWithoutDiscount - finalPriceWithDiscount) / finalPriceWithoutDiscount) * 100)));
                }
            }

            //stock
            string stockMessage = productVariant.FormatStockMessage();
            if (!String.IsNullOrEmpty(stockMessage))
            {
                lblStockAvailablity.Text = stockMessage;
            }
            else
            {
                pnlStockAvailablity.Visible = false;
            }
                        
            //price entered by a customer
            if (productVariant.CustomerEntersPrice)
            {
                decimal minimumCustomerEnteredPrice = this.CurrencyService.ConvertCurrency(productVariant.MinimumCustomerEnteredPrice, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
                decimal maximumCustomerEnteredPrice = this.CurrencyService.ConvertCurrency(productVariant.MaximumCustomerEnteredPrice, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
                txtCustomerEnteredPrice.Visible = true;
                txtCustomerEnteredPrice.ValidationGroup = string.Format("ProductVariant{0}", productVariant.ProductVariantId);
                txtCustomerEnteredPrice.Value = minimumCustomerEnteredPrice;
                txtCustomerEnteredPrice.MinimumValue = minimumCustomerEnteredPrice.ToString();
                txtCustomerEnteredPrice.MaximumValue = maximumCustomerEnteredPrice.ToString();
                txtCustomerEnteredPrice.RangeErrorMessage = string.Format(GetLocaleResourceString("Products.CustomerEnteredPrice.Range"),
                    PriceHelper.FormatPrice(minimumCustomerEnteredPrice, false, false),
                        PriceHelper.FormatPrice(maximumCustomerEnteredPrice, false, false));
            }
            else
            {
                txtCustomerEnteredPrice.Visible = false;
            }

            //buttons
            if(!productVariant.DisableBuyButton)
            {
                txtQuantity.ValidationGroup = string.Format("ProductVariant{0}", productVariant.ProductVariantId);
                btnAddToCart.ValidationGroup = string.Format("ProductVariant{0}", productVariant.ProductVariantId);
                btnAddToWishlist.ValidationGroup = string.Format("ProductVariant{0}", productVariant.ProductVariantId);

                txtQuantity.Value = productVariant.OrderMinimumQuantity;
            }
            else
            {
                txtQuantity.Visible = false;
                btnAddToCart.Visible = false;
                btnAddToWishlist.Visible = false;
            }

            //samle downlaods
            if(pnlDownloadSample != null && hlDownloadSample != null)
            {
                if(productVariant.IsDownload && productVariant.HasSampleDownload)
                {
                    pnlDownloadSample.Visible = true;
                    hlDownloadSample.NavigateUrl = this.DownloadService.GetSampleDownloadUrl(productVariant);
                }
                else
                {
                    pnlDownloadSample.Visible = false;
                }
            }

            //final check - hide prices for non-registered customers
            if (!this.SettingManager.GetSettingValueBoolean("Common.HidePricesForNonRegistered") ||
                    (NopContext.Current.User != null &&
                    !NopContext.Current.User.IsGuest))
            {
                //
            }
            else
            {
                txtCustomerEnteredPrice.Visible = false;
                txtQuantity.Visible = false;
                btnAddToCart.Visible = false;
                btnAddToWishlist.Visible = false;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
           // pnlProductReviews.Visible = ctrlProductReviews.Visible;
            //pnlProductSpecs.Visible = ctrlProductSpecs.Visible;
           // pnlProductTags.Visible = ctrlProductTags.Visible;
           // ProductsTabs.Visible = pnlProductReviews.Visible ||
             //   pnlProductSpecs.Visible ||
              //  pnlProductTags.Visible;

            //little hack here
         //   if (pnlProductTags.Visible)
                ProductsTabs.ActiveTab = pnlProductTags;            
           // if (pnlProductReviews.Visible)
                ProductsTabs.ActiveTab = pnlProductReviews;
           // if (pnlProductSpecs.Visible)
                ProductsTabs.ActiveTab = pnlProductSpecs;
           // if (pnlProductGuaranty.Visible)
            //    ProductsTabs.ActiveTab = pnlProductGuaranty;

            BindJQuery();

            //string slimBox = CommonHelper.GetStoreLocation() + "Scripts/slimbox2.js";
            string slimBox = CommonHelper.GetStoreLocation() + "Scripts/fresco.js";
            string cloudRoom = CommonHelper.GetStoreLocation() + "Scripts/cloud-zoom.1.0.2.js";
            Page.ClientScript.RegisterClientScriptInclude(slimBox, slimBox);
            Page.ClientScript.RegisterClientScriptInclude(cloudRoom, cloudRoom);

            base.OnPreRender(e);
        }

        public int ProductId
        {
            get
            {
                return CommonHelper.QueryStringInt("ProductId");
            }
        }

        public ProductVariant ProductVariant
        {
            get
            {
                Product product = this.ProductService.GetProductById(this.ProductId);
                if(product == null && product.ProductVariants.Count == 0)
                {
                    return null;
                }
                return product.ProductVariants[0];
            }
        }

        public List<ProductVariant> ProductVariants
        {
            get
            {
                Product product = this.ProductService.GetProductById(this.ProductId);
                if (product == null && product.ProductVariants.Count == 0)
                {
                    return null;
                }
                return product.ProductVariants;
            }
        }

        protected void OnCommand(object source, CommandEventArgs e)
        {
            var pv = ProductVariant;
            if(pv == null)
            {
                return;
            }

            string attributes = ctrlProductAttributes.SelectedAttributes;
            decimal customerEnteredPrice = txtCustomerEnteredPrice.Value;
            decimal customerEnteredPriceConverted = this.CurrencyService.ConvertCurrency(customerEnteredPrice, NopContext.Current.WorkingCurrency, this.CurrencyService.PrimaryStoreCurrency);
            int quantity = txtQuantity.Value;

            //gift cards
            if(pv.IsGiftCard)
            {
                string recipientName = ctrlGiftCardAttributes.RecipientName;
                string recipientEmail = ctrlGiftCardAttributes.RecipientEmail;
                string senderName = ctrlGiftCardAttributes.SenderName;
                string senderEmail = ctrlGiftCardAttributes.SenderEmail;
                string giftCardMessage = ctrlGiftCardAttributes.GiftCardMessage;

                attributes = ProductAttributeHelper.AddGiftCardAttribute(attributes, recipientName, recipientEmail, senderName, senderEmail, giftCardMessage);
            }

            try
            {
                if(e.CommandName == "AddToCart")
                {
                    string sep = "<br />";
                    var addToCartWarnings = this.ShoppingCartService.AddToCart(
                        ShoppingCartTypeEnum.ShoppingCart,
                        pv.ProductVariantId, 
                        attributes,
                        customerEnteredPriceConverted,
                        quantity);
                    if(addToCartWarnings.Count == 0)
                    {
                        if (this.SettingManager.GetSettingValueBoolean("Display.Products.DisplayCartAfterAddingProduct"))
                        {
                            //redirect to shopping cart page
                            Response.Redirect(SEOHelper.GetShoppingCartUrl());
                        }
                        else
                        {
                            //display notification message
                            this.DisplayAlertMessage(GetLocaleResourceString("Products.ProductHasBeenAddedToTheCart"));
                        }
                    }
                    else
                    {
                        var addToCartWarningsSb = new StringBuilder();
                        for(int i = 0; i < addToCartWarnings.Count; i++)
                        {
                            addToCartWarningsSb.Append(Server.HtmlEncode(addToCartWarnings[i]));
                            if(i != addToCartWarnings.Count - 1)
                            {
                                addToCartWarningsSb.Append(sep);
                            }
                        }
                        string errorFull = addToCartWarningsSb.ToString();
                        lblError.Text = errorFull;
                        if (this.SettingManager.GetSettingValueBoolean("Common.ShowAlertForProductAttributes"))
                        {
                            errorFull = Server.HtmlDecode(errorFull);
                            this.DisplayAlertMessage(errorFull.Replace(sep, "\\n"));
                        }
                    }
                }

                if(e.CommandName == "AddToWishlist")
                {
                    string sep = "<br />";
                    var addToCartWarnings = this.ShoppingCartService.AddToCart(
                        ShoppingCartTypeEnum.Wishlist,
                        pv.ProductVariantId, 
                        attributes,
                        customerEnteredPriceConverted,
                        quantity);
                    if(addToCartWarnings.Count == 0)
                    {
                        Response.Redirect(SEOHelper.GetWishlistUrl());
                    }
                    else
                    {
                        var addToCartWarningsSb = new StringBuilder();
                        for(int i = 0; i < addToCartWarnings.Count; i++)
                        {
                            addToCartWarningsSb.Append(Server.HtmlEncode(addToCartWarnings[i]));
                            if(i != addToCartWarnings.Count - 1)
                            {
                                addToCartWarningsSb.Append(sep);
                            }
                        }
                        string errorFull = addToCartWarningsSb.ToString();
                        lblError.Text = errorFull;
                        if (this.SettingManager.GetSettingValueBoolean("Common.ShowAlertForProductAttributes"))
                        {
                            this.DisplayAlertMessage(errorFull.Replace(sep, "\\n"));
                        }
                    }
                }
            }
            catch(Exception exc)
            {
                this.LogService.InsertLog(LogTypeEnum.CustomerError, exc.Message, exc);
                lblError.Text = Server.HtmlEncode(exc.Message);
            }
        }
    }
}