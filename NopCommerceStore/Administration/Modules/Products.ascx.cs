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
    public partial class ProductsControl : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropDowns();
                if (this.SettingManager.GetSettingValueBoolean("Admin.LoadAllProducts"))
                {
                    BindGrid();
                }
            }

            //buttons
            btnPDFExport.Visible = this.SettingManager.GetSettingValueBoolean("Features.SupportPDF");
            btnExportXLS.Visible = this.SettingManager.GetSettingValueBoolean("Features.SupportExcel");
            btnImportXLS.Visible = this.SettingManager.GetSettingValueBoolean("Features.SupportExcel");
        }

        protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvProducts.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Product product = (Product)e.Row.DataItem;

                Image imgProduct = e.Row.FindControl("imgProduct") as Image;
                if (imgProduct != null &&
                    this.SettingManager.GetSettingValueBoolean("Display.ShowAdminProductImages"))
                {
                    imgProduct.ImageUrl = GetProductImageUrl(product);
                }
                else
                {
                    imgProduct.Visible = false;
                }


                Panel pnlVariants = e.Row.FindControl("pnlVariants") as Panel;
                if (pnlVariants != null)
                {
                    //product variants
                    var productVariants = product.ProductVariants;
                    if (productVariants.Count == 0)
                    {
                        pnlVariants.Visible = false;
                    }
                    else
                    {
                        GridView gvVariants = e.Row.FindControl("gvVariants") as GridView;
                        if (gvVariants != null)
                        {
                            gvVariants.DataSource = productVariants;
                            gvVariants.DataBind();
                        }
                    }
                }
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            BindJQuery();

            base.OnPreRender(e);
        }

        protected void FillDropDowns()
        {
            ParentCategory.EmptyItemText = GetLocaleResourceString("Admin.Common.All");
            ParentCategory.BindData();

            this.ddlManufacturer.Items.Clear();
            ListItem itemEmptyManufacturer = new ListItem(GetLocaleResourceString("Admin.Common.All"), "0");
            this.ddlManufacturer.Items.Add(itemEmptyManufacturer);
            var manufacturers = this.ManufacturerService.GetAllManufacturers();
            foreach (Manufacturer manufacturer in manufacturers)
            {
                ListItem item2 = new ListItem(manufacturer.Name, manufacturer.ManufacturerId.ToString());
                this.ddlManufacturer.Items.Add(item2);
            }
        }
        
        protected List<Product> GetProducts()
        {
            string productName = txtProductName.Text;
            int categoryId = ParentCategory.SelectedCategoryId;
            int manufacturerId = int.Parse(this.ddlManufacturer.SelectedItem.Value);

            int totalRecords = 0;
            var products = this.ProductService.GetAllProducts(categoryId, 
                manufacturerId, 0, null, null, null, productName, 
                false, int.MaxValue, 0, null, 
                ProductSortingEnum.CreatedOn, out totalRecords);
            return products;
        }

        protected List<Product> GetProductsFace()
        {
            string productName = txtProductName.Text;
            int categoryId = ParentCategory.SelectedCategoryId;
            int manufacturerId = int.Parse(this.ddlManufacturer.SelectedItem.Value);

            int totalRecords = 0;
            var products = this.ProductService.GetAllProducts(categoryId,
                manufacturerId, 0, null, null, null, productName,
                false, int.MaxValue, 0, null,
                ProductSortingEnum.Position, out totalRecords);
            return products;
        }

        protected void BindGrid()
        {
            var products = GetProducts();
            if (products.Count > 0)
            {
                this.gvProducts.Visible = true;
                this.lblNoProductsFound.Visible = false;
                this.gvProducts.DataSource = products;
                this.gvProducts.DataBind();
            }
            else
            {
                this.gvProducts.Visible = false;
                this.lblNoProductsFound.Visible = true;
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    BindGrid();
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void BtnPDFExport_OnClick(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("products_{0}_{1}.pdf", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4));
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);

                    PDFHelper.PrintProductsToPdf(GetProducts(), filePath);

                    CommonHelper.WriteResponsePdf(filePath, fileName);
                }
                catch(Exception ex)
                {
                    ProcessException(ex);
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
                try
                {
                    foreach (GridViewRow row in gvProducts.Rows)
                    {
                        var cbProduct = row.FindControl("cbProduct") as CheckBox;
                        var hfProductId = row.FindControl("hfProductId") as HiddenField;

                        bool isChecked = cbProduct.Checked;
                        int productId = int.Parse(hfProductId.Value);
                        if (isChecked)
                        {
                            this.ProductService.MarkProductAsDeleted(productId);
                        }
                    }

                    BindGrid();
                }
                catch(Exception ex)
                {
                    ProcessException(ex);
                }
        }


        protected void btnUpdatePicURL_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in gvProducts.Rows)
                {
                    var cbProduct = row.FindControl("cbProduct") as CheckBox;
                    var hfProductId = row.FindControl("hfProductId") as HiddenField;

                    bool isChecked = cbProduct.Checked;
                    int productId = int.Parse(hfProductId.Value);
                    if (isChecked)
                    {
                        this.ProductService.UpdatePic(productId);
                    }
                }

                BindGrid();
            }
            catch (Exception ex)
            {
                ProcessException(ex);
            }
        }

        protected void btnExportXML_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = String.Format("products_{0}.xml", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"));
                    
                    var products = GetProducts();
                    string xml = this.ExportManager.ExportProductsToXml(products);
                    CommonHelper.WriteResponseXml(xml, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }
        
        protected void btnExportXLS_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("products_{0}_{1}.xls", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4));
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);
                    var products = GetProducts();

                    this.ExportManager.ExportProductsToXls(filePath, products);
                    CommonHelper.WriteResponseXls(filePath, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnExportXLSRemarketing_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("productsRemarketing_{0}_{1}.xls", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4));
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);
                    var products = GetProducts();

                    this.ExportManager.ExportProductsToXlsRemarketing(filePath, products);
                    CommonHelper.WriteResponseXls(filePath, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnDownLoadImgs_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {                   
                    string folderPath = Server.MapPath(this.GetLocaleResourceString("Download.LocalPath"));
                    var products = GetProducts();

                    this.ExportManager.DownLoadImgs(products, folderPath, cbOnlyDefault.Checked);
                    
                    
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }
        protected void btnExportXLSRemarketingFace_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("productsRemarketingFace_{0}_{1}.xls", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4));
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);
                    var products = GetProductsFace();

                    this.ExportManager.ExportProductsToXlsRemarketingFace(filePath, products);
                    CommonHelper.WriteResponseXls(filePath, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnImportXLS_Click(object sender, EventArgs e)
        {
            if (fuXlsFile.PostedFile != null && !String.IsNullOrEmpty(fuXlsFile.FileName))
            {
                try
                {
                    byte[] fileBytes = fuXlsFile.FileBytes;
                    string extension = "xls";
                    if (fuXlsFile.FileName.EndsWith("xlsx"))
                        extension = "xlsx";

                    string fileName = string.Format("products_{0}_{1}.{2}", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4), extension);
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);

                    File.WriteAllBytes(filePath, fileBytes);
                    this.ImportManager.ImportProductsFromXls(filePath);

                    BindGrid();
                }
                catch (Exception ex)
                {
                    ProcessException(ex);
                }
            }
        }

        public string GetProductImageUrl(Product product)
        {
            var picture = product.DefaultPicture;
            if (picture != null)
            {
                return this.PictureService.GetPictureUrl(picture, this.SettingManager.GetSettingValueInteger("Media.ShoppingCart.ThumbnailImageSize", 80));
            }
            else
            {
                return this.PictureService.GetDefaultPictureUrl(this.SettingManager.GetSettingValueInteger("Media.ShoppingCart.ThumbnailImageSize", 80));
            }
        }

        protected void btnGoDirectlyToSKU_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string sku = txtSKU.Text.Trim();
                    var pv = this.ProductService.GetProductVariantBySKU(sku);
                    if (pv != null)
                    {
                        string url = string.Format("{0}ProductVariantDetails.aspx?ProductVariantId={1}", CommonHelper.GetStoreAdminLocation(), pv.ProductVariantId);
                        Response.Redirect(url);
                    }
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected string GetProductVariantName(ProductVariant productVariant)
        {
            string variantName = string.Empty;
            if (!String.IsNullOrEmpty(productVariant.Name))
                variantName = productVariant.Name;
            else
                variantName = GetLocaleResourceString("Admin.Products.ProductVariants.Unnamed");

            return variantName;
        }

        public void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (index  >= gvProducts.PageSize)
                index = index - gvProducts.PageSize;
            if(e.CommandName =="UpTop")
            {                
                GridViewRow row = gvProducts.Rows[index];
                HiddenField hdproductId = row.FindControl("hfProductId") as HiddenField;
                int productId = int.Parse(hdproductId.Value);
                this.ProductService.UpTop(productId);
            }
            if(e.CommandName=="UpdatePic")
            {                
                GridViewRow row = gvProducts.Rows[index];
                HiddenField hdproductId = row.FindControl("hfProductId") as HiddenField;
                int productId = int.Parse(hdproductId.Value);
                this.ProductService.UpdatePic(productId);
            }
        }
    }
}