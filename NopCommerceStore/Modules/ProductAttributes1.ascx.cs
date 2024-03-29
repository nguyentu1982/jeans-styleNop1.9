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
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.Products.Attributes;
using NopSolutions.NopCommerce.BusinessLogic.Tax;
using NopSolutions.NopCommerce.Common.Utils;
using System.Globalization;
using NopSolutions.NopCommerce.Controls;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductAttributesControl1: BaseNopFrontendUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateAttributeControls();
        }

        public void CreateAttributeControls()
        {
            ProductBox1Control productBoxControl = Parent as ProductBox1Control;
            Product product = productBoxControl.Product;

            if (this.Visible == false)
                return;

            if (product == null)
            {
                return;
            }

            var productVariant = product.ProductVariants[0];

            if (productVariant.ManageInventory == 1 & productVariant.StockQuantity == 0)
            {
                return;
            }
            
            if (productVariant != null)
            {
                this.phAttributes.Controls.Clear();
                var productVariantAttributes = productVariant.ProductVariantAttributes;
                if (productVariantAttributes.Count > 0)
                {
                    StringBuilder adjustmentTableScripts = new StringBuilder();
                    StringBuilder attributeScripts = new StringBuilder();

                    this.Visible = true;
                    bool isOutOfStock = true;
                    string attributeTitleID = string.Empty;
                    foreach (var attribute in productVariantAttributes)
                    {
                        if (attribute.ProductAttribute.Name.ToLower() == "size")
                        {
                            var divAttribute = new Panel();
                            var attributeTitle = new Label();
                            attributeTitle.ID = attribute.ProductAttributeId.ToString();
                            attributeTitleID = attribute.ProductAttributeId.ToString();
                            if (attribute.IsRequired)
                                attributeTitle.Text = "<span>*</span> ";

                            //text prompt / title
                            string textPrompt = string.Empty;
                            if (!string.IsNullOrEmpty(attribute.TextPrompt))
                                textPrompt = attribute.TextPrompt;
                            else
                                textPrompt = attribute.ProductAttribute.LocalizedName;

                            attributeTitle.Text += Server.HtmlEncode(textPrompt);
                            attributeTitle.Style.Add("font-weight", "bold");

                            //description
                            if (!string.IsNullOrEmpty(attribute.ProductAttribute.LocalizedDescription))
                                attributeTitle.Text += string.Format("<br /><span>{0}</span>", Server.HtmlEncode(attribute.ProductAttribute.LocalizedDescription));

                            bool addBreak = true;
                            switch (attribute.AttributeControlType)
                            {
                                case AttributeControlTypeEnum.TextBox:
                                    {
                                        addBreak = false;
                                    }
                                    break;
                                default:
                                    break;
                            }
                            if (addBreak)
                            {
                                attributeTitle.Text += "<br />";
                            }
                            else
                            {
                                attributeTitle.Text += "&nbsp;&nbsp;&nbsp;";
                            }
                            attributeTitle.Text = GetLocaleResourceString("Product.ProductAttribute.Size");
                            divAttribute.Controls.Add(attributeTitle);
                            phAttributes.Controls.Add(divAttribute);

                            string controlId = string.Format("{0}_{1}", attribute.ProductAttribute.ProductAttributeId, attribute.ProductVariantAttributeId);
                            switch (attribute.AttributeControlType)
                            {
                                case AttributeControlTypeEnum.DropdownList:
                                    {
                                        var ddlAttributes = new DropDownList();
                                        ddlAttributes.ID = controlId;
                                        divAttribute.Controls.Add(ddlAttributes);
                                        ddlAttributes.Items.Clear();

                                        //dynamic price update
                                        if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                        {
                                            adjustmentTableScripts.AppendFormat("{0}['{1}'] = new Array(", AdjustmentTableName, ddlAttributes.ClientID);
                                            attributeScripts.AppendFormat("$('#{0}').change(function(){{{1}();}});\n", ddlAttributes.ClientID, AdjustmentFuncName);
                                        }

                                        int numberOfJsArrayItems = 0;
                                        if (!attribute.IsRequired)
                                        {
                                            ddlAttributes.Items.Add(new ListItem("---", "0"));

                                            //dynamic price update
                                            if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                            {
                                                adjustmentTableScripts.AppendFormat(CultureInfo.InvariantCulture, "{0},", decimal.Zero);
                                                numberOfJsArrayItems++;
                                            }
                                        }
                                        var pvaValues = attribute.ProductVariantAttributeValues;

                                        //values
                                        bool preSelectedSet = false;
                                        foreach (var pvaValue in pvaValues)
                                        {
                                            string pvaValueName = pvaValue.LocalizedName;

                                            //display price if allowed
                                            if (!this.HidePrices &&
                                                (!this.SettingManager.GetSettingValueBoolean("Common.HidePricesForNonRegistered") ||
                                                (NopContext.Current.User != null &&
                                                !NopContext.Current.User.IsGuest)))
                                            {
                                                decimal taxRate = decimal.Zero;
                                                decimal priceAdjustmentBase = this.TaxService.GetPrice(productVariant, pvaValue.PriceAdjustment, out taxRate);
                                                decimal priceAdjustment = this.CurrencyService.ConvertCurrency(priceAdjustmentBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
                                                if (priceAdjustmentBase > decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [+{0}]", PriceHelper.FormatPrice(priceAdjustment, false, false));
                                                }
                                                else if (priceAdjustmentBase < decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [-{0}]", PriceHelper.FormatPrice(-priceAdjustment, false, false));
                                                }

                                                //dynamic price update
                                                if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                                {
                                                    adjustmentTableScripts.AppendFormat(CultureInfo.InvariantCulture, "{0},", (float)priceAdjustment);
                                                    numberOfJsArrayItems++;
                                                }
                                            }

                                            var pvaValueItem = new ListItem(pvaValueName, pvaValue.ProductVariantAttributeValueId.ToString());
                                            if (!preSelectedSet && pvaValue.IsPreSelected)
                                            {
                                                pvaValueItem.Selected = pvaValue.IsPreSelected;
                                                preSelectedSet = true;
                                            }
                                            ddlAttributes.Items.Add(pvaValueItem);
                                        }

                                        //dynamic price update
                                        if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                        {
                                            //If you create an array with a single numeric parameter, that number is used for specifying the number of elements in this array.
                                            //so have a little hack here (we need at least two elements)
                                            if (numberOfJsArrayItems == 1)
                                            {
                                                adjustmentTableScripts.AppendFormat(CultureInfo.InvariantCulture, "{0},", decimal.Zero);
                                            }
                                        }

                                        //dynamic price update
                                        if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                        {
                                            adjustmentTableScripts.Length -= 1;
                                            adjustmentTableScripts.Append(");\n");
                                        }
                                    }
                                    break;
                                case AttributeControlTypeEnum.RadioList:
                                    {
                                        var rblAttributes = new RadioButtonList();
                                        rblAttributes.ID = controlId;
                                        divAttribute.Controls.Add(rblAttributes);
                                        rblAttributes.Items.Clear();
                                        rblAttributes.CssClass = "attribute-radioList";
                                        var pvaValues = attribute.ProductVariantAttributeValues;
                                        rblAttributes.RepeatColumns = pvaValues.Count;

                                        bool preSelectedSet = false;

                                        foreach (var pvaValue in pvaValues)
                                        {

                                            string pvaValueName = pvaValue.LocalizedName;

                                            //display price if allowed
                                            if (!this.HidePrices &&
                                                (!this.SettingManager.GetSettingValueBoolean("Common.HidePricesForNonRegistered") ||
                                                (NopContext.Current.User != null &&
                                                !NopContext.Current.User.IsGuest)))
                                            {
                                                decimal taxRate = decimal.Zero;
                                                decimal priceAdjustmentBase = this.TaxService.GetPrice(productVariant, pvaValue.PriceAdjustment, out taxRate);
                                                decimal priceAdjustment = this.CurrencyService.ConvertCurrency(priceAdjustmentBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
                                                if (priceAdjustmentBase > decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [+{0}]", PriceHelper.FormatPrice(priceAdjustment, false, false));
                                                }
                                                else if (priceAdjustmentBase < decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [-{0}]", PriceHelper.FormatPrice(-priceAdjustment, false, false));
                                                }

                                                //dynamic price update
                                                if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                                {
                                                    adjustmentTableScripts.AppendFormat(CultureInfo.InvariantCulture, "{0}['{1}_{2}'] = {3};\n", AdjustmentTableName, rblAttributes.ClientID, rblAttributes.Items.Count, (float)priceAdjustment);
                                                    attributeScripts.AppendFormat("$('#{0}_{1}').click(function(){{{2}();}});\n", rblAttributes.ClientID, rblAttributes.Items.Count, AdjustmentFuncName);
                                                }
                                            }

                                            var pvaValueItem = new ListItem(Server.HtmlEncode(pvaValueName), pvaValue.ProductVariantAttributeValueId.ToString());
                                            if (!preSelectedSet && pvaValue.IsPreSelected)
                                            {
                                                pvaValueItem.Selected = pvaValue.IsPreSelected;
                                                preSelectedSet = true;
                                            }
                                            rblAttributes.Items.Add(pvaValueItem);

                                            if ((ManageInventoryMethodEnum)productVariant.ManageInventory == ManageInventoryMethodEnum.ManageStockByAttributes)
                                            {
                                                string selectedAttributes = string.Empty;
                                                selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                                    attribute, pvaValue.ProductVariantAttributeValueId.ToString());

                                                var combinations = ProductAttributeService.FindProductVariantAttributeCombinationDisplayOnProductBox(productVariant.ProductVariantId, selectedAttributes);
                                                var stockQuantity = 0;
                                                if (combinations != null)
                                                {
                                                    foreach (ProductVariantAttributeCombination com in combinations)
                                                    {
                                                        if (com.AllowOutOfStockOrders)
                                                        {
                                                            stockQuantity = 1;
                                                        }
                                                        else
                                                        {
                                                            stockQuantity += com.StockQuantity;
                                                        }

                                                    }

                                                    if (stockQuantity <= 0)
                                                    {
                                                        rblAttributes.Items.Remove(pvaValueItem);
                                                    }
                                                    else
                                                    {
                                                        isOutOfStock = false;
                                                    }
                                                }
                                                if (combinations == null)
                                                {
                                                    rblAttributes.Items.Remove(pvaValueItem);
                                                }
                                            }
                                        }
                                    }
                                    break;
                                case AttributeControlTypeEnum.Checkboxes:
                                    {
                                        var cblAttributes = new CheckBoxList();
                                        cblAttributes.ID = controlId;
                                        divAttribute.Controls.Add(cblAttributes);
                                        cblAttributes.Items.Clear();

                                        //values
                                        var pvaValues = attribute.ProductVariantAttributeValues;
                                        foreach (var pvaValue in pvaValues)
                                        {
                                            string pvaValueName = pvaValue.LocalizedName;

                                            //display price if allowed
                                            if (!this.HidePrices &&
                                                (!this.SettingManager.GetSettingValueBoolean("Common.HidePricesForNonRegistered") ||
                                                (NopContext.Current.User != null &&
                                                !NopContext.Current.User.IsGuest)))
                                            {
                                                decimal taxRate = decimal.Zero;
                                                decimal priceAdjustmentBase = this.TaxService.GetPrice(productVariant, pvaValue.PriceAdjustment, out taxRate);
                                                decimal priceAdjustment = this.CurrencyService.ConvertCurrency(priceAdjustmentBase, this.CurrencyService.PrimaryStoreCurrency, NopContext.Current.WorkingCurrency);
                                                if (priceAdjustmentBase > decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [+{0}]", PriceHelper.FormatPrice(priceAdjustment, false, false));
                                                }
                                                else if (priceAdjustmentBase < decimal.Zero)
                                                {
                                                    pvaValueName += string.Format(" [-{0}]", PriceHelper.FormatPrice(-priceAdjustment, false, false));
                                                }

                                                //dynamic price update
                                                if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                                                {
                                                    adjustmentTableScripts.AppendFormat(CultureInfo.InvariantCulture, "{0}['{1}_{2}'] = {3};\n", AdjustmentTableName, cblAttributes.ClientID, cblAttributes.Items.Count, (float)priceAdjustment);
                                                    attributeScripts.AppendFormat("$('#{0}_{1}').click(function(){{{2}();}});\n", cblAttributes.ClientID, cblAttributes.Items.Count, AdjustmentFuncName);
                                                }
                                            }

                                            var pvaValueItem = new ListItem(Server.HtmlEncode(pvaValueName), pvaValue.ProductVariantAttributeValueId.ToString());
                                            pvaValueItem.Selected = pvaValue.IsPreSelected;
                                            cblAttributes.Items.Add(pvaValueItem);
                                        }
                                    }
                                    break;
                                case AttributeControlTypeEnum.TextBox:
                                    {
                                        var txtAttribute = new TextBox();
                                        txtAttribute.Width = this.SettingManager.GetSettingValueInteger("ProductAttribute.Textbox.Width", 300);
                                        txtAttribute.ID = controlId;
                                        divAttribute.Controls.Add(txtAttribute);
                                    }
                                    break;
                                case AttributeControlTypeEnum.MultilineTextbox:
                                    {
                                        var txtAttribute = new TextBox();
                                        txtAttribute.ID = controlId;
                                        txtAttribute.TextMode = TextBoxMode.MultiLine;
                                        txtAttribute.Width = this.SettingManager.GetSettingValueInteger("ProductAttribute.MultiTextbox.Width", 300);
                                        txtAttribute.Height = this.SettingManager.GetSettingValueInteger("ProductAttribute.MultiTextbox.Height", 150);
                                        divAttribute.Controls.Add(txtAttribute);
                                    }
                                    break;
                                case AttributeControlTypeEnum.Datepicker:
                                    {
                                        var datePicker = new NopDatePicker();
                                        //changes these properties in order to change year range
                                        datePicker.FirstYear = DateTime.Now.Year;
                                        datePicker.LastYear = DateTime.Now.Year + 1;
                                        datePicker.ID = controlId;
                                        divAttribute.Controls.Add(datePicker);
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                    }

                    if (isOutOfStock)
                    {
                        

                        Label attributeTitle = this.FindControl(attributeTitleID) as Label;
                        if(attributeTitle!= null)
                        {
                            attributeTitle.Text = this.GetLocaleResourceString("Products.OutOfStock");
                            attributeTitle.CssClass = "stock";
                        }
                            
                        //Button addtoCard = Parent.FindControl("btnAddToCart") as Button;
                        //addtoCard.Enabled = false;
                    }
                    //display price if allowed
                    if (!this.HidePrices &&
                        (!this.SettingManager.GetSettingValueBoolean("Common.HidePricesForNonRegistered") ||
                        (NopContext.Current.User != null &&
                        !NopContext.Current.User.IsGuest)))
                    {
                        //dynamic price update
                        if (this.SettingManager.GetSettingValueBoolean("ProductAttribute.EnableDynamicPriceUpdate"))
                        {
                            lblAdjustmentTableScripts.Text = adjustmentTableScripts.ToString();
                            lblAttributeScripts.Text = attributeScripts.ToString();
                            phDynPrice.Visible = true;
                        }
                        else
                        {
                            phDynPrice.Visible = false;
                        }
                    }
                    else
                    {
                        phDynPrice.Visible = false;
                    }
                }
                else
                {
                    this.Visible = false;
                }
            }
            else
            {
                this.Visible = false;
            }
        }

        public string SelectedAttributes
        {
            get
            {
                string selectedAttributes = string.Empty;
                var productVariantAttributes = this.ProductAttributeService.GetProductVariantAttributesByProductVariantId(this.ProductVariantId);
                foreach (ProductVariantAttribute attribute in productVariantAttributes)
                {
                    string controlId = string.Format("{0}_{1}", attribute.ProductAttribute.ProductAttributeId, attribute.ProductVariantAttributeId);
                    switch (attribute.AttributeControlType)
                    {
                        case AttributeControlTypeEnum.DropdownList:
                            {
                                var ddlAttributes = phAttributes.FindControl(controlId) as DropDownList;
                                if (ddlAttributes != null)
                                {
                                    int selectedAttributeId = 0;
                                    if (!String.IsNullOrEmpty(ddlAttributes.SelectedValue))
                                    {
                                        selectedAttributeId = int.Parse(ddlAttributes.SelectedValue);
                                    }
                                    if (selectedAttributeId > 0)
                                    {
                                        selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                            attribute, selectedAttributeId.ToString());
                                    }
                                }
                            }
                            break;
                        case AttributeControlTypeEnum.RadioList:
                            {
                                var rblAttributes =
                                    phAttributes.FindControl(controlId) as RadioButtonList;
                                if (rblAttributes != null)
                                {
                                    int selectedAttributeId = 0;
                                    if (!String.IsNullOrEmpty(rblAttributes.SelectedValue))
                                    {
                                        selectedAttributeId = int.Parse(rblAttributes.SelectedValue);
                                    }
                                    if (selectedAttributeId > 0)
                                    {
                                        selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                            attribute, selectedAttributeId.ToString());
                                    }
                                }
                            }
                            break;
                        case AttributeControlTypeEnum.Checkboxes:
                            {
                                var cblAttributes = phAttributes.FindControl(controlId) as CheckBoxList;
                                if (cblAttributes != null)
                                {
                                    foreach (ListItem item in cblAttributes.Items)
                                    {
                                        if (item.Selected)
                                        {
                                            int selectedAttributeId = 0;
                                            if (!String.IsNullOrEmpty(item.Value))
                                            {
                                                selectedAttributeId = int.Parse(item.Value);
                                            }
                                            if (selectedAttributeId > 0)
                                            {
                                                selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes, 
                                                    attribute, selectedAttributeId.ToString());
                                            }
                                        }
                                    }
                                }
                            }
                            break;
                        case AttributeControlTypeEnum.TextBox:
                            {
                                var txtAttribute = phAttributes.FindControl(controlId) as TextBox;
                                if (txtAttribute != null)
                                {
                                    string enteredText = txtAttribute.Text.Trim();
                                    if (!String.IsNullOrEmpty(enteredText))
                                    {
                                        selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                            attribute, enteredText);
                                    }
                                }
                            }
                            break;
                        case AttributeControlTypeEnum.MultilineTextbox:
                            {
                                var txtAttribute = phAttributes.FindControl(controlId) as TextBox;
                                if (txtAttribute != null)
                                {
                                    string enteredText = txtAttribute.Text.Trim();
                                    if (!String.IsNullOrEmpty(enteredText))
                                    {
                                        selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                            attribute, enteredText);
                                    }
                                }
                            }
                            break;
                        case AttributeControlTypeEnum.Datepicker:
                            {
                                var datePicker = phAttributes.FindControl(controlId) as NopDatePicker;
                                if (datePicker != null)
                                {
                                    DateTime? selectedDate = datePicker.SelectedDate;
                                    if (selectedDate.HasValue)
                                    {
                                        selectedAttributes = ProductAttributeHelper.AddProductAttribute(selectedAttributes,
                                            attribute, selectedDate.Value.ToString("D"));
                                    }
                                }
                            }
                            break;
                        default:
                            break;
                    }
                }
                return selectedAttributes;
            }
        }

        public int ProductVariantId
        {
            get
            {
                if (ViewState["ProductVariantId"] == null)
                    return 0;
                else
                    return (int)ViewState["ProductVariantId"];
            }
            set
            {
                ViewState["ProductVariantId"] = value;
            }
        }

        public string AdjustmentTableName
        {
            get
            {
                return String.Format("adjustmentTable_{0}", ProductVariantId);
            }
        }

        public string AdjustmentFuncName
        {
            get
            {
                return String.Format("adjustPrice_{0}", ProductVariantId);
            }
        }

        public string PriceVarName
        {
            get
            {
                return String.Format("priceValForDynUpd_{0}", ProductVariantId);
            }
        }

        public string PriceVarClass
        {
            get
            {
                return String.Format("price-val-for-dyn-upd-{0}", ProductVariantId);
            }
        }

        public bool HidePrices
        {
            get
            {
                if (ViewState["HidePrices"] == null)
                    return false;
                else
                    return (bool)ViewState["HidePrices"];
            }
            set
            {
                ViewState["HidePrices"] = value;
            }
        }
        
    }
}